package com.poly.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import com.poly.dao.CategoryDAO;
import com.poly.dao.CategoryDAOImpl;
import com.poly.dao.VideoDAO;
import com.poly.dao.VideoDAOImpl;
import com.poly.entity.Category;
import com.poly.entity.Video;

@WebServlet({ "/video", "/video/edit/*", "/video/create", "/video/update", "/video/delete", "/video/reset" })
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 100,      // 100MB
    maxRequestSize = 1024 * 1024 * 150    // 150MB
)
public class videoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String SAVE_DIR = "uploads";
    private static final String VIDEO_DIR = "uploads/videos";
    private VideoDAO dao = new VideoDAOImpl();
    private CategoryDAO categoryDAO = new CategoryDAOImpl();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Video form = new Video();
        List<Video> list = new ArrayList<>();
        try {
            BeanUtils.populate(form, req.getParameterMap());
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }

        String path = req.getServletPath();

        try {
        	if (path.equals("/video/edit")) {
        	    String id = req.getPathInfo();
        	    
        	    if (id != null && id.length() > 1) {
        	        id = id.substring(1);
        	        form = dao.findById(id);

        	        if (form != null) {
        	            if (form.getCategory() != null) {
        	                Category category = categoryDAO.findById(form.getCategory().getId());
        	                if (category != null) {
        	                    form.setCategory(category);
        	                }
        	            }
        	            req.setAttribute("imagePath", form.getPoster());
        	        } else {
        	            req.setAttribute("error", "Video không tồn tại.");
        	        }
        	    } else {
        	        req.setAttribute("error", "ID video không hợp lệ.");
        	    }       
            } else if (path.equals("/video/create")) {
                String posterPath = saveFile(req, "poster", SAVE_DIR);
                String videoPath = saveFile(req, "videoFile", VIDEO_DIR);

                form.setPoster(posterPath);
                form.setVideoFile(videoPath); 
                String categoryId = req.getParameter("categoryId");
                if (categoryId != null && !categoryId.isEmpty()) {
                    Category category = categoryDAO.findById(categoryId);
                    form.setCategory(category);
                }
                dao.create(form);
                form = new Video();
            } else if (path.equals("/video/update")) {
                if (form.getId() == null || form.getId().trim().isEmpty()) {
                    throw new IllegalArgumentException("ID của video không được để trống.");
                }
                Video existingVideo = dao.findById(form.getId());
                if (existingVideo == null) {
                    throw new IllegalArgumentException("Video không tồn tại.");
                }
                String posterPath = saveFile(req, "poster", SAVE_DIR);
                String videoPath = saveFile(req, "videoFile", VIDEO_DIR);

                if (posterPath != null) {
                    form.setPoster(posterPath);
                } else {
                    form.setPoster(existingVideo.getPoster());
                }

                if (videoPath != null) {
                    form.setVideoFile(videoPath);
                } else {
                    form.setVideoFile(existingVideo.getVideoFile());
                }
                String categoryId = req.getParameter("categoryId");
                if (categoryId != null && !categoryId.isEmpty()) {
                    Category category = categoryDAO.findById(categoryId);
                    form.setCategory(category);
                } else {
                    form.setCategory(existingVideo.getCategory());
                }
                dao.update(form);
                form = new Video();
            } else if (path.equals("/video/delete")) {
                String id = req.getParameter("id");
                if (id != null && !id.isEmpty()) {
                    dao.deleteById(id);
                }
                form = new Video();
            } else if (path.equals("/video/reset")) {
                form = new Video();
            }
            list = dao.findAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Category> categories = categoryDAO.findAll();
        req.setAttribute("categories", categories);
        req.setAttribute("video", form);
        req.setAttribute("videos", list);
        req.getRequestDispatcher("/html/videoManage.jsp").forward(req, resp);
    }

    /**
     * Lưu file upload lên server
     *
     * @param req       HttpServletRequest
     * @param fileField Tên trường input file (poster hoặc videoFile)
     * @param dir       Thư mục lưu file (uploads hoặc uploads/videos)
     * @return Đường dẫn lưu file hoặc null nếu không có file nào được tải lên
     * @throws IOException
     * @throws ServletException
     */
    private String saveFile(HttpServletRequest req, String fileField, String dir) throws IOException, ServletException {
        Part filePart = req.getPart(fileField);
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String appPath = getServletContext().getRealPath("");
            String savePath = appPath + File.separator + dir;

            File uploadDir = new File(savePath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            String filePath = savePath + File.separator + fileName;
            filePart.write(filePath);
            return dir + "/" + fileName;
        }
        return null;
    }
}
