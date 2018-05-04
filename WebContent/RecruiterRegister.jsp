<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Recruiter</title>
<link rel="stylesheet" href="./styles/style.css">
<link rel="stylesheet" href="./styles/case.css">
</head>
<body>
<div class="main">
	<div class="navbar">
	<a href="Home.jsp"><img alt="logo" src="./images/log.jpg"></a>
	<div class="drop">
	<a href="RecruiterLogin.jsp"><button class="dropbtn">Login</button></a>
	</div>
</div>	
	<div id="table" align="center" >
<form action="RecruiterRegister" method="post">
<span style="color: red;">
<%if(request.getAttribute("register")!=null)
	{
	out.print(request.getAttribute("register"));
	}%></span>
<table>
<caption><h2> Recruiter Register</h2> </caption>
<tr><td>&nbsp;<br></td></tr>
<tr> <th>Name</th>
	<td><input type="text" name="name" placeholder="Name" required="true"/>  
	</td>
</tr>
<tr> <th>Email</th>
	 <td> <input type="text" name="mail"  placeholder="Mail Id"required="true" > 
	 </td>
	 
</tr>
 <tr><th>Mobile</th>
 	<td> <input type="text"name="mobile" placeholder="Mobile"required="true">
 	 </td> 
</tr>
  <tr><th>Company name</th>
 	<td><input type="text"name="companyname" placeholder="Company Name"required="true"> </td>
 	</tr>
<tr>
	<th>Designation</th>
	<td><input type="text" name="designation" placeholder="Designation" required="true"></td>
</tr>	 	
<tr> <th>Password</th>
	<td> <input type="password" name="password" placeholder="Password"required="true"> </td></tr>
	
<tr><th>Conform Password</th>
	 <td> <input type="password" name="passwordconform" placeholder="Conform Password"required="true"> </td></tr>
<tr>
	<th><input type="checkbox" required="true" name="Terms & condition">Terms&Condition </th>
	</tr>	 
<tr>	
	 <td colspan="2" align="center"> <input type="submit" value="Sign Up"></td>  
</tr>

</table> 
</form>
</div><%System.out.println("Recruiter Register  page "); %>
	
	<div class="footer">AboutUs Feedback
	</div>
	
	</div>
</body>
</html>