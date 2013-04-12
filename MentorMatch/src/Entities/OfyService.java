package Entities;
import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyFactory;
import com.googlecode.objectify.ObjectifyService;
import com.google.appengine.api.xmpp.JID;
import com.google.appengine.api.xmpp.Message;
import com.google.appengine.api.xmpp.XMPPService;
import com.google.appengine.api.xmpp.XMPPServiceFactory;

public class OfyService {
	
    static {
        factory().register(Mentee.class);        
        factory().register(Mentor.class);
        factory().register(UserMessage.class);
        factory().register(Search.class);
    }
    
	public static Objectify ofy() {
	    return ObjectifyService.ofy();
	}
	
	public static ObjectifyFactory factory() {
	    return ObjectifyService.factory();
	}
}
