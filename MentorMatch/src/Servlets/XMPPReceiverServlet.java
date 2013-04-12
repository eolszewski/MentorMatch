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


@SuppressWarnings("serial")
public class XMPPReceiverServlet extends HttpServlet {
	
    public void doPost(HttpServletRequest req, HttpServletResponse res)
          throws IOException {
    	
        XMPPService xmpp = XMPPServiceFactory.getXMPPService();
        Message message = xmpp.parseMessage(req);
        
        Entity entity = new Entity("Message");
        
        StringBuilder to = new StringBuilder();
        
        for(JID jid: message.getRecipientJids()){
        	to.append(jid.toString());
        	to.append("; ");
        }
        
        entity.setProperty("from", "" + message.getFromJid());
        entity.setProperty("body", message.getBody());
        entity.setProperty("Timestamp", new Date());
        
        
        OfyService.ofy().save().entity(entity).now();
        
        xmpp.sendMessage(message);
        // ...
    }
    
    
}