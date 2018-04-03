<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SSO Process</title>
</head>
<body>
<% 
String compID = (String)request.getAttribute("compID");
out.println("SSO Process..."+compID); 

String nameVal =  (String)request.getAttribute("username");
%>

<form action="${pageContext.request.contextPath}/LoginSSOServlet" method="post">
    <p>User ID/Email ID.        
    <input type="text" name="name" value= "<%= nameVal %>" /></p>

    <p>Secret Word.        
    <input type="password" name="pass" /></p>
    
     <p> <input type="hidden" name="compID" value = "<%=compID %>"/> </p>
    
    <p>Submit.
    <input type="submit" name="submit" value="Access" /></p>
    
 <!--     <p>New User. Register/Change Password.
    <input type="submit" name="submit" value="register" /></p> -->
    
</form>

<% 

if ( (request.getParameter("msgg")!=null) && request.getParameter("msgg").equalsIgnoreCase("show"))
{
	{
		out.println("Credentials Required, Please use correct credentials for access...");
		}
}



%>

</body>
</html>