<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@page import="java.sql.*" %><%@page import="java.io.*"%><%@page import="javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./styles/case.css">
</head>
<body>
<div class="navbar">
	<img alt="logo" src="./images/log.jpg">
	
	<div class="drop">
	

	<a href="RecruiterLogout" ><button class="dropbtn">Logout</button></a>
	
	
	<a href="RecruiterProfile.jsp"><button class="dropbtn">Profile</button></a>
	</div>
	</div>
<div>
<% try 
	{
	int jobid=Integer.parseInt(request.getParameter("jobid"));		
			Class.forName("org.h2.Driver");
			Connection con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/project", "sa", "");
			%>
			<h1>Applied for Jobs</h1>
				<table border="2" align="center">
				<tr>
					<th>Name</th>
				<th>status</th>
				<th>Resume</th>
				</tr>
				
				
			<%
			PreparedStatement job=con.prepareStatement("select * from applicant where jobid=?");
					job.setInt(1,jobid);
					ResultSet re=job.executeQuery();
					
					while(re.next())
					{
						System.out.println("jobseekerid= "+re.getInt("jobseekerid"));
			PreparedStatement p=con.prepareStatement("select name,email from jobseeker where jobseekerid=?");
			p.setInt(1,re.getInt("jobseekerid"));
			
			ResultSet r=p.executeQuery();
			if(r.next()){
			System.out.println("name= "+r.getString("name"));
			System.out.println("email= "+r.getString("email"));
			%>
					
					<tr>
				<td><%=r.getString("name")%></td>
				<td><%=r.getString("email") %></td>
			<%if(re.getString("status").equals("Approve"))
			{
				%>
				
				<td><%=re.getString("status")%></td>
				
		<%}
			
			else if(re.getString("status").equals("pending")) 
				{%>
				<td><%=re.getString("status")%></td>
				<td><a href='DownloadResume?data=<%=re.getInt("jobseekerid") %>&job=<%=jobid%>'>Download</a></td>
				
				<td><a href='AcceptJobSeeker?accept=<%=re.getInt("jobseekerid")%>&job=<%=jobid%>'> <button>Accepted</button></a></td>
				<td> <a href='RejectJobseeker?reject=<%=re.getInt("jobseekerid")%>&job=<%=jobid%>'><button>Rejected</button></a></td>
				<%}
			else if(re.getString("status").equals("reject"))
			{
				%><td><%=re.getString("status")%></td>
				
			<%}}
			
			System.out.println("Recruiter view applied jobseeker ");
			}
	}
				
				catch(Exception e)
			{
				System.out.println(e);
			}
					 %>
					 
	</tr>
	</table>
	</div>
	
	
	
	
	
</body>
</html>