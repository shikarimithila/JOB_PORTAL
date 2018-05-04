package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DownloadResume
 */
@WebServlet("/DownloadResume")
public class DownloadResume extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Recruiter Download Resume");
		String applicationPath=request.getRealPath("/");
		System.out.println("applicationPath "+"="+applicationPath);
		File resumeLocationFolder=new File(request.getServletContext().getRealPath("/")+"/resume/");
		System.out.println(resumeLocationFolder);
		response.setContentType("application/msword");
		String name=request.getParameter("data");
		System.out.println("filename = "+name);
		
		response.setHeader("Context-Disposition","attachment;filename="+name);
		FileInputStream file=new FileInputStream(resumeLocationFolder+"/"+name+".doc");
		System.out.println("file  "+file);
		byte[] fileByteArray=new byte[file.available()];
		System.out.println("fileByteArray"+fileByteArray);
		file.read(fileByteArray);
		OutputStream os=response.getOutputStream();
		file.read(fileByteArray);
		os.write(fileByteArray);
		os.flush();
		os.close();
		
	}

}
