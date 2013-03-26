package Entities;
import com.googlecode.objectify.annotation.Cache;
import com.googlecode.objectify.annotation.EntitySubclass;
import com.googlecode.objectify.annotation.Unindex;

@Cache @Unindex @EntitySubclass
public class Mentor extends Mentee {

	private Mentor() { 
		super();
	}
	public Mentor(String email) {
		super(email);
		// TODO Auto-generated constructor stub
	}

}
