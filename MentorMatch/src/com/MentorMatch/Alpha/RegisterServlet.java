package com.MentorMatch.Alpha;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entities.Mentee;
import Entities.Mentor;
import Entities.OfyService;

import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyFactory;
import com.googlecode.objectify.ObjectifyService;

@SuppressWarnings("serial")
public class RegisterServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		doPost(req,resp);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/plain");
		Mentee newUser;
		
		if(request.getParameter("UserType").equals("Mentor"))
			newUser = new Mentee(request.getParameter("Email"));
		else
			newUser = new Mentor(request.getParameter("Email"));
		//newUser.setFirstName(request.getParameter("FirstName")).setLastName(request.getParameter("LastName")).setMajors(Arrays.asList(request.getParameter("Majors").split("\\s*,\\s*")));
		newUser.setFirstName(request.getParameter("FirstName")).setLastName(request.getParameter("LastName"));
		OfyService.ofy().save().entity(newUser).now();
		//// This will return the Cat
		//Animal fetched = OfyService.ofy().load().type(Mentee.class).id(email.id).get();

		// This query will produce three objects, the Animal, Mammal, and Cat
		//Query<Animal> all = ofy().load().type(Animal.class);

		// This query will produce the Mammal and Cat
		//Query<Mammal> mammals = ofy().load().type(Mammal.class);
	}
}
