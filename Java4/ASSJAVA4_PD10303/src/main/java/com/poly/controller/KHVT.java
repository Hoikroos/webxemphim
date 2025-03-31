package com.poly.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.poly.entity.Category;
import com.poly.entity.Video;
import com.poly.dao.CategoryDAO;
import com.poly.dao.CategoryDAOImpl;
import com.poly.dao.VideoDAO;
import com.poly.dao.VideoDAOImpl;

@WebServlet("/categoryvideos")
public class KHVT extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VideoDAO videoDAO;

    @Override
    public void init() throws ServletException {
        videoDAO = new VideoDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String categoryId = req.getParameter("id");

            if (categoryId != null && !categoryId.isEmpty()) {
                List<Video> videos = videoDAO.findVideosByCategoryId(categoryId);
                req.setAttribute("videos", videos);
            } else {
                req.setAttribute("errorMessage", "Danh mục không hợp lệ.");
            }
            req.getRequestDispatcher("/html/categoryFilm.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi xử lý yêu cầu.");
        }
    }
}
