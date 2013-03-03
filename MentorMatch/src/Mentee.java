import java.util.ArrayList;

import com.googlecode.objectify.annotation.*;


@Cache @Unindex @Entity
public class Mentee {
	
	private String FirstName, LastName, Biography, Classification;
	@Index private int ZipCode;
	@Id private String Email;
	@Index private ArrayList <String> Interests, Majors, Current_Courses, Past_Courses;
	
	public Mentee(String email)
	{
		this.Email = email;
	}
	
	public static void LogIn()
	{		
		
	}
	
	public static void LogOut()
	{
		
	}
	
	public static void EditProfile()
	{
		
	}
}
