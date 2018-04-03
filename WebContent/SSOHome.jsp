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






<h1 style="background-color:DodgerBlue;" align = "center">SSO Home-Page</h1>



<form action="${pageContext.request.contextPath}/LoginSSOServlet" method="post">

<br> <br>


<hr style="border-color: #660000;">
    
    <p>
    <input type="submit" name="submit" value="Manage Tenant" /></p>
    
    
   <br> <br>


<hr style="border-color: #660000;">
    
    
     <p>
    <input type="submit" name="submit" value="Manage Tenant Users" /></p>
    
    <hr style="border-color: #660000;">
    
    

	
</form>
</body>
</html>