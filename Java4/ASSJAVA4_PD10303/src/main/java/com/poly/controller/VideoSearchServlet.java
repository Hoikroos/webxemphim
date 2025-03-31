package com.poly.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.poly.dao.VideoDAO;
import com.poly.dao.VideoDAOImpl;
import com.poly.entity.Video;

@WebServlet("/VideoSearchServlet")
public class VideoSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VideoDAO videoDAO;

	@Override
	public void init() throws ServletException {
		super.init();
		videoDAO = new VideoDAOImpl();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String videoName = request.getParameter("videoName");

	    response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();

	    try {
	        List<Video> videos = videoDAO.findByName(videoName);

	        if (videos.isEmpty()) {
	            out.println("<p>Không tìm thấy video nào.</p>");
	        } else {
	            for (Video video : videos) {
	                out.println("<div>");
	                out.println("<h2>" + video.getTitle() + "</h2>");
	                out.println("<iframe width='560' height='315' src='" + video.getVideoFile() + "' frameborder='0' allowfullscreen></iframe>");
	                out.println("</div><br>");
	            }
	        }
	    } catch (Exception e) {
	        out.println("<p>Đã xảy ra lỗi: " + e.getMessage() + "</p>");
	    }
	}

}