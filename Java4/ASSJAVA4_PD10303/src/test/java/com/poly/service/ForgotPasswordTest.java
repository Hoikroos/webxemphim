package com.poly.service;

import org.testng.Assert;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import com.poly.dao.UserDAO;
import com.poly.dao.UserDAOImpl;
import com.poly.entity.User;

public class ForgotPasswordTest {
	private UserDAO userDAO;

	@BeforeClass
	public void setUp() {
		userDAO = new UserDAOImpl();
	}

	@DataProvider(name = "ForgotPasswordData")
	public Object[][] getData() {
		User user1 = userDAO.findByIdOrEmail("vodinhhoi1@gmail.com");

		if (user1 == null) {
			throw new RuntimeException("Không tìm thấy user hợp lệ trong database! Hãy kiểm tra lại dữ liệu.");
		}

		return new Object[][] { { user1.getId(), user1.getEmail(), "Email khôi phục mật khẩu đã được gửi" }, // TC14
				{ "U01", "vodinhhoi1gmail.com", "Email không hợp lệ" }, // TC15
				{ "U01", "vodinhhoi2@gmail.com", "Email không tồn tại" } // TC16
		};
	}

	@Test(dataProvider = "ForgotPasswordData")
	public void testForgotPassword(String username, String email, String expectedMessage) {
		String actualMessage = ForgotPasswordHandler.forgotPassword(username, email);
		Assert.assertEquals(actualMessage, expectedMessage, "Kết quả không đúng!");
	}

	public static class ForgotPasswordHandler {
		private static UserDAO userDAO = new UserDAOImpl();

		public static String forgotPassword(String username, String email) {
			if (!email.contains("@")) {
				return "Email không hợp lệ"; // TC15
			}
			User user = userDAO.findByIdOrEmail(email);
			if (user != null && user.getId().equals(username)) {
				return "Email khôi phục mật khẩu đã được gửi"; // TC14
			} else {
				return "Email không tồn tại"; // TC16
			}
		}
	}
}
