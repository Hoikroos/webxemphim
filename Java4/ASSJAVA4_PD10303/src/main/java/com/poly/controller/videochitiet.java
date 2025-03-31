package com.poly.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.poly.dao.VideoDAO;
import com.poly.dao.VideoDAOImpl;
import com.poly.entity.Video;

@WebServlet("/videochitiet")
public class videochitiet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String videoId = request.getParameter("id");
	        if (videoId == null || videoId.trim().isEmpty()) {
	            response.sendRedirect("error.jsp");
	            return;
	        }
	        VideoDAO videoDAO = new VideoDAOImpl(); 
	        Video video = videoDAO.findById(videoId);
	        if (video == null) {
	            response.sendRedirect("notfound.jsp");
	            return;
	        }
	        List<Video> newestVideos = videoDAO.findNewestVideos(5);
	        request.setAttribute("latestVideos", newestVideos);
	        request.setAttribute("video", video);

	        request.getRequestDispatcher("/html/video2.jsp").forward(request, response);
	    }
}
