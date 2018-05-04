<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="./styles/style.css">
<link rel="stylesheet" href="./styles/case.css">
<title>Insert title here</title>
</head>
<body>
<div class="main">
<div class="navbar">
	<a href="Home.jsp"><img alt="logo" src="./images/log.jpg"></a>
	
	</div>
	
	<div id="table" align="center" >
<form action="RecruiterLogin" method="post">
<table >
<tr><label>Recruiter Login</label></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>Email</td>
	 <td> <input type="email" name="mail"  placeholder="Mail Id"> <br>
	 <%if(request.getAttribute("mail")!=null)
	 {
	 out.print(request.getAttribute("mail"));
	 } %>
	 </td></tr>
<tr>  <td>Password</td>
	<td> <input type="password" name="password" placeholder="Password" > <br>
	<%if(request.getAttribute("password")!=null)
	 {
	 out.print(request.getAttribute("password"));
	 } 
	 %></td></tr>
<tr><td><a href="#">Forgot Password </a></td></tr>
<tr><td><a href="RecruiterRegister.jsp">New User Register Here </a></td></tr>
<tr>	
	 <td colspan="2" align="center"> <input type="submit" value="Sign In"></td>  
</tr>
<%System.out.println("Recruiter Login page "); %>
</table> 
</form>
</div>
	<div class="footer">aboutus feedback
	</div>
	</div>
	
</body>
</html>