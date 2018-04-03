package com.sso;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.api.client.auth.oauth2.BrowserClientRequestUrl;

/**
 * Servlet implementation class ssoservlet
 */
@WebServlet("/ssoservlet")
public class ssoservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static HashMap hm = new HashMap();

    /**
     * Default constructor. 
     */
    public ssoservlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String name  = request.getParameter("name");
		
		String pass  = request.getParameter("pass");
		
		String sub = request.getParameter("submit");
		
	//	String url = new BrowserClientRequestUrl("https://gssomanager.eu-gb.mybluemix.net/Home.jsp", "s6BhdRkqt3").setState("xyz").setRedirectUri("https://client.example.com/cb").getRedirectUri();
	//	    response.sendRedirect(url);
		
		
		
		if( "register".equalsIgnoreCase(sub) &&  !("".equals(name.trim()) && !("".equals(pass.trim())) ) && !(pass.trim().length() <= 1) ) 
		{
			hm.put(name, pass);
		}
		
		if( (name.equalsIgnoreCase("subash") && pass.equalsIgnoreCase("jerome21")) || hm.containsKey(name) && hm.get(name).equals(pass) )
{
	
	
	Cookie ck=new Cookie("ACUSTAToken",name);	
	response.addCookie(ck);
	//response.sendRedirect("/default.jsp");
	response.sendRedirect("https://jffactory.eu-gb.mybluemix.net/default.jsp");
	
}
		else {
		
		response.sendRedirect("/Home.jsp?msgg=show");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
