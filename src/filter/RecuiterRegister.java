package filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class RecuiterRegister
 */
@WebFilter("/RecruiterRegister")
public class RecuiterRegister implements Filter 
{
	public void destroy() 
	{	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
	{

		System.out.println("Fiter RecruiterRegister ");
		try 
		{
			if(request.getParameter("password").equals(request.getParameter("passwordconform"))) 
			{
			Class.forName("org.h2.Driver");
			Connection connection=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/project","sa","");
			PreparedStatement valid=connection.prepareStatement("select * from recruiter where mail=?");
			valid.setString(1,request.getParameter("mail"));
			ResultSet data=valid.executeQuery();
			if(data.next())
			{
				request.setAttribute("register","Already register");
				request.getRequestDispatcher("RecruiterRegister.jsp").forward(request, response);
			}
			else
			{
			PreparedStatement register=connection.prepareStatement("insert into RECRUITER(name,mail,mobile,password,companyname,designation) values(?,?,?,?,?,?)");
			register.setString(1,request.getParameter("name"));
			register.setString(2,request.getParameter("mail"));
			register.setLong(3,Long.parseLong(request.getParameter("mobile")));
			register.setString(4,request.getParameter("password"));
			register.setString(5,request.getParameter("companyname"));
			register.setString(6,request.getParameter("designation"));
			int recruiter=register.executeUpdate();
			if(recruiter>0) 
				{	// pass the request along the filter chain
		chain.doFilter(request, response);
				}
			else 
				{
				RequestDispatcher dispatcher=request.getRequestDispatcher("RecruiterRegister.jsp");
				dispatcher.forward(request, response);
				}
			}
			}
			else 
			{
				RequestDispatcher dispatcher=request.getRequestDispatcher("RecruiterRegister.jsp");
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
