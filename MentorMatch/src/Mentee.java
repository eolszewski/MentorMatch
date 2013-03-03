import java.util.ArrayList;

import com.googlecode.objectify.annotation.*;


@Cache @Unindex @Entity
public class Mentee {
	
	private String FirstName, LastName, Biography, Classification;
	@Index private int ZipCode;
	@Id private String Email;
	@Index private ArrayList <String> Interests, Majors, Current_Courses, Past_Courses;
	private ArrayList <Message> Messages;
	ArrayList <Relationship> Relastionships;
	Search search;
	
	public Mentee(String email)
	{
		this.Email = email;
	}
	
	public boolean LogInEmail()
	{		
		return true;
	}
	
	public boolean LogOutEmail()
	{
		return true;
	}
	
	public boolean LogInFacebook()
	{		
		return true;
	}
	
	public boolean LogOutFacebook()
	{
		return true;
	}
	
	public boolean SendMessage(Message message)
	{
		message.sendMessage();
		return true;
	}
	
	public boolean EditProfile(String firstName, String lastName, String biography, String classification, int zipCode, String email, ArrayList <String> interests, ArrayList <String> majors, ArrayList <String> current_courses, ArrayList <String> past_courses)
	{
		this.FirstName = firstName;
		this.LastName = lastName;
		this.Biography = biography;
		this.Classification = classification;
		this.ZipCode = zipCode;
		this.Email = email;
		this.Interests = interests;
		this.Majors = majors;
		this.Current_Courses = current_courses;
		this.Past_Courses = past_courses;
		return true;
	}
	
	public ArrayList <String> SearchMatches(ArrayList <String> arguments)
	{
		Search search = new Search(arguments);
		return search.PerformSearch();
	}
}
