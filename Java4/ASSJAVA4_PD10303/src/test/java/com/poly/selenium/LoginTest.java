package com.poly.selenium;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import io.github.bonigarcia.wdm.WebDriverManager;

public class LoginTest {
	WebDriver driver;

	@BeforeClass
	public void setUp() {
		WebDriverManager.chromedriver().setup();
		driver = new ChromeDriver();
		driver.manage().window().maximize();
	}

	@Test
	public void testValidLogin() throws InterruptedException {
		driver.get("http://localhost:8080/ASSJAVA4_PD10303/login");
		Thread.sleep(1000);
		driver.findElement(By.id("idOrEmail")).sendKeys("vodinhhoi1@gmail.com");
		Thread.sleep(1000);
		driver.findElement(By.id("password")).sendKeys("2005");
		Thread.sleep(1000);
		driver.findElement(By.cssSelector(".form-btn")).click();
		Thread.sleep(3000);
		Assert.assertEquals(driver.getCurrentUrl(), "http://localhost:8080/ASSJAVA4_PD10303/indexServlet",
				"Đăng nhập thất bại!");
	}

	@Test
	public void testInvalidPassword() throws InterruptedException {
		driver.get("http://localhost:8080/ASSJAVA4_PD10303/login");
		Thread.sleep(1000);
		driver.findElement(By.id("idOrEmail")).sendKeys("vodinhhoi1@gmail.com");
		Thread.sleep(1000);
		driver.findElement(By.id("password")).sendKeys("wrongpassword");
		Thread.sleep(1000);
		driver.findElement(By.cssSelector(".form-btn")).click();
		Thread.sleep(3000);
		String errorMessage = driver.findElement(By.id("errorMessage")).getText();
		Assert.assertEquals(errorMessage, "Sai tài khoản hoặc mật khẩu.", "Thông báo lỗi không đúng!");
	}

	@Test
	public void testInvalidUsername() throws InterruptedException {
		driver.get("http://localhost:8080/ASSJAVA4_PD10303/login");
		Thread.sleep(1000);
		driver.findElement(By.id("idOrEmail")).sendKeys("vodinhhoi2@gmail.com");
		Thread.sleep(1000);
		driver.findElement(By.id("password")).sendKeys("2005");
		Thread.sleep(1000);
		driver.findElement(By.cssSelector(".form-btn")).click();
		Thread.sleep(1500);
		String errorMessage = driver.findElement(By.id("errorMessage")).getText();
		Assert.assertEquals(errorMessage, "Tài khoản không tồn tại.", "Thông báo lỗi không đúng!");
	}

	@Test
	public void testEmptyFields() throws InterruptedException {
		driver.get("http://localhost:8080/ASSJAVA4_PD10303/login");
		driver.findElement(By.cssSelector(".form-btn")).click();
		Thread.sleep(2000);
		String errorMessage = driver.findElement(By.id("errorMessage")).getText();
		Assert.assertEquals(errorMessage, "Vui lòng nhập tài khoản và mật khẩu.", "Thông báo lỗi không đúng!");
	}

	@AfterClass
	public void tearDown() {
		driver.quit();
	}
}
