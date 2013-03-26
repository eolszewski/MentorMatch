package com.MentorMatch.Alpha;

	import java.io.IOException;
	import javax.servlet.http.*;

	@SuppressWarnings("serial")
	public class FindMentorServlet extends HttpServlet {
		public void doPost(HttpServletRequest req, HttpServletResponse resp)
				throws IOException {
			resp.setContentType("text/plain");
			resp.getWriter().println(req.getParameter("email"));
			resp.getWriter().println(req.getParameter("password"));
		}
	}

