<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SSO Home Page</title>
<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 15px;
    text-align: left;
}
table#t01 {
    width: 100%;    
    background-color: #0123C1;
}
</style>
</head>
<body>



<!-- <table id="t01">
<caption>Monthly savings</caption>
  <tr>
    <th>Firstname</th>
    <th>Lastname</th> 
    <th>Age</th>
  </tr>
  <tr>
    <td>Eve</td>
    <td>Jackson</td> 
    <td>94</td>
  </tr>
</table> -->




<hr style="border-color: #660000;">

<h1 style="background-color:DodgerBlue;" align = "center">SSO Home-Page</h1>

<%
String compID = request.getParameter("com")!=null?request.getParameter("com"):(String)request.getAttribute("com");




//compID = compID!=null?compID:"";
out.println("Please Enter your Admin ID...:"+compID!=null?compID:"");

		
		
		%>

<form action="${pageContext.request.contextPath}/LoginSSOServlet" method="post">
    <p>ADMIN ID.        
    <input type="text" name="adminname" /></p>
    
     <p> <input type="hidden" name="compID" value = "<%=compID %>"/> </p>

     <p>ADMIN Secret Word.        
    <input type="password" name="adminpass" /></p>
    
    <p>ADD User.
    <input type="submit" name="submit" value="AddUser" /></p>
    
     <p>Register your Company/Organization.
    <input type="submit" name="submit" value="companyregn" /></p>
    
    <p>View Registered Company list.
    <input type="submit" name="submit" value="companylist" /></p>
    
  <!--    <p>User Register.
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
	

<%  if ( (request.getAttribute("msgg")!=null) && request.getAttribute("msgg").equals("show"))
{
	out.println("ADMIN Credentials Required, Please use correct credentials for access.....");
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
	out.println("Company Registration Successful...Please note your Org Admin User ID and Secret ...:");
	
	out.println(request.getAttribute("adminmsgg"));
}
	%>
	
<%  if ( request.getAttribute("companylist")!=null)
{
			
	out.println("Registered Company List");
	out.println("\n"); %>
	
	<table border="2" bordercolor = "blue">
	   <tr>
	        <td>Company Name</td>
	        
	   </tr>
	
	<%
	ArrayList al = (ArrayList)request.getAttribute("companylist");
	for(int i = 0; i < al.size(); i++) {
		
		%>
		
		 <tr><td><%= al.get(i) %></td></tr>
		<%

		//out.println();
		//out.println("\n");
	}

}
	%>
	</table>

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