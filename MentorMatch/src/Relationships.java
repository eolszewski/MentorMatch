import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Cache;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Parent;
import com.googlecode.objectify.annotation.Unindex;

@Cache @Unindex @Entity
public class Relationships {
	
	@Parent Key<Mentee> mentee;
	
	public Relationships()
	{
		
	}
}
