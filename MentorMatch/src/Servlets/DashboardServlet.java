package Servlets;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entities.Dashboard;
import Entities.SearchRequest;

import com.google.gson.Gson;

@SuppressWarnings("serial")
public class DashboardServlet extends HttpServlet {
	Gson gson = new Gson();
	
	boolean TEST = false;
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {		
					
		resp.setContentType("text/plain");

		//SearchRequest sr = new SearchRequest( req.getParameter("email") );
		//sr.addParameters( Arrays.asList(gson.fromJson( req.getParameter("params"), String[].class)) );
		
		Dashboard dash = new Dashboard(req.getParameter("email"));
		System.out.println("Input: " + req.getParameter("email"));
		dash.getMessages();
		
		System.out.println(dash.getUnread().toArray());
		resp.getWriter().write( dash.toJson() );
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {			
		doPost( req, resp );
	}

}
