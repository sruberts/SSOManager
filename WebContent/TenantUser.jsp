<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tenant User Registration</title>
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

<script language ="javascript">
  function onClick(val)
  {
	  alert(val);
	  
	  
	  var idval = document.getElementById('deleteUser').value;
	  
	  alert(idval);
	  
	  document.getElementById('deleteUser').value = val;
	  
	  alert(document.getElementById('deleteUser').value);
	  
	   if (confirm('Are you sure you want to delete?') )
		   {
		   
		    document.tenantuserform.submit();
		    
		   return true;
		   }else{return false;}
  }
  </script>
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






<h1 style="background-color:DodgerBlue;" align = "center">Tenant User Registration</h1>



<form name="tenantuserform" action="${pageContext.request.contextPath}/LoginSSOServlet" method="post">

<p>SSO Home.
    <input type="submit" align = "right" name="submit" value="SSO Home" /></p>
<br> <br>


<hr style="border-color: #660000;">
     <p> <input type="hidden" name="deleteUser" id="deleteUser" value = "Test123"/> </p>
	 <%
	 String tenantID = request.getParameter("tenantID")!=null?request.getParameter("tenantID"):(String)request.getAttribute("tenantID");
	 out.println(tenantID);
	 
	 if ( request.getAttribute("tenantuserlist")!=null)
		{ %>
		 <table id="t01">
   			<caption>Registered Tenants List</caption>
 			 <tr>
   		 <th>Tenant Name</th>
  			
   		 <th>Delete Action</th>
  			</tr>
  
  <%
	ArrayList al = (ArrayList)request.getAttribute("tenantuserlist");
  if(al!=null)
	for(int i = 0; i < al.size(); i++) {
		
		%>
   <tr><td><%= al.get(i) %></td> <td><input type="submit" name = "submit" value="delete" id = "" onclick="onClick(<%= al.get(i) %>);" /></td></tr>
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
   
   <b>Register New User</b>


<hr style="border-color: #660000;">

 <p>User ID.        
    <input type="text" name="usrname"  /></p>
    
      <p> <input type="hidden" name="tenantID" value = "<%=tenantID %>"/> </p>

 <%  if ( (request.getAttribute("userAuthStatus")!=null) && request.getAttribute("userAuthStatus").equals("openid"))
{ %>

    <p>Secret Word.        
    <input type="password" name="usrpass" /></p>
    
 <%}  %>  
    
    <p>save.
    <input type="submit" name="submit" value="Save Tenant User" /></p>
    
    
       <%  if ( (request.getAttribute("msgg")!=null))
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