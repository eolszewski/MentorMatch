package Entities;
import java.util.Date;

import static com.googlecode.objectify.ObjectifyService.ofy;

import com.google.gson.Gson;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Cache;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.annotation.Parent;
import com.googlecode.objectify.annotation.Unindex;
import com.google.appengine.api.xmpp.Message;
import com.google.appengine.api.xmpp.JID;

@Cache @Unindex @Entity
public class UserMessage {
	
	@Parent Key<Mentee> mentee;
	@Index String email; 
	@Index String check;
	@Id String id;
	private String Subject, Body, To, From;
	private boolean Request;
	private String Status;
	private Date TimeStamp;
	
	public void createMessage(Message receivedMessage){
		check = "1";
		TimeStamp = new Date();
		JID ID = receivedMessage.getRecipientJids()[0];
		id = ID.getId() + " " + TimeStamp;
		Body = receivedMessage.getBody();
		To = ID.getId();
		To = To.trim();
		From = receivedMessage.getFromJid().getId();
		From = From.trim();
		
		if(To.compareTo(From) > 0){
			email = To  + From;
		}
		else email = From + To;

	
	}
	
	public String getFrom(){
		return From;
	}
	
	public String getTo(){
		return To;
	}

	public String getBody() {
		return Body;
	}
	

}
