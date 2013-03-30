package Servlets;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entities.Mentee;
import Entities.OfyService;

import com.google.gson.Gson;

/*
import com.google.appengine.labs.repackaged.org.json.JSONObject;
import com.google.gwt.json.client.JSONValue;*/

@SuppressWarnings("serial")
public class LogInServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/json");
		String json = req.getParameter("json");
		System.out.println("3");
		Gson gson = new Gson();
<<<<<<< HEAD
		Mentee temp = gson.fromJson(json, Mentee.class);
		Mentee fetched = OfyService.ofy().load().type(Mentee.class).id(temp.getPassword()).get();

=======
		
		Mentee temp = gson.fromJson(json, Mentee.class);
		System.out.println("4");
		Mentee fetched = OfyService.ofy().load().type(Mentee.class).id(temp.getEmail()).get();
		System.out.println("5");
		System.out.println(json);
		System.out.println(temp);
		
>>>>>>> started logout stuff
		if(fetched != null)
		{
			if(fetched.getPassword().equals(temp.getPassword()))
			{
				resp.getWriter().println(gson.toJson(fetched).toString());
				//req.setAttribute("json", gson.toJson(fetched).toString());
			}
			else
			{
				fetched.setPassword("null");
				resp.getWriter().println(gson.toJson(fetched).toString());
			}
		}
		else
		{
			fetched = new Mentee("null", "null");
			System.out.println(gson.toJson(fetched).toString());
			resp.getWriter().println(gson.toJson(fetched).toString());
		}
		resp.sendRedirect(req.getHeader("referer"));
		resp.getWriter().flush();
		resp.getWriter().close();
	}
}