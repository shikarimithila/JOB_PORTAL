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
	
	</div>
<div id="table" align="center" >
<form action="JobseekerLogin"method="post">
<table >
<tr><label>JobSeeker Login</label> </tr>



<tr><td>Email</td>
	 <td> <input type="email" name="email"  placeholder="Mail Id"> <br>
	 <%if(request.getAttribute("email")!=null)
		 {
		 out.print(request.getAttribute("email"));
		 }%></td></tr>
<tr>  <td>Password</td>
	<td> <input type="password" name="password" placeholder="Password"> <br>
	<%if(request.getAttribute("password")!=null)
		{
		out.print(request.getAttribute("password"));
		}
		%></td></tr>
<tr><td><a href="#">Forgot Password </a></td></tr>
<tr><td><a href="JobSeekerRegister.jsp">New User Register Here </a></td></tr>
<tr>	
	 <td colspan="2" align="center"> <input type="submit" value="Sign In"></td>  
</tr>

</table> <%System.out.println("JobSeeker login page "); %>
</form>
</div>
<div class="footer">aboutus feedback
	</div>
</div>

</body>
</html>