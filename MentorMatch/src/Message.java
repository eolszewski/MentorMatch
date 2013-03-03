import java.util.Date;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Cache;
import com.googlecode.objectify.annotation.EntitySubclass;
import com.googlecode.objectify.annotation.Parent;
import com.googlecode.objectify.annotation.Unindex;

@Cache @Unindex @EntitySubclass
public class Message {
	
	@Parent Key<Mentee> mentee;
	private String Subject, Body, To, From;
	private boolean Request;
	private String Status;
	private Date TimeStamp;
	
	public Message()
	{
		Status = "Pending";
	}

	public void sendMessage() {
		this.TimeStamp = new Date();
	}
}
