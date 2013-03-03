import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyFactory;
import com.googlecode.objectify.ObjectifyService;


public class OfyService {
	
    static {
        factory().register(Mentee.class);        
        factory().register(Mentor.class);
        factory().register(Message.class);
        factory().register(Search.class);
    }
    
	public static Objectify ofy() {
	    return ObjectifyService.ofy();
	}
	
	public static ObjectifyFactory factory() {
	    return ObjectifyService.factory();
	}
}
