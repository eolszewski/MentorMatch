package Servlets;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entities.Mentee;
import Entities.OfyService;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class EditServlet extends HttpServlet {
	Gson gson = new Gson();
	
	boolean TEST = false;
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {		
					
		JsonParser jsonParser = new JsonParser();
		JsonObject jo = (JsonObject)jsonParser.parse(req.getParameter("json"));
		Mentee fetched;
		
		resp.setContentType("text/plain");
		if(jo.get("flag").toString().replace("\"", "").equals("fill"))
		{
			fetched =  OfyService.ofy().load().type(Mentee.class).id(jo.get("email").toString().replace("\"", "")).get();
		}
		else
		{
			//TODO
			//Find Mentee in datastore with email that matches the email im sending you
			//Update mentees attributes with the ones I've sent you
			fetched = new Mentee("null", 0);
		}
		resp.getWriter().write(gson.toJson(fetched).toString());
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {			
		doPost( req, resp );
	}
}
