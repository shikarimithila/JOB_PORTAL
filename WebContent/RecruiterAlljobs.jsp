<%@page import="java.sql.*"%>
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
	<a href="Rnewjobs.jsp"><button class="dropbtn">Add New Job</button></a>
	<a href="RecruiterProfile.jsp"><button class="dropbtn">Profile</button></a>
	<a href="Recruiter.jsp"><button class="dropbtn">Home</button></a>
	
</div>
</div>
<% try 
		{
		 Class.forName("org.h2.Driver");
			Connection con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/project", "sa", "");
			HttpSession s=((HttpServletRequest)request).getSession();
			String mail=s.getAttribute("mail").toString();
			PreparedStatement p=con.prepareStatement("select RECRUITERID from RECRUITER where mail=? ");
			p.setString(1,mail);
			ResultSet rs=p.executeQuery();
			if(rs.next())
			{
				int recruiterid=rs.getInt(1);
			PreparedStatement ps=con.prepareStatement("SELECT COMPANYNAME,job_location,POSITION, EXP_SALARY,ELIGIBILITY,START,CLOSE,JOB_DESCRIPTION,jobid FROM JOB where(recruiterid=?)  ");
			ps.setInt(1, recruiterid);%>
<div align="center"><h2> &nbsp;  </h2>
<%ResultSet r=ps.executeQuery();
System.out.println("jsp all jobs");
while(r.next())
{%><h2> &nbsp;  </h2>
<div>
<table class="update">

</table>
</div>
<table class="data">

<tr><td>&nbsp;</td></tr>
<tr><td><label>company name</label></td>
<td><%= r.getString("companyname") %></td></tr>

<tr><td><label>Location</label></td>
<td> <%=r.getString("job_location") %> </td> </tr>

<tr><td><label>Position</label></td>
<td> <%=r.getString("position") %> </td> </tr>

<tr><td><label>Salary</label></td>
<td> <%=r.getString("EXP_SALARY") %> </td> </tr>

<tr><td><label>Eligibility</label></td>
<td> <%=r.getString("eligibility") %> </td> </tr>

<tr><td><label>Validity</label></td>
<td> <%=r.getString("START" )%> </td> 

<td>  <%=r.getString("close") %> </td> </tr></table>
<table class="des">
<tr><td>&nbsp;</td></tr>
<tr><td><label>Job Description</label></td>
<td><%=r.getString("job_description") %></td>
 <td><a href='AppliedJobs.jsp?jobid=<%=r.getInt("jobid")%>'><button class="button">Applied Candidates</button></a></td> </tr>
<tr><td>&nbsp;</td></tr>

</table>

<%}
		}}
catch (Exception e)
{
	System.out.println(e);
} System.out.println("Recruiter view added jobs ");
%>


</div>
</div>
<div class="footer">aboutus feedback
	</div>
</body>
</html>