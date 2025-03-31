package com.poly.controller;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.poly.dao.VideoDAO;
import com.poly.dao.VideoDAOImpl;
import com.poly.entity.Video;

@WebServlet("/ShareServlet")
public class ShareServlet extends HttpServlet {
	private VideoDAO videoDAO;

	@Override
	public void init() throws ServletException {
		this.videoDAO = new VideoDAOImpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/html/myFavorite.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Map<String, Object> responseMap = new HashMap<>();
		if (req.getSession(false) == null || req.getSession().getAttribute("user") == null) {
			responseMap.put("status", "error");
			responseMap.put("message", "Bạn cần đăng nhập để chia sẻ video.");
			sendJsonResponse(resp, responseMap);
			return;
		}

		String email = req.getParameter("shareemail");
		String videoId = req.getParameter("videoId");

		if (email == null || email.isEmpty() || videoId == null || videoId.isEmpty()) {
			responseMap.put("status", "error");
			responseMap.put("message", "Email hoặc video không hợp lệ.");
		} else {
			Video video = videoDAO.findById(videoId);
			if (video == null) {
				responseMap.put("status", "error");
				responseMap.put("message", "Video không tồn tại.");
			} else {
				boolean emailSent = sendEmail(email, video);
				if (emailSent) {
					responseMap.put("status", "success");
					responseMap.put("message", "Video đã được gửi tới bạn của bạn.");
				} else {
					responseMap.put("status", "error");
					responseMap.put("message", "Không thể gửi email. Vui lòng thử lại.");
				}
			}
		}
		sendJsonResponse(resp, responseMap);
	}

	private boolean sendEmail(String email, Video video) {
		final String username = "your_email@gmail.com"; // Replace with your email
		final String password = "your_email_password"; // Replace with your email password

		String subject = "Your friend shared a video with you!";
		String content = "Hi there,\n\nYour friend shared the video \"" + video.getTitle()
				+ "\" with you. Watch it here: " + "http://yourwebsite.com/watch?v=" + video.getId() + "\n\nEnjoy!";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
			message.setSubject(subject);
			message.setText(content);

			Transport.send(message);
			return true;

		} catch (MessagingException e) {
			e.printStackTrace();
			return false;
		}
	}

	private void sendJsonResponse(HttpServletResponse resp, Map<String, Object> responseMap) throws IOException {
		resp.setContentType("application/json");
		resp.getWriter().write(new ObjectMapper().writeValueAsString(responseMap));
	}

	@Override
	public void destroy() {
		this.videoDAO = null;
	}
}
