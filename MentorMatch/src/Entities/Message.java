package Entities;
import java.util.Date;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Cache;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Parent;
import com.googlecode.objectify.annotation.Unindex;

@Cache @Unindex @Entity
public class Message {
	
	@Parent Key<Mentee> mentee;
	@Id String email;
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
