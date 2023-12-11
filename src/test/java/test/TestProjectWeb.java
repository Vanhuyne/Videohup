package test;

import org.testng.annotations.AfterMethod;
import org.testng.annotations.Test;
import org.testng.annotations.BeforeMethod;

import java.time.Duration;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

public class TestProjectWeb {
	WebDriver driver;
	String url = "http://localhost:8080/Asm-java4/index";

	@BeforeClass
	public void setUp() {
		driver = new ChromeDriver();
	}

	@Test
	public void testWebPageTitle() {

		driver.get(url);

		// lấy tiêu đề của trang web
		String title = driver.getTitle();
		System.out.println("Tiêu đề của trang là: " + title);

		Assert.assertEquals(title, "Home");

	}

	@Test
	public void testClickLogin() {

		driver.get(url);

		WebElement elementToClick = driver.findElement(By.xpath("//*[@id=\"navbarSupportedContent\"]/ul/li[2]/a"));

		// them su kien click
		elementToClick.click();

		// cho trinh duyet tai
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		String currentURL = driver.getCurrentUrl();
		String expectedURL = "http://localhost:8080/Asm-java4/login";

		Assert.assertEquals(currentURL, expectedURL);
	}

	@Test
	public void testSuccessfulLoginAndLogout() {

		String url = "http://localhost:8080/Asm-java4/login";
		driver.get(url);

		WebElement usernameElement = driver.findElement(By.xpath("//*[@id=\"username\"]"));
		WebElement passwordElement = driver.findElement(By.xpath("//*[@id=\"password\"]"));

		// username vs password đúng
		String username = "user1";
		String password = "pass123";
		usernameElement.sendKeys(username);
		passwordElement.sendKeys(password);

		// click vào login
		WebElement loginButton = driver.findElement(By.xpath("/html/body/div[1]/div/form/div[3]/button"));
		loginButton.click();

		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		// Kiem tra thanh cong
		String loggedInURL = driver.getCurrentUrl();
		String expectedURL = "http://localhost:8080/Asm-java4/index"; // duong dan mong muon
		Assert.assertEquals(loggedInURL, expectedURL);

		// logout
		driver.get(driver.getCurrentUrl());
		WebElement logoutLink = driver.findElement(By.id("logout"));
		logoutLink.click();

		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {

			e.printStackTrace();
		}
		WebElement element1 = driver.findElement(By.linkText("Forgot Password"));
		WebElement element2 = driver.findElement(By.linkText("Login"));
		WebElement element3 = driver.findElement(By.linkText("Register"));
		// Khang dinh dung khi 3 elements cung ton tai
		Assert.assertTrue(element1.isDisplayed() && element2.isDisplayed() && element3.isDisplayed());
	}

	@Test
	public void testUrlVideo() {
		String url = "http://localhost:8080/Asm-java4/index";
		driver.get(url);

		WebElement lickVideo = driver.findElement(By.xpath("/html/body/div[2]/div[2]/div[1]/div/div[1]/a/img"));
		lickVideo.click();

		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		String currentURL = driver.getCurrentUrl();
		String expectedURL = "http://localhost:8080/Asm-java4/video?action=watch&id=1WVFt-3FZEg";
		Assert.assertEquals(currentURL, expectedURL);
	}

	@Test
	public void testVideoDetails() {
		// URL chứa video
		String url = "http://localhost:8080/Asm-java4/video?action=watch&id=1WVFt-3FZEg";

		driver.get(url);

		String currentUrl = driver.getCurrentUrl();

		// Xác thực có hành động là 'watch'
		Pattern actionPattern = Pattern.compile("action=watch");
		Matcher actionMatcher = actionPattern.matcher(currentUrl);
		Assert.assertTrue(actionMatcher.find(), "không phải là 'watch'");

		// Xác minh ID của video là '1WVFt-3FZEg'
		Pattern idPattern = Pattern.compile("id=1WVFt-3FZEg");
		Matcher idMatcher = idPattern.matcher(currentUrl);
		Assert.assertTrue(idMatcher.find());

	}

	@AfterClass
	public void tearDown() {
		// Đóng trình duyệt sau khi hoàn thành việc kiểm thử
		if (driver != null) {
			driver.quit();
		}
	}

}
