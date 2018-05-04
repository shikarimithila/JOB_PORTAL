<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./styles/style.css">
<link rel="stylesheet" href="./styles/case.css">
</head>
<body>
<div class="main">
	<div class="navbar">
	<a href="Home.jsp"><img alt="logo" src="./images/log.jpg"></a>
	<div class="drop">
	<a href="JobSeekerLogin.jsp"><button class="dropbtn">Login</button></a>
	</div>
	</div>
	<div id="table" align="center" >
<form action="JobseekerRegister" method="post">
<table>
<caption> <h2>Job Seeker Register </h2></caption>
<tr><td>&nbsp;<br>
<span style="color:red;"><%if(request.getAttribute("register")!=null)
	{
	out.print(request.getAttribute("register"));
	}%></span></td></tr>
<tr> <th>Name</th>
	<td><input type="text" name="name" patten="[A-Za-z]+$" placeholder="Name" required="true"/>  
	</td>
</tr>
<tr> <th>Email</th>
	 <td> <input type="text" name="email"  placeholder="Mail Id"required="true"> 
	 <div class="fil"> </div></td>
	 
</tr>
 <tr><th>Mobile</th>
 	<td> <input type="text"name="mobile" patten="[0-9]{10}" required="true" placeholder="Mobile">
 	 </td> 
</tr>
 
<tr> <th>Password</th>
	<td> <input type="password" name="password"required="true"  placeholder="Password"> </td></tr>
	
<tr><th>Conform Password</th>
	 <td> <input type="password" name="passwordconform"required="true" placeholder="Conform Password"> </td></tr>
<tr>
	<th><input type="checkbox" name="Terms & condition" required="true" align="middle">Terms&Condition </th>
	</tr>	 
<tr>	
	 <td colspan="2" align="center"> <input type="submit" value="Sign Up"></td>  
</tr>
<%System.out.println("Jobseeker register page "); %>
</table> 
</form>
</div>
<div class="footer">AboutUs Feedback
	</div>
</div>
</body>
</html>