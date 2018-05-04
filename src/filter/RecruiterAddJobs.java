package filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@WebFilter("/RecruiterAddJobs")
public class RecruiterAddJobs implements Filter {

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("Fiter Recruiter Add Jobs ");
		try{
			
			System.out.println(request.getParameter("start"));
			
			
			System.out.println(new SimpleDateFormat("yyyy-mm-dd").parse(request.getParameter("start")));
			
			
			
			java.util.Date start=new SimpleDateFormat("yyyy-mm-dd").parse(request.getParameter("start"));
			
			  System.out.println(new SimpleDateFormat("yyyy-mm-dd").format(start));
			
			java.sql.Date sqlstart=new java.sql.Date(start.getYear(),start.getMonth(),start.getDate());
			
			java.util.Date dat=new SimpleDateFormat("yyyy-mm-dd").parse(request.getParameter("end"));
			java.sql.Date sqlend=new java.sql.Date(dat.getYear(),dat.getMonth(),dat.getDate());
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
				
				System.out.println(recruiterid);
			PreparedStatement ps=con.prepareStatement("insert into JOB(companyname,JOB_LOCATION,position,exp_salary,eligibility,start,close,job_description,recruiterid) values(?,?,?,?,?,?,?,?,?) ");
			ps.setString(1,request.getParameter("companyname"));
			ps.setString(2, request.getParameter("job_location"));
			ps.setString(3,request.getParameter("position"));
			ps.setFloat(4, Float.parseFloat(request.getParameter("salary")));
			ps.setString(5,request.getParameter("eligibility"));
			ps.setDate(6,sqlstart);
			ps.setDate(7,sqlend);
			ps.setString(8,request.getParameter("job_description"));
			ps.setInt(9, recruiterid);
			int i=ps.executeUpdate();
			
			if(i>0)
			{
				
				chain.doFilter(request, response);
			}
			else
			{
				request.getRequestDispatcher("Rnewjobs.jsp").forward(request, response);
			}
			}
			
		}catch (Exception e)
		{
			e.printStackTrace();
		}
	
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
