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

import com.poly.dao.CategoryDAO;
import com.poly.dao.CategoryDAOImpl;
import com.poly.entity.Category;

@WebServlet({ "/category", "/category/edit/*", "/category/create", "/category/update", "/category/delete",
		"/category/reset" })
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CategoryDAO dao = new CategoryDAOImpl();
		Category form = new Category();
		List<Category> list = dao.findAll();

		try {
			BeanUtils.populate(form, req.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}

		String path = req.getServletPath();
		if (path.contains("edit")) {
			String id = req.getPathInfo().substring(1);
			form = dao.findById(id);
		} else if (path.contains("create")) {
			if (form.getId() == null || form.getId().trim().isEmpty()) {
				req.setAttribute("error", "ID của danh mục không được để trống.");
				req.getRequestDispatcher("/html/Category.jsp").forward(req, resp);
				return;
			}

			if (form.getName() == null || form.getName().trim().isEmpty()) {
				throw new IllegalArgumentException("Tên của danh mục không được để trống.");
			}
			dao.create(form);
			list = dao.findAll();
			req.setAttribute("successMessage", "Danh mục đã được thêm thành công.");
			form = new Category();
		} else if (path.contains("update")) {
			if (form.getId() == null || form.getId().trim().isEmpty()) {
				throw new IllegalArgumentException("ID của danh mục không được để trống.");
			}
			dao.update(form);
			list = dao.findAll();
			req.setAttribute("successMessage", "Danh mục đã được cập nhật thành công.");
			form = new Category();
		} else if (path.contains("delete")) {
			String id = form.getId();
			dao.deleteById(id);
			form = new Category();
			list = dao.findAll();
			req.setAttribute("successMessage", "Danh mục đã được xóa thành công.");
		} else if (path.contains("reset")) {
			form = new Category();
		}
		req.setAttribute("cate", form);
		req.setAttribute("cates", list);
		req.getRequestDispatcher("/html/Category.jsp").forward(req, resp);
	}
}
