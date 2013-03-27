package Servlets;

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
		if(fetched != null)
		{
			if(fetched.getPassword().equals(password))
			{
				access = true;
				resp.getWriter().println("Logged in!");
			}
			else
				resp.getWriter().println("Invalid username / password");
		}
		else
			resp.getWriter().println("Account does not exist");
	}
}