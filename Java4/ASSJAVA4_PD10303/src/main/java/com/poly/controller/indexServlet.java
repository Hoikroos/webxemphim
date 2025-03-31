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

import com.poly.dao.CategoryDAO;
import com.poly.dao.CategoryDAOImpl;
import com.poly.dao.VideoDAO;
import com.poly.dao.VideoDAOImpl;
import com.poly.entity.Category;
import com.poly.entity.Video;

@WebServlet("/indexServlet")
public class indexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CategoryDAO categoryDAO;
	private VideoDAO videoDAO;

	@Override
	public void init() throws ServletException {
		categoryDAO = new CategoryDAOImpl();
		videoDAO = new VideoDAOImpl();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    try {
	        List<Category> categories = categoryDAO.findAll();
	        Map<Category, List<Video>> categoryVideos = new LinkedHashMap<>();
	        for (Category category : categories) {
	            List<Video> videos = videoDAO.findVideosByCategoryId(category.getId());
	            List<Video> limitedVideos = videos.size() > 4 ? videos.subList(0, 4) : videos;
	            categoryVideos.put(category, limitedVideos);
	        }
	        List<Video> newestVideos = videoDAO.findNewestVideos(15);
	        List<Video> newestVideos1 = videoDAO.findNewestVideos(5);
	        req.setAttribute("categoryVideos", categoryVideos);
	        req.setAttribute("latestVideos", newestVideos);
	        req.setAttribute("latestVideos1", newestVideos1);
	        
	        req.getRequestDispatcher("/html/index.jsp").forward(req, resp);
	    } catch (Exception e) {
	        e.printStackTrace();
	        resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing the request.");
	    }
	}
}
