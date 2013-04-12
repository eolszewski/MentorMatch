package Tests;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;
import java.io.*;
import javax.servlet.http.*;
import org.junit.Test;

import Servlets.XMPPReceiverServlet;

public class TestXmppServlet{

    @Test
    public void testServlet() throws Exception {
        HttpServletRequest request = mock(HttpServletRequest.class);       
        HttpServletResponse response = mock(HttpServletResponse.class);    

        when(request.getParameter("username")).thenReturn("username");
        when(request.getParameter("password")).thenReturn("password");
        PrintWriter writer = new PrintWriter("somefile.txt");
       when(response.getWriter()).thenReturn(writer);

        new XMPPReceiverServlet().doPost(request, response);

        verify(request, atLeast(1)).getParameter("username"); // only if you want to verify username was called...
       writer.flush(); // it may not have been flushed yet...
        
    }
    
    
}