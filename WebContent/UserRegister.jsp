<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Register</title>
</head>
<body>
<%

String compID = request.getParameter("com")!=null?request.getParameter("com"):(String)request.getAttribute("com");

//compID = compID!=null?compID:"";
out.println("Please Enter your  ID Credentials...:"+compID!=null?compID:"");
		
		
		%>

<form action="${pageContext.request.contextPath}/LoginSSOServlet" method="post">
   
    
      
     
  
    


  <p>User ID.        
    <input type="text" name="usrname"  /></p>
    
    <p> <input type="hidden" name="compID" value = "<%=compID %>"/> </p>

 <%  if ( (request.getAttribute("userAuthStatus")!=null) && request.getAttribute("userAuthStatus").equals("openid"))
{ %>

    <p>Secret Word.        
    <input type="password" name="usrpass" /></p>
    
 <%}  %>  
    
    <p>save.
    <input type="submit" name="submit" value="userregnsave" /></p>
	

	
	     
     <p>User List.
    <input type="submit" name="submit" value="userlist" /></p>
    
    

<%  if ( (request.getParameter("msgg")!=null) && request.getParameter("msgg").equalsIgnoreCase("show"))
{
	out.println("Credentials Required, Please use correct credentials for access...");
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