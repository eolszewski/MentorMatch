package Servlets;

import java.io.IOException;
import java.util.Arrays;

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
			fetched =  OfyService.ofy().load().type(Mentee.class).id(jo.get("email").toString().replace("\"", "")).get();
			OfyService.ofy().save().entity(AddFields(fetched, jo)).now();
		}
		resp.getWriter().write(gson.toJson(fetched).toString());
	}
	
	private Object AddFields(Mentee temp, JsonObject jo) {
		temp.setFirstName(jo.get("firstName").toString().replace("\"", "")).setLastName(jo.get("lastName").toString().replace("\"", "")).setZipCode(Integer.parseInt(jo.get("zipcode").toString().replace("\"", "")));
		temp.setMajors(Arrays.asList(jo.get("majors").toString().replace("\"", "").replace("[", "").replace("]", "").split(",")));
		temp.setInterests(Arrays.asList(jo.get("interests").toString().replace("\"", "").replace("[", "").replace("]", "").split(",")));
		temp.setCurrentCourses(Arrays.asList(jo.get("currentCourses").toString().replace("\"", "").replace("[", "").replace("]", "").split(",")));
		temp.setPastCourses(Arrays.asList(jo.get("pastCourses").toString().replace("\"", "").replace("[", "").replace("]", "").split(",")));
		return temp;
	}
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {			
		doPost( req, resp );
	}
}
