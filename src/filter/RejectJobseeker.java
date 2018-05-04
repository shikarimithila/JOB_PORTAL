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

/**
 * Servlet Filter implementation class RejectJobseeker
 */
@WebFilter("/RejectJobseeker")
public class RejectJobseeker implements Filter {
	public void destroy() {
		// TODO Auto-generated method stub
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
System.out.println("Fiter Recruiter Reject Jobseeker ");
		
		int jobseekerid=Integer.parseInt(request.getParameter("reject"));	
		try {
			Class.forName("org.h2.Driver");
			Connection con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/project", "sa", "");
			System.out.println(jobseekerid);
			PreparedStatement ps=con.prepareStatement("select * from job");
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				System.out.println("jobid "+rs.getInt("jobid"));
				
				PreparedStatement p=con.prepareStatement("update applicant set status=? where jobseekerid=? and jobid=?");
				p.setInt(3,rs.getInt("jobid") );
				p.setInt(2, jobseekerid);
				p.setString(1,"reject");
				p.executeUpdate();
				chain.doFilter(request, response);
				}
			}catch (Exception e) {
				System.out.println(e);
			}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
