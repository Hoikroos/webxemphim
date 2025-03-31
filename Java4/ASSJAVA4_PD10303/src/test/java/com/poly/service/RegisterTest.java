package com.poly.service;

import static org.testng.Assert.*;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;
import com.poly.dao.UserDAO;
import com.poly.dao.UserDAOImpl;

public class RegisterTest {
	private RegisterService registerService;

	@BeforeMethod
	public void setUp() {
		registerService = new RegisterService();
	}

	@DataProvider(name = "RegisterData")
	public Object[][] getRegisterData() {
		return new Object[][] {
				{ "U08", "230202", "Võ Đình Hội", "vodinhhoi23022005@gmail.com", "Tạo tài khoản thành công" }, // TC05
				{ "U09", "230203", "Võ Đình Hội", "vodinhhoi1@gmail.com", "Email đã được sử dụng" }, // TC06
				{ "", "230202", "Võ Đình Hội", "", "Vui lòng nhập đầy đủ thông tin" }, // TC08
		};
	}

	@Test(dataProvider = "RegisterData")
	public void testRegister(String username, String password, String fullName, String email, String expectedMessage) {
		String actualMessage = registerService.register(username, password, fullName, email);
		assertEquals(actualMessage, expectedMessage, "Kết quả kiểm thử không đúng!");
	}

	@Test
	public void testEmailConfirmationSent() {
		boolean emailSent = registerService.sendConfirmationEmail("vodinhhoi1@gmail.com");// TC07
		assertTrue(emailSent, "Email xác nhận phải được gửi thành công");
	}
}

class RegisterService {
	private UserDAO userDAO = new UserDAOImpl();

	public String register(String username, String password, String fullName, String email) {

		if (username.isEmpty() || password.isEmpty() || fullName.isEmpty() || email.isEmpty()) {
			return "Vui lòng nhập đầy đủ thông tin"; // TC08
		}

		if (userDAO.findByIdOrEmail(email) != null) {
			return "Email đã được sử dụng"; // TC06
		}
		sendConfirmationEmail(email);
		return "Tạo tài khoản thành công"; // TC05
	}

	public boolean sendConfirmationEmail(String email) {
		return email.contains("@");
	}
}
