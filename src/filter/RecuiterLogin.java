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

/**
 * Servlet Filter implementation class RecuiterLogin
 */
@WebFilter("/RecruiterLogin")
public class RecuiterLogin implements Filter {

    public RecuiterLogin() {
        // TODO Auto-generated constructor stub
    }
	public void destroy() {
		// TODO Auto-generated method stub
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
	{
		System.out.println("Fiter RecruiterLogin ");
			if(request.getParameter("mail").length()<=0) 
			{
				request.setAttribute("mail","Enter email");
				request.getRequestDispatcher("RecruiterLogin.jsp").forward(request, response);	
			}
			if(request.getParameter("password").length()<=0) 
			{
				request.setAttribute("password","Enter password");
				request.getRequestDispatcher("RecruiterLogin.jsp").forward(request, response);
			}
			
			try {
		Class.forName("org.h2.Driver");
		Connection con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/project","sa","");
		PreparedStatement ps=con.prepareStatement("Select * from RECRUITER where mail=? and password=?");
		ps.setString(1, request.getParameter("mail"));
		ps.setString(2, request.getParameter("password"));
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			
			HttpSession s=((HttpServletRequest)request).getSession();
			s.setAttribute("resultset",rs);
			//HttpSession ion=((HttpServletRequest)request).getSession();
			s.setAttribute("mail", rs.getString("mail"));
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
			
		}
		else 
		{
			request.getRequestDispatcher("RecruiterLogin.jsp").forward(request, response);
		}
	} catch (Exception e) {
		// TODO Auto-generated catch blockRecruiterLogin
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
