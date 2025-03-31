package com.poly.selenium;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;
import io.github.bonigarcia.wdm.WebDriverManager;

public class RegisterTest {
	private WebDriver driver;
	private String baseUrl = "http://localhost:8080/ASSJAVA4_PD10303/register";

	@BeforeClass
	public void setUp() {
		WebDriverManager.chromedriver().setup();
		driver = new ChromeDriver();
		driver.manage().window().maximize();
	}

	@Test
	public void testSuccessfulRegistration() throws InterruptedException {
		driver.get(baseUrl);
		Thread.sleep(1000);
		driver.findElement(By.id("username")).sendKeys("user123");
		Thread.sleep(500);
		driver.findElement(By.id("password")).sendKeys("Test@12345");
		Thread.sleep(500);
		driver.findElement(By.id("fullname")).sendKeys("Test User");
		Thread.sleep(500);
		driver.findElement(By.id("email")).sendKeys("testuser123@gmail.com");
		Thread.sleep(500);
		driver.findElement(By.cssSelector(".form-btn")).click();
		Thread.sleep(3000);
		WebElement successMessage = driver.findElement(By.id("successMessage"));
		Assert.assertTrue(successMessage.isDisplayed(), "Đăng ký không thành công!");
		Assert.assertEquals(successMessage.getText(), "Đăng ký thành công! Email xác nhận đã được gửi.");
	}

	@Test
	public void testEmptyFields() throws InterruptedException {
		driver.get(baseUrl);
		Thread.sleep(1000);
		driver.findElement(By.cssSelector(".form-btn")).click();
		Thread.sleep(3000);
		WebElement errorMessage = driver.findElement(By.id("errorMessage"));
		Assert.assertEquals(errorMessage.getText(), "Vui lòng nhập đầy đủ thông tin.", "Thông báo lỗi không đúng!");
	}

	@Test
	public void testDuplicateUsername() throws InterruptedException {
		driver.get(baseUrl);
		Thread.sleep(1000);
		driver.findElement(By.id("username")).sendKeys("U01");
		Thread.sleep(500);
		driver.findElement(By.id("password")).sendKeys("Test@12345");
		Thread.sleep(500);
		driver.findElement(By.id("fullname")).sendKeys("User Exists");
		Thread.sleep(500);
		driver.findElement(By.id("email")).sendKeys("newuser123@gmail.com");
		Thread.sleep(500);
		driver.findElement(By.cssSelector(".form-btn")).click();
		Thread.sleep(3000);

		WebElement errorMessage = driver.findElement(By.id("errorMessage"));
		Assert.assertEquals(errorMessage.getText(), "Tên người dùng đã tồn tại. Vui lòng chọn tên khác.",
				"Thông báo lỗi không đúng!");
	}

	@Test
	public void testDuplicateEmail() throws InterruptedException {
		driver.get(baseUrl);
		Thread.sleep(1000);
		driver.findElement(By.id("username")).sendKeys("user789");
		Thread.sleep(500);
		driver.findElement(By.id("password")).sendKeys("Test@12345");
		Thread.sleep(500);
		driver.findElement(By.id("fullname")).sendKeys("New User");
		Thread.sleep(500);
		driver.findElement(By.id("email")).sendKeys("vodinhhoi1@gmail.com");
		Thread.sleep(500);
		driver.findElement(By.cssSelector(".form-btn")).click();
		Thread.sleep(3000);

		WebElement errorMessage = driver.findElement(By.id("errorMessage"));
		Assert.assertEquals(errorMessage.getText(), "Email đã được sử dụng. Vui lòng chọn email khác.",
				"Thông báo lỗi không đúng!");
	}

	@AfterClass
	public void tearDown() {
		driver.quit();
	}
}
