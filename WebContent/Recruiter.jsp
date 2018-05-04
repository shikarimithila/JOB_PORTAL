
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="./styles/case.css">
</head>
<body>
<div class="main">
	<div class="navbar">
	<img alt="logo" src="./images/log.jpg">
	<% if(session.getAttribute("mail")!=null)
	{
	%>
	
	
	<div class="drop">
	<a href=RecruiterLogout><button class="dropbtn">Logout</button></a>
	<a href="RecruiterAlljobs.jsp"><button class="dropbtn">All Jobs</button></a>
	<a href="Rnewjobs.jsp"><button class="dropbtn">Add New Job</button></a>
	<a href="RecruiterProfile.jsp"><button class="dropbtn">Profile</button></a>
	</div>
	</div>
	</div>
	
<%System.out.println("Recruiter home page ");
}
		else
	{ 
		response.sendRedirect("RecruiterLogin.jsp");
	}%>
<div class="footer">about us feedback
	</div>
</body>
</html>