package Tests;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;

public class SearchTestSelenium  {
    public static void main(String[] args) {
       
    	
    	
    	
        WebDriver driver = new FirefoxDriver();
        driver.get("http://localhost:8888/");
        

        WebElement element = driver.findElement(By.id("register"));
		element.click();
		
        
		
        //Close the browser
        driver.quit();
    }
    
    

    
    
    
}