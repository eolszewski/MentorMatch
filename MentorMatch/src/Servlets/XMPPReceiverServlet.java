package Servlets;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.*;

import Entities.OfyService;

import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.xmpp.JID;
import com.google.appengine.api.xmpp.Message;
import com.google.appengine.api.xmpp.XMPPService;
import com.google.appengine.api.xmpp.XMPPServiceFactory;
import com.googlecode.objectify.cmd.Query;

import Entities.UserMessage;

@SuppressWarnings("serial")
public class XMPPReceiverServlet extends HttpServlet {
	
    public void doPost(HttpServletRequest req, HttpServletResponse res)
          throws IOException {
    	
        XMPPService xmpp = XMPPServiceFactory.getXMPPService();
  
        Message message = xmpp.parseMessage(req);
        UserMessage receivedMessage = new UserMessage();
        receivedMessage.createMessage(message);
    
        
        StringBuilder to = new StringBuilder();
        
        for(JID jid: message.getRecipientJids()){
        	to.append(jid.toString());
        	to.append("; ");
        }
        
    
        
        
        OfyService.ofy().save().entity(receivedMessage).now();
        System.out.println("Message is saved. From " + receivedMessage.getFrom() + " and to: " + receivedMessage.getTo() + " message is: " + receivedMessage.getBody());
       
        String ID;
        
        if(receivedMessage.getTo().compareTo(receivedMessage.getFrom()) > 0){
        	ID = receivedMessage.getTo() + " " + receivedMessage.getFrom();
        } else ID = receivedMessage.getFrom() + " " + receivedMessage.getTo();
        
		Query<UserMessage> allMessages = OfyService.ofy().load().type(UserMessage.class).filter("email", ID);  
		System.out.println(allMessages.order("TimeStamp").limit(5).list());
		
        
        //xmpp.sendMessage(message);
        // ...
    }
    
    
}