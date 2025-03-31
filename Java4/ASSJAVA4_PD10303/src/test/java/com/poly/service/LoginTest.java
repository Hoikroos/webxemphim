package com.poly.service;

import com.poly.dao.UserDAOImpl;
import com.poly.entity.User;
import org.testng.Assert;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

public class LoginTest {

	private static final UserDAOImpl userDAO = new UserDAOImpl();

	@DataProvider(name = "LoginData")
	public Object[][] getData() {
		return new Object[][] { { "vodinhhoi1@gmail.com", "2005", "Đăng nhập thành công chuyển đến trang chủ" }, // TC01
				{ "vodinh123@gmail.com", "2005", "Tài khoản không tồn tại" }, // TC02
				{ "vodinhhoi3@gmail.com", "2005", "Tài khoản không tồn tại" }, // TC03
				{ "vodinhhoi1@gmail.com", "2004", "Tài khoản hoặc mật khẩu không đúng" } // TC04
		};
	}

	@Test(dataProvider = "LoginData")
	public void testUserLogin(String email, String password, String expectedMessage) {
		String actualMessage = login(email, password);
		Assert.assertEquals(actualMessage, expectedMessage, "Kết quả kiểm thử không đúng!");
	}

	public String login(String email, String password) {
		User user = userDAO.findByIdOrEmail(email);

		if (user == null) {
			return "Tài khoản không tồn tại";
		}

		if (!user.getPassword().equals(password)) {
			return "Tài khoản hoặc mật khẩu không đúng";
		}

		return "Đăng nhập thành công chuyển đến trang chủ";
	}
}
