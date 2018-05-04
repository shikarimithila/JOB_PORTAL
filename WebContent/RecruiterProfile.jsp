<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
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
	<div class="drop">
	<a href=RecruiterLogout><button class="dropbtn">Logout</button></a>
	<a href="RecruiterAlljobs.jsp"><button class="dropbtn">All Jobs</button></a>
	<a href="Rnewjobs.jsp"><button class="dropbtn">Add New Job</button></a>
	<a href="Recruiter.jsp"><button class="dropbtn">Home</button></a>
	
	<%
	ResultSet rs=(ResultSet)session.getAttribute("resultset");
	%>
	</div>
	</div>
	<div id="table" align="center">
<table>
<tr><td>Name</td>
<td><%= rs.getString("name") %></td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr><td>Email</td>
<td ><%=rs.getString("mail") %></td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr><td>Mobile</td><td><%= rs.getString("mobile") %></td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr><td>Company Name</td><td><%=rs.getString("companyname") %></td> </tr>
<tr><td>&nbsp;</td></tr>
<tr><td>Designation</td><td><%= rs.getString("designation") %></td></tr>
</table>
<%System.out.println("Recruiter profile  page "); %>
</div>

	</div>
</body>
</html>