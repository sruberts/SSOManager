<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tenant Registration</title>
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
    background-color: #C1F1F1;
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






<h1 style="background-color:DodgerBlue;" align = "center">Tenant Registration</h1>



    
<form action="${pageContext.request.contextPath}/LoginSSOServlet" method="post">

<p>SSO Home.
    <input type="submit" align = "right" name="submit" value="SSO Home" /></p>

<br> <br>


<hr style="border-color: #660000;">
    
	 <%  if ( request.getAttribute("tenantlist")!=null)
		{ %>
		 <table id="t01">
   			<caption>Registered Tenants List</caption>
 			 <tr>
   		 <th>Tenant Name</th>
  			</tr>
  
  <%
	ArrayList al = (ArrayList)request.getAttribute("tenantlist");
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

<br> <br>


<hr style="border-color: #660000;">
    
    
   <br> <br>
   
   <b>Register New Tenant</b>


<hr style="border-color: #660000;">

<p>Company Name.        
    <input type="text" name="compname" /></p>
    
     <p>Please Enter AuthType ( as openID/Gmail).        
    <input type="text" name="authname" /></p>
    
     <p>Please  provide Application EndPoint redirection URL after authentication.        
    <input type="text" name="urlname" /></p>
    
    <p>Save.
    <input type="submit" name="submit" value="Save Tenant" /></p>
    
       <%  if ( (request.getAttribute("adminmsgg")!=null))
{
	out.println("Please Note Your Admin Credentials....:"+request.getAttribute("adminmsgg"));
}
	%>
	
		<%  if ( (request.getAttribute("errmsgg")!=null))
{
		
	out.println(request.getAttribute("errmsgg"));
}
	%>
        
    <hr style="border-color: #660000;">
    
    

	
</form>
</body>
</html>