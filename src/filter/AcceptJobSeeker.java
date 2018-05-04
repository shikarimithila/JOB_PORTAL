package filter;

import java.io.IOException;

import java.sql.*;
import java.util.Properties;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Servlet Filter implementation class AcceptJobSeeker
 */
@WebFilter("/AcceptJobSeeker")
public class AcceptJobSeeker implements Filter {

   
	public void destroy() {
		// TODO Auto-generated method stub
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("Fiter Recruiter Accept Jobseeker ");
		
		int jobseekerid=Integer.parseInt(request.getParameter("accept"));	
		int jobid=Integer.parseInt(request.getParameter("job"));
		try {
			Class.forName("org.h2.Driver");
			Connection con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/project", "sa", "");
			System.out.println(jobseekerid);
			PreparedStatement jobseeker=con.prepareStatement("select email from jobseeker where jobseekerid=?");
			jobseeker.setInt(1, jobseekerid);
			ResultSet r=jobseeker.executeQuery();
			if(r.next())
			{
				String to=r.getString("email");
				PreparedStatement ps=con.prepareStatement("select * from job");
				ResultSet rs=ps.executeQuery();
				if(rs.next()) {
					System.out.println("jobid "+rs.getInt("jobid"));
					System.out.println("recruiterid"+rs.getInt("recruiterid") );

					PreparedStatement p=con.prepareStatement("update applicant set status=? where jobseekerid=? and jobid=?");
					p.setInt(3,jobid);
					p.setInt(2, jobseekerid);
					p.setString(1,"Approve");
					p.executeUpdate();
					System.out.println("Approvedd jobseeker");
				PreparedStatement recruiter=con.prepareStatement("select * from recruiter where recruiterid=?");
				recruiter.setInt(1,rs.getInt("recruiterid") );
				ResultSet re=recruiter.executeQuery();
				if(re.next())
				{
					String from=re.getString("mail");
					String host="smtp.gmail.com";
					Properties properties=System.getProperties();
					properties.put("mail.smtp.host", host);
					properties.put("mail.smtp.port", "587");
					properties.put("mail.smtp.auth","true");
					properties.put("mail.smtp.socketFactory.port", "587"); 
					properties.put("mail.smtp.starttls.enable","true");
					/*properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
					properties.put("mail.smtp.socketFactory.fallback", "false");*/
					Session session=Session.getInstance(properties,new javax.mail.Authenticator()
							{
						protected PasswordAuthentication getPasswordAuthentication()
						{
							return new PasswordAuthentication("ranahimanshu412@gmail.com", "kingcapricorn123" );
							
						}
							}
							);
					try 
					{
					
						MimeMessage msg=new MimeMessage(session);
						
						//set message headers
					      msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
					      msg.addHeader("format", "flowed");
					      msg.addHeader("Content-Transfer-Encoding", "8bit");

					    // msg.addFrom(InternetAddress.parse("ranahimanshu412@gmail.com"));
					      msg.addFrom(InternetAddress.parse(from));
					     
					     msg.setSubject("Job Portal", "UTF-8");

					      msg.setText("AS YOU ARE INVITED TO ATTEND INTERVIREW FROM this "
					      +re.getString("companyname")+" company interview will be held between"
					    		  //+re.getString("start")+"to"+re.getString("close")+"which where held in "
					     // +re.getString("job_location")+"based on "+re.getString("position")+"."
					      , "UTF-8");

					      msg.setSentDate(new java.util.Date());

					      msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
					      System.out.println("Message is ready");
				    	  Transport.send(msg);  

					      System.out.println("EMail Sent Successfully!!");
						
						chain.doFilter(request, response);
					}catch(Exception x) 
					{
						System.out.println(x);
					}
				}
			
			
				}	
			}
			
			
		}catch (Exception e) {
			System.out.println(e);
		}
		
		
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
