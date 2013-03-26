package com.MentorMatch.Alpha;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entities.Mentee;
import Entities.OfyService;

@SuppressWarnings("serial")
public class LogInServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		boolean access = false;
		resp.setContentType("text/plain");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		Mentee fetched = OfyService.ofy().load().type(Mentee.class).id(email).get();
		if(fetched.getPassword().equals(password))
			access = true;
		System.out.println(access);
	}
}