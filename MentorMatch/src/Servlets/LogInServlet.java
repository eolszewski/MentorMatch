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

import com.google.gson.Gson;

@SuppressWarnings("serial")
public class LogInServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/plain");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		Gson gson = new Gson();

		Mentee fetched = OfyService.ofy().load().type(Mentee.class).id(email).get();
		if(fetched != null)
		{
			if(fetched.getPassword().equals(password))
			{
				req.setAttribute("jsonString", gson.toJson(fetched).toString());
				resp.sendRedirect(req.getHeader("referer"));
			}
			else
			{
				req.setAttribute("jsonString", "password");
				resp.sendRedirect(req.getHeader("referer"));
			}
		}
		else
		{
			req.setAttribute("jsonString", "password");
			resp.sendRedirect(req.getHeader("referer"));
		}
	}
}