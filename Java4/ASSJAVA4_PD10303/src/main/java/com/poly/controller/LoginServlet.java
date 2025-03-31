package com.poly.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import com.poly.dao.UserDAO;
import com.poly.dao.UserDAOImpl;
import com.poly.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private UserDAO userDAO;

	@Override
	public void init() throws ServletException {
		this.userDAO = new UserDAOImpl();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/html/login.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idOrEmail = request.getParameter("idOrEmail");
		String password = request.getParameter("password");
		String rememberMe = request.getParameter("rememberMe");

		if (idOrEmail == null || password == null || idOrEmail.isBlank() || password.isBlank()) {
			request.setAttribute("errorMessage", "Vui lòng nhập tài khoản và mật khẩu.");
			request.getRequestDispatcher("/html/login.jsp").forward(request, response);
			return;
		}

		User user = userDAO.findByIdOrEmail(idOrEmail);
		if (user == null) {
			request.setAttribute("errorMessage", "Tài khoản không tồn tại.");
			request.getRequestDispatcher("/html/login.jsp").forward(request, response);
			return;
		}
		if (user != null && user.getPassword().equals(password)) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);

			boolean remember = "on".equalsIgnoreCase(rememberMe);
			setRememberMeCookies(response, idOrEmail, password, remember);

			response.sendRedirect(request.getContextPath() + "/indexServlet");
		} else {
			request.setAttribute("errorMessage", "Sai tài khoản hoặc mật khẩu.");
			request.getRequestDispatcher("/html/login.jsp").forward(request, response);
		}
	}

	private void setRememberMeCookies(HttpServletResponse response, String idOrEmail, String password,
			boolean remember) {
		int expiry = remember ? 7 * 24 * 60 * 60 : 0;
		addCookie(response, "idOrEmail", remember ? idOrEmail : "", expiry);
		addCookie(response, "password", remember ? password : "", expiry);
	}

	private void addCookie(HttpServletResponse response, String name, String value, int expiry) {
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(expiry);
		cookie.setHttpOnly(true);
		cookie.setPath("/");
		response.addCookie(cookie);
	}
}
