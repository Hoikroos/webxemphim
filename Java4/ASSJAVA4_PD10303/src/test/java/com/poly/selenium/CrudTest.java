package com.poly.selenium;

import org.openqa.selenium.*;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import io.github.bonigarcia.wdm.WebDriverManager;

import org.openqa.selenium.chrome.ChromeDriver;
import java.time.Duration;

public class CrudTest {
	private WebDriver driver;
	private WebDriverWait wait;
	private final String BASE_URL = "http://localhost:8080/ASSJAVA4_PD10303/category";

	@BeforeClass
	public void setup() {
		WebDriverManager.chromedriver().setup();
		driver = new ChromeDriver();
		wait = new WebDriverWait(driver, Duration.ofSeconds(4));
		driver.manage().window().maximize();
		driver.get(BASE_URL);
	}

	@Test
	public void testCreateCategory() throws InterruptedException {
		Thread.sleep(1000);
		driver.findElement(By.id("id")).sendKeys("C05");
		Thread.sleep(1000);
		driver.findElement(By.id("name")).sendKeys("Phim Kinh Dị");
		Thread.sleep(1000);
		driver.findElement(By.id("description")).sendKeys("Phim Kinh Dị Nhất 2025");
		Thread.sleep(1000);
		driver.findElement(By.id("create-btn")).click();
		Thread.sleep(3000);
		driver.navigate().refresh();
		Thread.sleep(2000);
		WebElement successMessage = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("successMessage")));

		Assert.assertEquals(successMessage.getText(), "Danh mục đã được thêm thành công.", "Thông báo lỗi không đúng!");
	}

	@Test(priority = 2)
	public void testEditCategory() throws InterruptedException {
		WebElement categoryListTab = wait.until(ExpectedConditions.elementToBeClickable(By.id("profile-tab")));
		categoryListTab.click();
		Thread.sleep(1000);

		wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("profile")));
		WebElement editLink = wait.until(ExpectedConditions.elementToBeClickable(
				By.xpath("//div[@id='profile']//table//tbody//tr[1]//a[contains(text(),'Edit')]")));
		editLink.click();
		Thread.sleep(1000);

		wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("home")));
		WebElement nameInput = wait.until(ExpectedConditions.elementToBeClickable(By.id("name")));
		WebElement descriptionInput = wait.until(ExpectedConditions.elementToBeClickable(By.id("description")));

		nameInput.clear();
		nameInput.sendKeys("Phim hoạt hình 2025");
		Thread.sleep(500);

		descriptionInput.clear();
		descriptionInput.sendKeys("Mô tả thể loại phim hoạt hình năm 2025");
		Thread.sleep(500);

		WebElement updateButton = wait.until(ExpectedConditions.elementToBeClickable(By.id("update-btn")));
		updateButton.click();
		Thread.sleep(1500);

		WebElement successMessage = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("successMessage")));
		Assert.assertEquals(successMessage.getText().trim(), "Danh mục đã được cập nhật thành công.",
				"Thông báo cập nhật không đúng!");

		categoryListTab = wait.until(ExpectedConditions.elementToBeClickable(By.id("profile-tab")));
		categoryListTab.click();
		Thread.sleep(1000);

		wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("profile")));
		WebElement updatedElement = wait
				.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//tbody/tr[1]/td[2]")));

		Assert.assertEquals(updatedElement.getText().trim(), "Phim hoạt hình 2025",
				"Tên danh mục không được cập nhật thành công!");
	}

	@Test(priority = 3)
	public void testEditThenDeleteCategory() throws InterruptedException {
		WebElement categoryListTab = wait.until(ExpectedConditions.elementToBeClickable(By.id("profile-tab")));
		categoryListTab.click();
		Thread.sleep(1000);

		wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("profile")));

		WebElement editButton = wait.until(ExpectedConditions.elementToBeClickable(
				By.xpath("//div[@id='profile']//table//tbody//tr[5]//a[contains(text(),'Edit')]")));
		editButton.click();
		Thread.sleep(1000);

		wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("home")));
		WebElement deleteButton = wait.until(ExpectedConditions.elementToBeClickable(By.id("delete-btn")));

		try {
			deleteButton.click();
		} catch (StaleElementReferenceException e) {
			deleteButton = wait.until(ExpectedConditions.elementToBeClickable(By.id("delete-btn")));
			deleteButton.click();
		}
		Thread.sleep(1000);

		wait.until(ExpectedConditions.alertIsPresent()).accept();
		Thread.sleep(1500);

		WebElement successMessage = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("successMessage")));
		Assert.assertEquals(successMessage.getText().trim(), "Danh mục đã được xóa thành công.",
				"Thông báo xóa không đúng!");
	}

	@AfterClass
	public void tearDown() {
		if (driver != null) {
			driver.quit();
		}
	}
}
