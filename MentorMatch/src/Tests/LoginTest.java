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
    
    
    public static void createUser(WebElement element,  WebDriver driver, String User, String Details){
    	String [] first = User.split(",");
    	String [] fDetails = Details.split(",");
    	
    	
    	 for(int i = 0; i < first.length-1; i++){

         	element = driver.findElement(By.id(first[i]));
         	element.sendKeys(first[++i]);
         	
         }
         
         for(int i = 0; i < fDetails.length-2; i++){

         	element = driver.findElement(By.id(fDetails[i]));
         	element.sendKeys(fDetails[++i]);
         	element = driver.findElement(By.id(fDetails[++i]));
             element.click();

         	
         }
         

         element = driver.findElement((By.id("submitb")));
         element.click();
    }
    
    
    
}