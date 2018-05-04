<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
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
	<a href="JobSeekerProfile.jsp"><button class="dropbtn">Profile</button></a>
	</div>
	</div>
	<%try{
		Class.forName("org.h2.Driver");
			Connection con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/project", "sa", "");
			PreparedStatement ps=con.prepareStatement("SELECT * FROM JOB");
			ResultSet r=ps.executeQuery();
			
			//session.setAttribute("job",r);
			
System.out.println("jsp all jobs");%>
<div align="center">
<h2> &nbsp;  </h2>
<h2>All jobs</h2><%while(r.next())
{ 
			%>
<table class="data">
<tr>
<td><span class="cmp"><a href='ApplyJob.jsp?jobid=<%=r.getInt("jobid")%>'><%= r.getString("companyname") %></a></span></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td><h4>Location</h4></td>
<td> <%=r.getString("job_location") %> </td> </tr>
<tr><td>&nbsp;</td></tr>
<tr><td><h4>Position</h4></td>
<td> <%=r.getString("position") %> </td> </tr>
<tr><td>&nbsp;</td></tr>
<tr><td><h4>Salary</h4></td>
<td> <%=r.getString("EXP_SALARY") %> </td> </tr>
<tr><td>&nbsp;</td></tr>
<!--  <tr><td><h4>Eligibility</h4></td>
<td> <%=r.getString("eligibility") %> </td> </tr>

<tr><td><h4>Validity</h4></td>
<td> <%=r.getString("START" )%> </td> 

<td>  <%=r.getString("close") %> </td> </tr>-->
</table>
<table class="des"><tr><td>&nbsp;</td></tr>
<tr><td><h4>Job Description</h4></td>
<td><%=r.getString("job_description") %></td></tr>
<tr><td>&nbsp;</td></tr>
			</table>
			<h2> &nbsp;  </h2><%}%>
			
	</div>
	<%}
	
	catch (Exception e)
	{
		System.out.println(e);
	}System.out.println("JobSeker view Recuriter Posted jobs ");
		}
	else
	{ response.sendRedirect("JobSeekerLogin.jsp");
}%>
	</div>


<div class="footer">aboutus feedback
	</div>

</body>
</html>