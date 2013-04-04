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

@SuppressWarnings("serial")
public class RegisterServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		doPost(req,resp);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Gson gson = new Gson();

		JsonParser jsonParser = new JsonParser();
		JsonObject jo = (JsonObject)jsonParser.parse(req.getParameter("json"));
		
		Mentee temp = new Mentee("eolszewski@gmail.com", " ");
		OfyService.ofy().delete().entity(temp).now();

		if(!EmailPassword(jo))
			temp.setError("No Username and Password input");
		else if(Exists(jo))
		{
			temp.setError("Email is already in use");
		}
		else
		{
			temp = new Mentee(jo.get("email").toString().replace("\"", ""), jo.get("password").toString().replace("\"", ""));
			temp.setFirstName(jo.get("firstName").toString().replace("\"", "")).setLastName(jo.get("lastName").toString().replace("\"", "")).setZipCode(Integer.parseInt(jo.get("zipcode").toString().replace("\"", "")));
			temp.setMajors(Arrays.asList(jo.get("majors").toString().replace("\"", "").replace("[", "").replace("[", "").split(",")));
			temp.setInterests(Arrays.asList(jo.get("interests").toString().replace("\"", "").replace("[", "").replace("[", "").split(",")));
			temp.setCurrentCourses(Arrays.asList(jo.get("currentCourses").toString().replace("\"", "").replace("[", "").replace("[", "").split(",")));
			temp.setPastCourses(Arrays.asList(jo.get("pastCourses").toString().replace("\"", "").replace("[", "").replace("[", "").split(",")));
			OfyService.ofy().save().entity(temp).now();
		}
		
		resp.setContentType("application/json");
		System.out.println(gson.toJson(temp).toString());
		resp.getWriter().write(gson.toJson(temp).toString());
	}

	private boolean EmailPassword(JsonObject jo) {
		return (jo.get("email") != null && jo.get("password") != null);
	}

	private boolean Exists(JsonObject jo) {
		if(OfyService.ofy().load().type(Mentee.class).id(jo.get("email").toString().replace("\"", "")).get() != null)
			return true;
		return false;
	}
}
