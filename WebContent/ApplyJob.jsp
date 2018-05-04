<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./styles/case.css">
<link rel="stylesheet" href="./styles/jobs.css">
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
	</div>
	<%try{
		
		int jobid=Integer.parseInt(request.getParameter("jobid"));		
		Class.forName("org.h2.Driver");
			Connection con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/project", "sa", "");
			PreparedStatement ps=con.prepareStatement
				("SELECT COMPANYNAME,job_location,POSITION, EXP_SALARY,ELIGIBILITY,START,CLOSE,JOB_DESCRIPTION FROM JOB where jobid=?");
			ps.setInt(1,jobid );
			ResultSet j=ps.executeQuery();
System.out.println("jsp apply jobs");%>
<div align="center">
	<%if(j.next())
	{%>
<h2> &nbsp;  </h2>
<table class="data">
<tr>
<td><span class="cmp"><%= j.getString("companyname") %></span></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td><h4>Location</h4></td>
<td> <%=j.getString("job_location") %> </td> </tr>
<tr><td>&nbsp;</td></tr>
<tr><td><h4>Position</h4></td>
<td> <%=j.getString("position") %> </td> </tr>
<tr><td>&nbsp;</td></tr>
<tr><td><h4>Salary</h4></td>
<td> <%=j.getString("EXP_SALARY") %> </td> </tr>
<tr><td>&nbsp;</td></tr>
 <tr><td><h4>Eligibility</h4></td>
<td> <%=j.getString("eligibility") %> </td> </tr>
<tr><td>&nbsp;</td></tr>
<tr><td><h4>Validity</h4></td>
<td> <%=j.getString("START" )%> </td> 

<td>  <%=j.getString("close") %> </td> </tr>
<tr><td>&nbsp;</td></tr>
</table>

<table class="des"><tr><td>&nbsp;</td></tr>
<tr><td><h4>Job Description</h4></td>
<td><%=j.getString("job_description") %></td></tr>
<tr><td>&nbsp;</td></tr>
			</table> 
			<%}
	
	 %>
			<form action="ApplyJob"method="post" enctype="multipart/form-data">
			<table>
			<tr><td>Apply for this job</td></tr>
			<tr><td><input type="file" name="file" required></td></tr>
			<tr><td><input type="hidden" name="jobid" value="<%=jobid %>"></td></tr>
			<tr><td><button class="button">Apply Job</button><br> <span style="color:red;">
			<%
			if(request.getAttribute("applied")!=null)
			{
				out.print(request.getAttribute("applied"));
			}
			%></span>
			</td></tr>
			
			
			<tr><td><input type="hidden" name="role" value="pending"> </td></tr>
			</table>
			</form>
			<%System.out.println("JobSeeker apply job page ");
				%>
	</div>
	<%}
		
	
	
	catch (Exception e)
	{
		System.out.println(e);
	}
		}
	else
	{ response.sendRedirect("JobSeekerLogin.jsp");
}%>


<div class="footer">about us feedback
	</div>
	</div>




</body>
</html>