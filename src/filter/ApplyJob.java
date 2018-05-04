package filter;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebFilter("/ApplyJob")
@MultipartConfig
public class ApplyJob implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
	{
		System.out.println("Fiter Jobseeker Apply Job ");		
		HttpSession s=((HttpServletRequest)request).getSession();
		ResultSet rs=(ResultSet) s.getAttribute("resultset");
		int jobid=Integer.parseInt(request.getParameter("jobid"));
		System.out.println(jobid);
		try{
			Class.forName("org.h2.Driver");
			Connection con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/project", "sa", "");
			
			Part file=((HttpServletRequest) request).getPart("file");
			System.out.println(file);
			InputStream inputStream=file.getInputStream();
			System.out.println(inputStream);
			byte[] inputbyteArray=new byte[inputStream.available()];
			System.out.println();
			inputStream.read(inputbyteArray);
			ServletContext context=request.getServletContext();
			String applicationPath=context.getRealPath("/");
			String resumeLocationPath=applicationPath+"/resume/";
			File resumeLocationFolder= new File(resumeLocationPath);
			if(!resumeLocationFolder.exists())
			   resumeLocationFolder.mkdirs();
			System.out.println("applicationPath="+applicationPath);
			System.out.println("FolderLocation="+resumeLocationFolder);
			OutputStream fileOutputStream=new FileOutputStream(resumeLocationFolder+"\\"+rs.getString("jobseekerid")+".doc");
			System.out.println(resumeLocationPath.toString());
			System.out.println(fileOutputStream);
			fileOutputStream.write(inputbyteArray);
			fileOutputStream.flush();
			fileOutputStream.close();	
			
			PreparedStatement ps=con.prepareStatement("select * from applicant where jobseekerid=? and jobid=?");
			ps.setInt(1, rs.getInt("jobseekerid"));
			ps.setInt(2, jobid);
			ResultSet applicant=ps.executeQuery();
			if(applicant.next())
			{
				request.setAttribute("applied","Already Applied this job");
				request.getRequestDispatcher("ApplyJob.jsp").include(request, response);
			}else
			{
				PreparedStatement p=con.prepareStatement("insert into APPLICANT(jobid,jobseekerid,status) values(?,?,?)");		
				p.setInt(1,jobid );
				p.setInt(2, rs.getInt("jobseekerid"));
				p.setString(3,request.getParameter("role"));
				int i=p.executeUpdate();
					if(i>0) 
					{
					chain.doFilter(request, response);
					}
				else 
				{
					request.getRequestDispatcher("ApplyJob.jsp").forward(request, response);
				}
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
