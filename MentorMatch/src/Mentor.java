import com.googlecode.objectify.annotation.EntitySubclass;

@EntitySubclass
public class Mentor extends Mentee {

	public Mentor(String email) {
		super(email);
		// TODO Auto-generated constructor stub
	}

}
