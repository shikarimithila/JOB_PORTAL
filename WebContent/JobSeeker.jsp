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
	<%if(session.getAttribute("email")!=null)
		{%>
		
	<div class="drop">
	<a href=Logout><button class="dropbtn">Logout</button></a>
	<a href="Alljobs.jsp"><button class="dropbtn">Jobs</button></a>
	<a href="JobSeekerProfile.jsp"><button class="dropbtn">Profile</button></a>
	</div>
	
	<%System.out.println("Jobseeker home page "); %>
	
	</div>
	<% }
	else
	{ response.sendRedirect("JobSeekerLogin.jsp");
}%>
	</div>
</body>
</html>