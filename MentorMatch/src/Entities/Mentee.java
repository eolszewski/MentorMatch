package Entities;
import java.util.ArrayList;
import java.util.List;

import com.googlecode.objectify.annotation.*;


@Cache @Unindex @Entity
public class Mentee {
	
	private String FirstName, LastName, Biography, Classification;
	@Index private int ZipCode;
	@Id private String Email;
	@Index private ArrayList <String> Interests, Current_Courses, Past_Courses;
	List<String> Majors;
	private ArrayList <Message> Messages;
	ArrayList <Relationship> Relastionships;
	Search search;
	
	public Mentee(String email) { this.Email = email; }	
	public boolean LogInEmail() { return true; }
	public boolean LogOutEmail() { return true; }
	public boolean LogInFacebook() { return true; }
	public boolean LogOutFacebook() { return true; }
	public boolean SendMessage(Message message){ message.sendMessage(); return true; }
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
	public String getFirstName() { return FirstName; }
	public Mentee setFirstName(String firstName) { FirstName = firstName; return this;}
	public String getLastName() { return LastName; }
	public Mentee setLastName(String lastName) { LastName = lastName; return this; }
	public String getEmail() { return Email; }
	public Mentee setEmail(String email) { Email = email; return this; }
	public List<String> getMajors() { return Majors; }
	public Mentee setMajors(List<String> list) { Majors = list; return this;}
}
