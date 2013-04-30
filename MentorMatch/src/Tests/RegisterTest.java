package Tests;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;

public class RegisterTest  {
    public static void main(String[] args) {
       
    	
    	
    	String first_User = "emailReg,eric@gmail.com,passwordReg,123456,fname,Eric,lname,Olz,zip,78705";
		String first_Details = "majors,Electrical Engineering,majorb,interests,Football,interestb,currentcourses,EE 461L,ccourseb,pastcourses,ASE 201,pcourseb";

		String second_User = "emailReg,asad@gmail.com,passwordReg,123456,fname,Asad,lname,Malik,zip,78705";
		String second_Details = "majors,Electrical Engineering,majorb,interests,Soccer,interestb,currentcourses,EE 461L,ccourseb,pastcourses,ASE 201,pcourseb";

		
        WebDriver driver = new FirefoxDriver();
        driver.get("http://localhost:8888/");
        

        WebElement element = driver.findElement(By.id("register"));
		element.click();
		
	
		createUser(element,driver,first_User,first_Details);
        
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