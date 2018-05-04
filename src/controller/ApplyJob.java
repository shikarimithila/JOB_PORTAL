package controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ApplyJob
 */
@WebServlet("/ApplyJob")
@MultipartConfig
public class ApplyJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Jobseeker Apply Job");
		
		
		
	request.getRequestDispatcher("JobSeeker.jsp").forward(request, response);
	}

}
