<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<div class="drop">
	<a href=RecruiterLogout><button class="dropbtn">Logout</button></a>
	<a href="RecruiterAlljobs.jsp"><button class="dropbtn">All Jobs</button></a>
	<a href="RecruiterProfile.jsp"><button class="dropbtn">Profile</button></a>
	<a href="Recruiter.jsp"><button class="dropbtn">Home</button></a>
	</div>
	</div>
<div id="label" align="center" >
<form method="post" action="RecruiterAddJobs">
<table>
<tr><label>Hiring Details</label></tr>

<tr><th>Company Name</th>
	<td><input type="text"  name="companyname" Placeholder="CompanyName" required="true"></td></tr>
<tr><th>Location</th>
	<td><input type="text"name="job_location"Placeholder="Interview View"required="true"></td></tr>
<tr><th>Position</th>
	<td><input type="text"name="position"Placeholder="Position"required="true"></td></tr>
<tr><th>Salary</th>
	<td ><input type="text"name="salary"Placeholder="Salary"required="true"></td></tr>
<tr><th>Eligibility</th>
	<td><input type="text" name="eligibility" Placeholder="Eligibility"required="true"></td></tr>
<tr><th>Validity</th>
	<td> <input type="date" name="start"placeholder="dd-mm-yyyy" size="1px" required="true"> </td>
	<td><span style="color:blue">FROM</span></td>
	<td><input type="date" name="end"placeholder="dd-mm-yyyy"  size="1px"required="true"></td></tr>
	<tr><td>&nbsp;</td></tr></table>
	<table>
<tr><th>Job Description</th>
	<td>&nbsp;</td>
<td><textarea rows="16" cols="40" name="job_description" Placeholder="Job Description"required="true"></textarea></td></tr>
	<tr><td>&nbsp;</td></tr>
<tr>	
	<td> <button class="button">Submit</button></td>  </tr>
	<tr><td>&nbsp;</td></tr>

</table><%System.out.println("Recruiter add job  "); %>
</form>
</div>
</div>
<div class="footer">about us feedback
	</div>
</body>
</html>