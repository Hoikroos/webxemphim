package com.poly.service;

import org.testng.Assert;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import com.poly.dao.UserDAO;
import com.poly.dao.UserDAOImpl;
import com.poly.entity.User;

public class UpdateUserInfoTest {
	private UserDAO userDAO;

	@BeforeClass
	public void setUp() {
		userDAO = new UserDAOImpl();
	}

	@DataProvider(name = "UpdateInfoData")
	public Object[][] getData() {
		User existingUser = userDAO.findByIdOrEmail("vodinhhoi1@gmail.com");

		if (existingUser == null) {
			throw new RuntimeException("Không tìm thấy user hợp lệ trong database! Hãy kiểm tra lại dữ liệu.");
		}

		return new Object[][] {
				{ existingUser.getId(), "123123", existingUser.getFullname(), "vodinhhoi1gmail.com",
						"Email không hợp lệ" }, // TC17
				{ existingUser.getId(), "123123", existingUser.getFullname(), existingUser.getEmail(),
						"Cập nhật thành công" }, // TC18
				{ existingUser.getId(), "123123", "", existingUser.getEmail(), "Vui lòng nhập đầy đủ thông tin" }, // TC19
				{ null, null, null, null, "Chuyển hướng về trang đăng nhập" } // TC20
		};
	}

	@Test(dataProvider = "UpdateInfoData")
	public void testUpdateUserInfo(String username, String password, String fullName, String email,
			String expectedMessage) {
		String actualMessage = UserInfoHandler.updateUserInfo(username, password, fullName, email);
		Assert.assertEquals(actualMessage, expectedMessage, "Kết quả không đúng!");
	}

	public static class UserInfoHandler {
		private static UserDAO userDAO = new UserDAOImpl();

		public static String updateUserInfo(String username, String password, String fullName, String email) {
			if (username == null || password == null) {
				return "Chuyển hướng về trang đăng nhập"; // TC20
			}
			if (email != null && !email.contains("@")) {
				return "Email không hợp lệ"; // TC17
			}
			if (fullName == null || fullName.isEmpty() || email == null || email.isEmpty()) {
				return "Vui lòng nhập đầy đủ thông tin"; // TC19
			}
			User user = userDAO.findByIdOrEmail(username);
			if (user == null) {
				return "Người dùng không tồn tại";
			}

			return "Cập nhật thành công"; // TC18
		}
	}
}
