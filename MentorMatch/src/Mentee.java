import java.util.ArrayList;

import com.googlecode.objectify.annotation.*;


@Unindex @Entity
public class Mentee {
	
	private String FirstName, LastName;
	@Id private String Email;
	@Index private ArrayList <String> Interests, Majors, Current_Courses, Past_Courses;
	OfyService ofy;
	
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
