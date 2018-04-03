<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tenant Admin Login</title>
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






<h1 style="background-color:DodgerBlue;" align = "center">Tenant Admin Process </h1>



<form action="${pageContext.request.contextPath}/LoginSSOServlet" method="post">

<br> <br>


<hr style="border-color: #660000;">
    
	
  
</table>

<br> <br>


<hr style="border-color: #660000;">
    
    Please select Tenant for User Admin Activities.
    
     <select name="tenantID">
     <%
	ArrayList al = (ArrayList)request.getAttribute("tenantlist");
    		if(al!=null)
	for(int i = 0; i < al.size(); i++) {
		
		%>
   
  <option value="<%=al.get(i) %>"> <%= al.get(i) %></option>
  <%
}
	%>
  
</select>
    
    
   <br> <br>
   
   <b>Please provide Admin Credentials</b>


<hr style="border-color: #660000;">

  <p>ADMIN ID.        
    <input type="text" name="adminname" /></p>
    
    

     <p>ADMIN Secret Word.        
    <input type="password" name="adminpass" /></p>
    
 
    
    <p>save.
    <input type="submit" name="submit" value="Admin Login" /></p>
    
    
  
        
    <hr style="border-color: #660000;">
    
         <%  if ( (request.getAttribute("adminmsgg")!=null))
{
	out.println("Your Admin Credentials....:"+request.getAttribute("adminmsgg"));
}
         if ( (request.getAttribute("errmsgg")!=null))
{
		
	out.println(request.getAttribute("errmsgg"));
}
	%>

	
</form>
</body>
</html>