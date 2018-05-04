package filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@WebFilter("/JobseekerLogin")
public class JobSeekerLogin implements Filter {

   	public void destroy() {
		// TODO Auto-generated method stub
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
	{System.out.println("jodseeker Login filter");
		if(request.getParameter("email").length()<=0) 
		{
		request.setAttribute("email","Enter email");
		request.getRequestDispatcher("JobSeekerLogin.jsp").forward(request, response);	
		}
		if(request.getParameter("password").length()<=0) 
		{
		request.setAttribute("password","Enter password");
		request.getRequestDispatcher("JobSeekerLogin.jsp").forward(request, response);
		}
		try 
		{
			Class.forName("org.h2.Driver");
			Connection connection=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/project", "sa",""); 
			PreparedStatement data=connection.prepareStatement("Select * from JOBSEEKER where email=? and password=?"); 
			data.setString(1, request.getParameter("email"));
			data.setString(2, request.getParameter("password")); 
			ResultSet login=data.executeQuery();
			if(login.next())
			{
				HttpSession session=((HttpServletRequest)request).getSession();
				session.setAttribute("resultset", login);
				session.setAttribute("email", login.getString("email"));
				chain.doFilter(request, response);
			}
			else
			{
				request.setAttribute("autentication", "Failed");
				request.getRequestDispatcher("JobSeekerLogin.jsp").forward(request, response);
			}
		}catch(Exception e)
		{
			System.out.println(e);
		}
		
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
