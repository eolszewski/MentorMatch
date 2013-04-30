package Tests;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.thoughtworks.selenium.Wait;

public class LoginTest  {
    public static void main(String[] args) {
       
    	
    	
        WebDriver driver = new FirefoxDriver();
        driver.get("http://localhost:8888/");
        
        WebDriverWait wait = new WebDriverWait(driver, 100);

        wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"email\"]")));

         WebElement element = driver.findElement(By.xpath("//*[@id=\"email\"]"));
        element.sendKeys("eric@gmail.com");
        
        element = driver.findElement(By.xpath("//*[@id=\"password\"]"));
        element.sendKeys("123456");
        
        element = driver.findElement(By.xpath("//*[@id=\"submitb\"]"));
        element.click();
       
       
		
       element.click();
		
	
	
        
		/* WebDriver driver2 = new FirefoxDriver();
	     driver2.get("http://localhost:8888/");
	        
	    WebElement element2 = driver2.findElement(By.id("register"));
		element.click();
			
		createUser(element2,driver2,second_User,second_Details);
		
		*/
		
		
        //Close the browser
       // driver.quit();
    }
    
    
        
    
}