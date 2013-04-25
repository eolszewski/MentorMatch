package Entities;
import java.util.ArrayList;
import java.util.List;

import com.googlecode.objectify.annotation.*;


@Cache @Index @Entity
public class Mentee {
	
	private String FirstName, LastName, Biography;
	@Index private String Classification;
	@Index private int ZipCode;
	@Id private String Email;
	private int Password;
	private String Error;
	@Index private List <String> Interests, Current_Courses, Past_Courses;
	@Index List<String> Majors;
	private ArrayList <UserMessage> Messages;
	ArrayList <Relationship> Relationships;
	
	protected Mentee() {};
	public Mentee(String email, int password) { this.Email = email; this.Password = password; }	
	public boolean LogInEmail() { return true; }
	public boolean LogOutEmail() { return true; }
	public boolean LogInFacebook() { return true; }
	public boolean LogOutFacebook() { return true; }
	public boolean SendMessage(UserMessage message){/* message.sendMessage();*/ return true; } //Took out the send message for now
	public boolean EditProfile(String firstName, String lastName, int password, String biography, String classification, int zipCode, String email, ArrayList <String> interests, ArrayList <String> majors, ArrayList <String> current_courses, ArrayList <String> past_courses)
	{
		this.FirstName = firstName;
		this.LastName = lastName;
		this.Password = password;
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
		//Search search = new Search(arguments);
		//return search.PerformSearch();
		return new ArrayList<String>(0);
	}
	public String getFirstName() { return FirstName; }
	public Mentee setFirstName(String firstName) { FirstName = firstName; return this;}
	public String getClassification() { return Classification; }
	public Mentee setClassification(String classification) { Classification = classification; return this;}
	public String getLastName() { return LastName; }
	public Mentee setLastName(String lastName) { LastName = lastName; return this; }
	public int getPassword() { return Password; }
	public void setPassword(int password) { this.Password = password; }
	public String getEmail() { return Email; }
	public Mentee setEmail(String email) { Email = email; return this; }
	public List<String> getMajors() { return Majors; }
	public Mentee setMajors(List<String> list) { Majors = list; return this;}
	public Mentee setMajor(String major) { Majors = new ArrayList<String>();
		Majors.add(major); return this; }
	public Mentee setZipCode(int zipcode) { ZipCode = zipcode; return this; }
	public int getZipCode() { return ZipCode; }
	public List<String> getInterests() { return Interests; }
	public Mentee setInterests(List<String> list) { Interests = (List<String>) list; return this;}	
	public List<String> getCurrentCourses() { return Current_Courses; }
	public Mentee setCurrentCourses(List<String> list) { Current_Courses = (List<String>) list; return this;}	
	public List<String> getPastCourses() { return Past_Courses; }
	public Mentee setPastCourses(List<String> list) { Past_Courses = (List<String>) list; return this;}
	public String getError() { return Error; }
	public void setError(String error) { Error = error; }
}
