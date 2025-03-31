package com.poly.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import com.poly.dao.UserDAO;
import com.poly.dao.UserDAOImpl;
import com.poly.entity.User;

@WebServlet({ "/user", "/user/edit/*", "/user/update", "/user/delete" })
public class UserServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDAO dao = new UserDAOImpl();
		User form = new User();
		List<User> list = dao.findAll();

		try {
			BeanUtils.populate(form, req.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}

		String path = req.getServletPath();
		if (path.contains("edit")) {
			String id = req.getPathInfo().substring(1);
			form = dao.findById(id);
		} else if (path.contains("update")) {
			if (form.getId() == null || form.getId().trim().isEmpty()) {
				throw new IllegalArgumentException("ID của người dùng không được để trống.");
			}
			dao.update(form);
			list = dao.findAll();
			form = new User();
		} else if (path.contains("delete")) {
			String id = form.getId();
			dao.deleteById(id);
			form = new User();
			list = dao.findAll();
		}
		req.setAttribute("user", form);
		req.setAttribute("users", list);
		req.getRequestDispatcher("/html/userManage.jsp").forward(req, resp);
	}
}
