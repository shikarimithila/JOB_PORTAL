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

@WebFilter("/JobseekerRegister")
public class JobseekerRegister implements Filter 
{

	public void destroy() 
	{
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
	{
		try {
			
				Class.forName("org.h2.Driver");
				Connection connnection=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/project", "sa", "");
				PreparedStatement data=connnection.prepareStatement("select * from jobseeker where email=?");
				data.setString(1, request.getParameter("email"));
				ResultSet valid=data.executeQuery();
				System.out.println("filter jobseeker");
				if(valid.next())
				{
					request.setAttribute("register","Already register");
					request.getRequestDispatcher("JobSeekerRegister.jsp").forward(request, response);
				}else
				{
					if(request.getParameter("password").equals(request.getParameter("passwordconform")))
					{
					PreparedStatement register=connnection.prepareStatement("insert into JOBSEEKER(name,email,mobile,password) values(?,?,?,?)");
					register.setString(1,request.getParameter("name") );
					register.setString(2,request.getParameter("email"));
					register.setLong(3,Long.parseLong(request.getParameter("mobile")));
					register.setString(4,request.getParameter("password"));
					System.out.println("filter jobseeker");
					int jobseeker=register.executeUpdate();
					if(jobseeker>0)
					{
						chain.doFilter(request, response);
					}
					else
					{
						request.getRequestDispatcher("JobSeekerRegister.jsp").forward(request, response);
					}
					
					
				}else
				{
					request.getRequestDispatcher("JobSeekerRegister.jsp").forward(request, response);
				}
			
		
			}
			
		}catch(Exception e)
		{
			System.out.println(e);
		}
	}

	
	public void init(FilterConfig fConfig) throws ServletException 
	{
	}

}
