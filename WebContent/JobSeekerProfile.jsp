<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
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
<div class="main" >
	<div class="navbar">
	<img alt="logo" src="./images/log.jpg">
	<%if(session.getAttribute("email")!=null)
		{
		
		%>
		
		<div class="drop">
	<a href="Logout"><button class="dropbtn">Logout</button></a>
	<a href="Alljobs.jsp"><button class="dropbtn">Jobs</button></a>
	
	</div>
	</div><% 
	ResultSet rs=(ResultSet)session.getAttribute("resultset");%>


	<div align="center">
<table>
<tr><td><label>Name</label></td>
	<td> <%= rs.getString("name") %> </td>
	</tr>
<tr><td><label>Email</label></td>
	<td><%= rs.getString("email") %>  </td>
	</tr>
<tr><td><label>Mobile</label></td>
	<td> <%= rs.getString("mobile") %> </td>
	</tr>
<%System.out.println("Jobseeker Profile page "); %>

</table><%
}
	else
	{ response.sendRedirect("JobSeekerLogin.jsp");
}
%>
</div>
<div class="footer">aboutus feedback
	</div>
</div>
</body>
</html>