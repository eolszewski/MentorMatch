import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Parent;

@Entity
public class Interaction {
	@Parent Key<Mentee> mentee;
	public Interaction()
	{
		
	}
}
