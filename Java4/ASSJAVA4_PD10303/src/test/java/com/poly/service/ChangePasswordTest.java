package com.poly.service;

import org.testng.Assert;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import com.poly.dao.UserDAO;
import com.poly.dao.UserDAOImpl;
import com.poly.entity.User;

public class ChangePasswordTest {
	private UserDAO userDAO;

	@BeforeClass
	public void setUp() {
		userDAO = new UserDAOImpl();
	}

	@DataProvider(name = "ChangePasswordData")
	public Object[][] getData() {
		User existingUser = userDAO.findByIdOrEmail("vodinhhoi1@gmail.com");

		if (existingUser == null) {
			throw new RuntimeException("Không tìm thấy user hợp lệ trong database! Hãy kiểm tra lại dữ liệu.");
		}

		return new Object[][] { { existingUser.getId(), "2005", "123123", "123123", "Đổi mật khẩu thành công" }, // TC09
				{ existingUser.getId(), "2004", "123123", "123123", "Sai mật khẩu cũ" }, // TC10
				{ existingUser.getId(), "2005", "123123", "123124", "Mật khẩu xác nhận không trùng khớp" }, // TC11
				{ existingUser.getId(), "2005", "", "123123", "Vui lòng nhập mật khẩu mới" }, // TC12
				{ existingUser.getId(), "2005", "2005", "2005", "Mật khẩu mới không được trùng mật khẩu cũ" } // TC13
		};
	}

	@Test(dataProvider = "ChangePasswordData")
	public void testChangePassword(String username, String oldPassword, String newPassword, String confirmPassword,
			String expectedMessage) {
		String actualMessage = PasswordHandler.changePassword(username, oldPassword, newPassword, confirmPassword);
		Assert.assertEquals(actualMessage, expectedMessage, "Kết quả không đúng!");
	}

	public static class PasswordHandler {
		private static UserDAO userDAO = new UserDAOImpl();

		public static String changePassword(String username, String oldPassword, String newPassword,
				String confirmPassword) {
			User user = userDAO.findByIdOrEmail(username);
			if (user == null) {
				return "Người dùng không tồn tại";
			}
			if (!user.getPassword().equals(oldPassword)) {
				return "Sai mật khẩu cũ"; // TC10
			}
			if (newPassword == null || newPassword.isEmpty()) {
				return "Vui lòng nhập mật khẩu mới"; // TC12
			}
			if (!newPassword.equals(confirmPassword)) {
				return "Mật khẩu xác nhận không trùng khớp"; // TC11
			}

			if (newPassword.equals(oldPassword)) {
				return "Mật khẩu mới không được trùng mật khẩu cũ"; // TC13
			}
			return "Đổi mật khẩu thành công"; // TC09
		}
	}
}
