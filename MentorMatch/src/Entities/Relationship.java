package Entities;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Cache;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Parent;
import com.googlecode.objectify.annotation.Unindex;

@Cache @Unindex @Entity
public class Relationship {
	
	@Parent Key<Mentee> mentee;
	@Id String email;
	
	public Relationship()
	{
		
	}
}
