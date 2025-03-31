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

@WebServlet("/videoDetailsServlet")
public class videoDetailsServlet extends HttpServlet {

	private VideoDAO videoDAO = new VideoDAOImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String videoId = request.getParameter("id");
		Video video = videoDAO.findById(videoId);
		List<Video> newestVideos = videoDAO.findNewestVideos(10);
		request.setAttribute("latestVideos", newestVideos);
		if (video != null) {
			request.setAttribute("video", video);
			request.getRequestDispatcher("/html/videoDetails.jsp").forward(request, response);
		} else {
			response.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy Video");
		}
	}
}
