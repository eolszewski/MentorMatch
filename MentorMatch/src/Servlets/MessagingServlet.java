package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Entities.Mentee;

import Entities.OfyService;

import com.google.appengine.api.xmpp.Message;
import com.google.appengine.api.xmpp.MessageBuilder;
import com.google.appengine.api.xmpp.MessageType;
import com.google.appengine.api.xmpp.XMPPService;
import com.google.appengine.api.xmpp.XMPPServiceFactory;
import com.google.gson.Gson;
public class MessagingServlet {
	
	private static final XMPPService xmppService =
		     XMPPServiceFactory.getXMPPService();
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		    throws IOException {
		Message message = xmppService.parseMessage(request);
		Message reply = new MessageBuilder()
		        .withRecipientJids(message.getFromJid())
		        .withMessageType(MessageType.NORMAL)
		        .withBody(message.getBody())
		        .build();
		xmppService.sendMessage(reply);
		}
}
