package Tests;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;

public class LoginTest  {
    public static void main(String[] args) {
       
    	
    	
        WebDriver driver = new FirefoxDriver();
        driver.get("http://localhost:8888/");
        

        WebElement element = driver.findElement(By.id("email"));
        element.sendKeys("eric@gmail.com");
        element = driver.findElement(By.id("password"));
        element.sendKeys("123456");
		element.findElement(By.id("submitb"));
        element.click();
		
	
	
        
		/* WebDriver driver2 = new FirefoxDriver();
	     driver2.get("http://localhost:8888/");
	        
	    WebElement element2 = driver2.findElement(By.id("register"));
		element.click();
			
		createUser(element2,driver2,second_User,second_Details);
		
		*/
		
		
        //Close the browser
        driver.quit();
    }
    
    
        
    
}