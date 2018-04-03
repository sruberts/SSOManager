<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SSO Integrate & Process</title>
</head>
<body>
<%
String compID = request.getParameter("compID");
out.println("Please Enter your user ID/Tenant ID for SSO Processing..."+compID);
		
		
		%>

<form action="${pageContext.request.contextPath}/LoginSSOServlet" method="post">
    <p>User ID/Email ID.        
    <input type="text" name="name" /></p>

   <p> <input type="hidden" name="compID" value = "<%=compID %>"/> </p>
    
    <p>Submit.
    <input type="submit" name="submit" value="login" /></p>
    
  <!-- 
     <p>Register your Company/Organization.
    <input type="submit" name="submit" value="companyregn" /></p>
    
    <p>View Registered Company list.
    <input type="submit" name="submit" value="companylist" /></p>
    
     <p>User Register.
    <input type="submit" name="submit" value="userregn" /></p>
    
     <p>User List.
    <input type="submit" name="submit" value="userlist" /></p> -->
    


<%  if ( (request.getAttribute("msgg")!=null) && request.getAttribute("msgg").equals("userregshow"))
{%>

  <p>User ID.        
    <input type="text" name="usrname"  /></p>

 <%  if ( (request.getAttribute("userAuthStatus")!=null) && request.getAttribute("userAuthStatus").equals("openid"))
{ %>

    <p>Secret Word.        
    <input type="password" name="usrpass" /></p>
    
 <%}  %>  
    
    <p>save.
    <input type="submit" name="submit" value="userregnsave" /></p>
	

	<%}   %>
	

<%  if ( (request.getAttribute("msgg")!=null) && request.getAttribute("msgg").equals("companyregshow"))
{%>

 <p>Company Name.        
    <input type="text" name="compname" /></p>
    
     <p>Please Enter AuthType ( as openID/Gmail).        
    <input type="text" name="authname" /></p>
    
     <p>Please  provide Application EndPoint redirection URL after authentication.        
    <input type="text" name="urlname" /></p>
    
    <p>Save.
    <input type="submit" name="submit" value="companysave" /></p>
	

	<%  } %>
	

<%  if ( (request.getParameter("msgg")!=null) && request.getParameter("msgg").equalsIgnoreCase("show"))
{
	out.println("Credentials Required, Please use correct credentials for access...");
}
	%>
	
	<%  if ( (request.getAttribute("msggshow")!=null) && request.getAttribute("msggshow").equals("companyregshowmsg"))
{
	out.println("Please provide correct auth type values as (openID/Gmail)");
}
	%>
	
	
	
	
	<%  if ( (request.getAttribute("msgg")!=null) && request.getAttribute("msgg").equals("compiderr"))
{
	out.println("Company ID error .");
}
	%>
	
		<%  if ( (request.getAttribute("msgg")!=null) && request.getAttribute("msgg").equals("success"))
{
	out.println("Successful...");
}
	%>
	
<%  if ( request.getAttribute("companylist")!=null)
{
			
	out.println("Registered Company List");
	out.println("\n");
	
	ArrayList al = (ArrayList)request.getAttribute("companylist");
	for(int i = 0; i < al.size(); i++) {

		out.println( al.get(i));
		out.println("\n");
	}

}
	%>
	

<%  if ( request.getAttribute("userlist")!=null)
{
			
	out.println("Registered User List");
	out.println("\n");
	
	ArrayList al = (ArrayList)request.getAttribute("userlist");
	for(int i = 0; i < al.size(); i++) {

		out.println( al.get(i));
		out.println("\n");
	}

}
	%>
	
</form>
</body>
</html>