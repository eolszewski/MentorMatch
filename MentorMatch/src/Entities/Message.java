package Entities;
import java.util.Date;
import static com.googlecode.objectify.ObjectifyService.ofy;

import com.google.gson.Gson;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Cache;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Parent;
import com.googlecode.objectify.annotation.Unindex;

@Cache @Unindex @Entity
public class Message {
	
	@Parent Key<Mentee> mentee;
	@Id String email; // I think the ID should be left as a Long because you can have more than one message
	private String Subject, Body, To, From;
	private boolean Request;
	private String Status;
	private Date TimeStamp;
	
	public Message()
	{
		Status = "Pending";
	}
	
	public void createMessage(String sub, String body, String from, String to){
		
		Subject = sub;
		Body = body;
		To = to;
		From = from;
		
		
	}
	
	public void sendMessage() {
		this.TimeStamp = new Date();
	}
	
	public String toJson() {
		Gson gson = new Gson();
		return gson.toJson(this);
	}
	
	public static Message fromJson(String json) {
		Gson gson = new Gson();
		return gson.fromJson(json, Message.class);
		
	}

	
}
