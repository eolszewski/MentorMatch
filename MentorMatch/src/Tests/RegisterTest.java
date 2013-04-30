package Tests;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;

public class RegisterTest  {
    public static void main(String[] args) {
        // Create a new instance of the Firefox driver
        // Notice that the remainder of the code relies on the interface, 
        // not the implementation.
        WebDriver driver = new FirefoxDriver();

        // And now use this to visit Google
        driver.get("http://localhost:8888/");
        // Alternatively the same thing can be done like this
        // driver.navigate().to("http://www.google.com");

        // Find the text input element by its name
        WebElement element = driver.findElement(By.id("register"));

        // Enter something to search for
       // element.sendKeys("Cheese!");

        // Now submit the form. WebDriver will find the form for us from the element
       // element.submit();
        element.click();
        
        element = driver.findElement((By.id("emailReg")));
        element.sendKeys("john@gmail.com");
        element = driver.findElement((By.id("passwordReg")));
        element.sendKeys("123456");
        element = driver.findElement((By.id("fname")));
        element.sendKeys("John");
        element = driver.findElement((By.id("lname")));
        element.sendKeys("Doe");
        element = driver.findElement((By.id("zip")));
        element.sendKeys("78705");
        element = driver.findElement((By.id("majors")));
        element.sendKeys("Electrical Engineering");
        element = driver.findElement((By.id("majorb")));
        element.click();
        element = driver.findElement((By.id("interests")));
        element.sendKeys("Soccer");
        element = driver.findElement((By.id("interestb")));
        element.click();
        element = driver.findElement((By.id("currentcourses")));
        element.sendKeys("EE 461L");
        element = driver.findElement((By.id("ccourseb")));
        element.click();
        element = driver.findElement((By.id("pastcourses")));
        element.sendKeys("ASE 201");
        element = driver.findElement((By.id("pcourseb")));
        element.click();
        element = driver.findElement((By.id("submitb")));
        element.click();
        
        // Check the title of the page
        System.out.println("Page title is: " + driver.getTitle());
        
        // Google's search is rendered dynamically with JavaScript.
        // Wait for the page to load, timeout after 10 seconds
        (new WebDriverWait(driver, 10)).until(new ExpectedCondition<Boolean>() {
            public Boolean apply(WebDriver d) {
                return d.getTitle().toLowerCase().startsWith("cheese!");
            }
        });

        // Should see: "cheese! - Google Search"
        System.out.println("Page title is: " + driver.getTitle());
        
        //Close the browser
        driver.quit();
    }
}