package com.sso;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginSSOServlet
 */
@WebServlet("/LoginSSOServlet")
public class LoginSSOServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static HashMap credentialsMap = new HashMap();
	private static ArrayList companyList = new ArrayList();
	private static HashMap <String,ArrayList>usersMap = new HashMap();
	
	private static ArrayList userList = new ArrayList();
	
	//private static String compID = "";
	
	static String compData[] = {"oEnQa","WtOxC","ReTfb","UoFgh","FeVTY","sXINM","vSnhn","gTHdf","nEiSD"};
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginSSOServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at 112: ").append(request.getContextPath());
		
		 // redirect to google for authorization
		
		String compID  = request.getParameter("compID");
		
		String name  = request.getParameter("name");
		
		String pass  = request.getParameter("pass");
		
		String logoff = request.getParameter("logoff");
		
		request.setAttribute("username", name);
		
		String actionName = request.getParameter("submit");
		
		String GAuthCode = request.getParameter("GAuthCode");
		
		System.out.println("The actionName ID ...:"+actionName);
		
		 String tenantID  = request.getParameter("tenantID");
		 
		 System.out.println("The TENANT ID ...:"+tenantID);
		 
		 
		 System.out.println("The delete  ID ...:"+request.getParameter("deleteUser"));
		
		 
		 if("SSO Home".equalsIgnoreCase(actionName)) {
			 
			 request.getRequestDispatcher("/SSOHome.jsp").forward(request, response);
		 
		 }
		 
		 else if("delete".equalsIgnoreCase(actionName)) {
			 
			 
			 ArrayList al = (ArrayList)usersMap.get(tenantID);
			 
			 String user = request.getParameter("deleteUser");
			 
				al.remove(user);
				userList.remove(user);
				//usersMap.put(compID, al);
				
				System.out.println("delete USER name"+user);
				
				request.setAttribute("msgg", "success");
				request.setAttribute("tenantuserlist", al); 
				request.setAttribute("tenantID", tenantID); 
				
				if("openID".equals(credentialsMap.get(tenantID+"AUTHTYPE")))
				{
					request.setAttribute("userAuthStatus", "openid");
				}
				

				System.out.println("Forwardingg ...After delete");
				request.getRequestDispatcher("/TenantUser.jsp").forward(request, response);
		 }
		
		 else  if("Save Tenant User".equalsIgnoreCase(actionName))
			
		{
	  tenantID  = request.getParameter("tenantID");
	 
	 System.out.println(tenantID);
	 
	 System.out.println("MAsterdata for USERRR: "+credentialsMap);
			if (credentialsMap.containsKey(tenantID+"AUTHTYPE"))
			{
				
				 System.out.println("comes user");
				
				String user  = request.getParameter("usrname");
				
				String gpass  = request.getParameter("usrpass");
				
				 tenantID  = request.getParameter("tenantID");
				
				if(gpass == null) {gpass = "";}
				
				credentialsMap.put(tenantID+user, gpass);
				
				if(usersMap.get(tenantID) == null) {
					usersMap.put(tenantID, new ArrayList()) ; 
					}
				
				ArrayList al = (ArrayList)usersMap.get(tenantID);
				al.add(user);
				userList.add(user);
				//usersMap.put(compID, al);
				
				System.out.println("USER name"+user);
				
				System.out.println("USER pass"+gpass);
				
				System.out.println("USER LIST"+userList);
				
				System.out.println("USER LIST"+userList.size());
				
				request.setAttribute("tenantID", tenantID);
				
				request.setAttribute("msgg", "success");
				request.setAttribute("tenantuserlist", al); 
				request.setAttribute("tenantID", tenantID); 
				
				if("openID".equals(credentialsMap.get(tenantID+"AUTHTYPE")))
				{
					request.setAttribute("userAuthStatus", "openid");
				}
				
				
				
				
			}else {
			request.setAttribute("errmsgg", "compiderr");
			
			}
			
			System.out.println("Forwardingg ...");
			request.getRequestDispatcher("/TenantUser.jsp").forward(request, response);
			
		}	
		else if("Admin Login".equalsIgnoreCase(actionName))
			
		{
	
	

	System.out.println("MASTER   Add USer .... :"+credentialsMap);
	
	String adminname  = request.getParameter("adminname");
	String adminpass  = request.getParameter("adminpass");
	
	 tenantID = request.getParameter("tenantID");
	
	System.out.println("ADMIN USER    ....:"+adminname);
	System.out.println("ADMIN PASS    ....:"+credentialsMap.get(adminname));
	
	System.out.println("tenantID   ....:"+tenantID);
	
	if( credentialsMap.get(adminname) != null && credentialsMap.get(adminname).equals(adminpass))
	{
		//String redirectURL = credentialsMap.get(compID+"ENDPOINTURL")+"?AccessToken=1000&uname="+name;
	System.out.println("ADMIN USER IS SUCCESS   ....:");
		request.setAttribute("msgg", "success");
		String adminMsg = "ADMIN user credentials are correc, Please proceed";
		request.setAttribute("adminmsgg", adminMsg);
	//response.sendRedirect(redirectURL);
		
		String compname = adminname.replace("ADMIN", "");
		
		if("openID".equals(credentialsMap.get(tenantID+"AUTHTYPE")))
		{
			request.setAttribute("userAuthStatus", "openid");
		}
		
		request.setAttribute("tenantID", tenantID);
		
		if(usersMap.get(tenantID) == null) {
			usersMap.put(tenantID, new ArrayList()) ; 
			}
		ArrayList al = (ArrayList)usersMap.get(tenantID);
		//al.add("Test USer"); al.add(compID);
		
		System.out.println("gottttttttttttt allll"+al);
		System.out.println("gottttttttttttt list"+userList);
		
	request.setAttribute("tenantuserlist", al); 
	request.setAttribute("tenantID", tenantID); 
		
		//request.getRequestDispatcher("/TenantUser.jsp").forward(request, response);
	}
	else {
		System.out.println("ADMIN USER notttt SUCCESS   ....:");
	request.setAttribute("errmsgg", "Credentials Error");
	request.getRequestDispatcher("/AdminLogin.jsp").forward(request, response);}
	

	
	
	System.out.println("gottttttttttttt tenantID"+tenantID);
	 request.setAttribute("tenantID", tenantID); 
			request.getRequestDispatcher("/TenantUser.jsp").forward(request, response);
			
		}
else if("Manage Tenant Users".equalsIgnoreCase(actionName))
			
		{
	 request.setAttribute("tenantlist", companyList); 
			request.getRequestDispatcher("/AdminLogin.jsp").forward(request, response);
			
		}
		
else if("Manage Tenant".equalsIgnoreCase(actionName))
			
		{
	 request.setAttribute("tenantlist", companyList); 
			request.getRequestDispatcher("/TenantRegistration.jsp").forward(request, response);
			
		}
 else if("Save Tenant".equalsIgnoreCase(actionName))
		
	{
	 
	 

		String compname  = request.getParameter("compname");
		String authname  = request.getParameter("authname");
		String urlname  = request.getParameter("urlname");
		
		if(authname != null && ( "openID".equalsIgnoreCase(authname) || "gmail".equalsIgnoreCase(authname) ) )
		{
			if("openID".equalsIgnoreCase(authname))
			{
				authname = "openID";
				
			}else {authname = "Gmail";}
			
		companyList.add(compname);
		credentialsMap.put(compname+"ENDPOINTURL", urlname);
		credentialsMap.put(compname+"AUTHTYPE", authname);
		
		request.setAttribute("msgg", "success");
		
		request.setAttribute("compID", compname);
		
		request.setAttribute("com", compname);
		
		
					
		credentialsMap.put(compname+"ADMIN", "admin");
		
		String adminMsg = compname+"ADMIN"+" / "+"admin";
		request.setAttribute("adminmsgg", adminMsg);
		
		//compID = compname;
		
		}else {
		
		
		request.setAttribute("errmsgg", "Please enter valid Auth Type value");
		//request.setAttribute("msggshow", "companyregshowmsg"); 
		}
				
	
		
	 	request.setAttribute("tenantlist", companyList); 
		request.getRequestDispatcher("/TenantRegistration.jsp").forward(request, response);
		
	}
 else if("login".equalsIgnoreCase(actionName))
			
		{
			System.out.println("MASTER   0000:"+credentialsMap);
			if ( credentialsMap.containsKey(compID+name))
			{
				if(credentialsMap.get(compID+"AUTHTYPE").equals("openID"))
						{
					request.setAttribute("username", name);
					request.setAttribute("compID", compID);
					request.getRequestDispatcher("/SSOLogon.jsp").forward(request, response);
						}
				else
				{
					String redirectURL = (String)credentialsMap.get(compID+"ENDPOINTURL")+"?AccessToken=1000";
							//+"?name="+name;
							//+"?tokenCode=100020";
					
					StringBuilder oauthUrl = new StringBuilder().append("https://accounts.google.com/o/oauth2/auth")
							   .append("?client_id=").append("321847307823-g837paro7k60sacc3jhuk902iao4bt7c.apps.googleusercontent.com") // the client id from the api console registration
							   .append("&response_type=code")
							   .append("&scope=openid%20email") // scope is the api permissions we are requesting
							   .append("&redirect_uri=") //https://gssomanager.eu-gb.mybluemix.net/default.jsp")  the servlet that google redirects to after authorization
							   .append(redirectURL)
							   .append("&state=").append(name)
							   .append("&access_type=offline") // here we are asking to access to user's data while they are not signed in
							   .append("&approval_prompt=force"); // this requires them to verify which account to use, if they are already signed in
							   
							  // Cookie ck=new Cookie("ACUSTAToken",name);
							  // ck.setMaxAge(-2);
							  // ck.setPath("/");
							//	response.addCookie(ck);
					
					Cookie ck=new Cookie(name,(String)credentialsMap.get(compID+"ENDPOINTURL"));	
					ck.setMaxAge(-1);
					response.addCookie(ck);
								
					System.out.println("Google  Redirect URL ....:"+redirectURL);
					
							   response.sendRedirect(oauthUrl.toString());
					System.out.println("GOOGLE CALLS SUCCESS....");
				}
				
			}
			else{
			request.setAttribute("msgg", "compiderr");
			request.getRequestDispatcher("/Home.jsp").forward(request, response);}
			
		}
		else if("Access".equalsIgnoreCase(actionName))
			
		{
			System.out.println("MASTER   1111:"+credentialsMap);
			
			String encname = "";
			if(credentialsMap.get(compID+name).equals(pass))
			{
				
				try
				
				{String st = name;
				
				StringBuffer sb = new StringBuffer();
				StringBuffer sec = new StringBuffer();
				
				StringBuffer ED = new StringBuffer();
				
				for(int e=0; e < st.length();e++)
				{
					if(e%2==0)
					sb.append(st.charAt(e));
					else
						sec.append(st.charAt(e));
						
				}
				System.out.println(sb);
				System.out.println(sec);
				
				ED.append(sec).append(sb);
				encname = ED.toString();
				
				System.out.println("ENCRPTED   :"+ED);
				}catch(Exception e)
				{
					System.out.println(e);
				}
				
								
				String redirectURL = credentialsMap.get(compID+"ENDPOINTURL")+"?AccessToken=1000&uname="+name+"&encname="+encname;
				System.out.println("Redirect URL ....:"+redirectURL);
			response.sendRedirect(redirectURL);
			}
			else {
			request.setAttribute("msgg", "companyregshow");
			request.getRequestDispatcher("/Home.jsp").forward(request, response);}
			
		}
		else if( request.getParameter("GAuthCode")!=null && "1000".equals(request.getParameter("GAuthCode")))
			
		{
			//request.setAttribute("msgg", "companyregshow");
			//request.getRequestDispatcher("/Home.jsp").forward(request, response);
			
			Cookie ck[]=request.getCookies();  
			if( ck != null)
			for(int i=0;i<ck.length;i++){   
			 if(ck[i].getName().contains("@gmail.com"))
			 {
				 System.out.println("  COOKIE   :   "+ck[i].getValue()+"  ");  //printing name and value of cookie
				 //cookieStatus = true;
			 }
			}
			
			 response.sendRedirect("https://GMOC.eu-gb.mybluemix.net/default.jsp");
			
		}

		else if("companyregn".equalsIgnoreCase(actionName))
			
		{
			request.setAttribute("msgg", "companyregshow");
			request.getRequestDispatcher("/Registration.jsp").forward(request, response);
			
		}
		
		else if("companysave".equalsIgnoreCase(actionName))
			
		{
			String compname  = request.getParameter("compname");
			String authname  = request.getParameter("authname");
			String urlname  = request.getParameter("urlname");
			
			if(authname != null && ( "openID".equalsIgnoreCase(authname) || "gmail".equalsIgnoreCase(authname) ) )
			{
				if("openID".equalsIgnoreCase(authname))
				{
					authname = "openID";
					
				}else {authname = "Gmail";}
				
			companyList.add(compname);
			credentialsMap.put(compname+"ENDPOINTURL", urlname);
			credentialsMap.put(compname+"AUTHTYPE", authname);
			
			request.setAttribute("msgg", "success");
			
			request.setAttribute("compID", compname);
			
			request.setAttribute("com", compname);
			
			
						
			credentialsMap.put(compname+"ADMIN", "admin");
			
			String adminMsg = compname+"ADMIN"+" / "+"admin"+compname;
			request.setAttribute("adminmsgg", adminMsg);
			
			//compID = compname;
			
			}else {
			
			
			request.setAttribute("msgg", "companyregshow");
			request.setAttribute("msggshow", "companyregshowmsg"); 
			}
			request.getRequestDispatcher("/Registration.jsp").forward(request, response);
			
		}
		else if("AddUser".equalsIgnoreCase(actionName))
			
		{
			System.out.println("MASTER   Add USer .... :"+credentialsMap);
			
			String adminname  = request.getParameter("adminname");
			String adminpass  = request.getParameter("adminpass");
			
			System.out.println("ADMIN USER    ....:"+adminname);
			System.out.println("ADMIN PASS    ....:"+credentialsMap.get(adminname));
			
			
			if( credentialsMap.get(adminname) != null && credentialsMap.get(adminname).equals(adminpass))
			{
				//String redirectURL = credentialsMap.get(compID+"ENDPOINTURL")+"?AccessToken=1000&uname="+name;
			System.out.println("ADMIN USER IS SUCCESS   ....:");
				request.setAttribute("msgg", "success");
				String adminMsg = "ADMIN user is correct"+" / "+"admin";
				request.setAttribute("adminmsgg", adminMsg);
			//response.sendRedirect(redirectURL);
				
				String compname = adminname.replace("ADMIN", "");
				
				if("openID".equals(credentialsMap.get(compID+"AUTHTYPE")))
				{
					request.setAttribute("userAuthStatus", "openid");
				}
				
				request.setAttribute("com", compname);
				
				request.getRequestDispatcher("/UserRegister.jsp").forward(request, response);
			}
			else {
				System.out.println("ADMIN USER notttt SUCCESS   ....:");
			request.setAttribute("msgg", "show");
			request.getRequestDispatcher("/Registration.jsp").forward(request, response);}
			
		}
		else if("companylist".equalsIgnoreCase(actionName))
			
		{
			
			
			request.setAttribute("com", compID);
		request.setAttribute("companylist", companyList); 
		request.getRequestDispatcher("/Registration.jsp").forward(request, response);
	
		}
		else if("userregn".equalsIgnoreCase(actionName))
			
		{
			request.setAttribute("msgg", "userregshow");
			
			if(usersMap.get(compID) == null)
			{
			usersMap.put(compID, new ArrayList());
				}
			
			if("openID".equals(credentialsMap.get(compID+"AUTHTYPE")))
			{
				request.setAttribute("userAuthStatus", "openid");
			}
			
			System.out.println("1111  null    :"+userList.size());
			
			System.out.println("1111      :"+userList);
			
			request.getRequestDispatcher("/Home.jsp").forward(request, response);
			
		}
		
		else if("userregnsave".equalsIgnoreCase(actionName))
			
		{
			
			if (credentialsMap.containsKey(compID+"AUTHTYPE"))
			{
				
				String user  = request.getParameter("usrname");
				
				String gpass  = request.getParameter("usrpass");
				
				if(gpass == null) {gpass = "";}
				
				credentialsMap.put(compID+user, gpass);
				ArrayList al = (ArrayList)usersMap.get(compID);
				al.add(user);
				userList.add(user);
				//usersMap.put(compID, al);
				
				System.out.println("USER name"+user);
				
				System.out.println("USER pass"+gpass);
				
				System.out.println("USER LIST"+userList);
				
				System.out.println("USER LIST"+userList.size());
				
				request.setAttribute("com", compID);
				
				request.setAttribute("msgg", "success");
				
			}else {
			request.setAttribute("msgg", "compiderr");}
			request.getRequestDispatcher("/UserRegister.jsp").forward(request, response);
			
		}
		else if("userlist".equalsIgnoreCase(actionName))
			
		{
			
			if(usersMap.get(compID) == null) {
				usersMap.put(compID, new ArrayList()) ; 
				}
			ArrayList al = (ArrayList)usersMap.get(compID);
			//al.add("Test USer"); al.add(compID);
			
			System.out.println("gottttttttttttt allll"+al);
			System.out.println("gottttttttttttt list"+userList);
			
		request.setAttribute("userlist", al); 
		request.setAttribute("com", compID);
		request.getRequestDispatcher("/Home.jsp").forward(request, response);
	
		}
		
		else if("logoff".equalsIgnoreCase(logoff))
		{
			Cookie ck=new Cookie("ACUSTAToken","");	
			ck.setMaxAge(0);
			response.addCookie(ck);
			response.sendRedirect("/Home.jsp");
		}
		else if (name != null && name.contains("gmail.com"))
		{
		   StringBuilder oauthUrl = new StringBuilder().append("https://accounts.google.com/o/oauth2/auth")
		   .append("?client_id=").append("321847307823-g837paro7k60sacc3jhuk902iao4bt7c.apps.googleusercontent.com") // the client id from the api console registration
		   .append("&response_type=code")
		   .append("&scope=openid%20email") // scope is the api permissions we are requesting
		   .append("&redirect_uri=https://gssomanager.eu-gb.mybluemix.net/default.jsp") // the servlet that google redirects to after authorization
		   .append("&state=this_can_be_anything_to_help_correlate_the_response%3Dlike_session_id")
		   .append("&access_type=offline") // here we are asking to access to user's data while they are not signed in
		   .append("&approval_prompt=force"); // this requires them to verify which account to use, if they are already signed in
		   
		   Cookie ck=new Cookie("ACUSTAToken",name);
		   ck.setMaxAge(-2);
		   ck.setPath("/");
			response.addCookie(ck);
			
		    
		   response.sendRedirect(oauthUrl.toString());
		 
		  
		}
		else {
		
		
		request.getRequestDispatcher("/SSOLogon.jsp").forward(request, response);
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
