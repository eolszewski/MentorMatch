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
	private String Subject, Body;
	@Index String To, From;
	private boolean Request;
	private String Status;
	private Date TimeStamp;
	@Index private boolean Unread;
	private String FromFirstName, FromLastName;
	
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
		Unread = true;
		
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
	
	
	public void setFrom(String m){
		From = m;
	}
	
	public void setTo(String m){
		 To = m;
	}

	public void setBody(String m) {
		 Body = m;
	}
	
	public void setEmail(){
		TimeStamp = new Date();
		if(To.compareTo(From) > 0){
			email = To  + From;
		}
		else email = From + To;

	}

	public boolean isUnread() {
		return Unread;
	}

	public UserMessage setUnread(boolean unread) {
		this.Unread = unread;
		return this;
	}

	public String getFromFirstName() {
		return FromFirstName;
	}

	public void setFromFirstName(String fromFirstName) {
		FromFirstName = fromFirstName;
	}

	public String getFromLastName() {
		return FromLastName;
	}

	public void setFromLastName(String fromLastName) {
		FromLastName = fromLastName;
	}
}
