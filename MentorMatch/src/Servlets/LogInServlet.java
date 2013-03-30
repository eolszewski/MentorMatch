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
		Gson gson = new Gson();
		Mentee temp = gson.fromJson(json, Mentee.class);

		Mentee fetched = OfyService.ofy().load().type(Mentee.class).id(temp.getEmail()).get();
		if(fetched != null)
		{
			if(fetched.getPassword().equals(temp.getPassword()))
			{
				req.setAttribute("json", gson.toJson(fetched).toString());
			}
			else
			{
				fetched.setPassword(null);
				req.setAttribute("json", gson.toJson(fetched));
			}
		}
		else
		{
			fetched.setEmail(null);
			req.setAttribute("json", fetched);
		}
		resp.sendRedirect(req.getHeader("referer"));
	}
}