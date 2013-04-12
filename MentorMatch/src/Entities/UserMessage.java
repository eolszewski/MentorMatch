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
	@Index String email; // I think the ID should be left as a Long because you can have more than one message
	@Id String id;
	private String Subject, Body, To, From;
	private boolean Request;
	private String Status;
	private Date TimeStamp;
	//Message message;
	
	public void createMessage(Message receivedMessage){
		
		TimeStamp = new Date();
		JID ID = receivedMessage.getRecipientJids()[0];
		id = ID.toString() + TimeStamp;
		Body = receivedMessage.getBody();
		To = ID.toString();
		From = receivedMessage.getFromJid().toString();
	
	}
	

}
