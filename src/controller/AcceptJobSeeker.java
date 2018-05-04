package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AcceptJobSeeker
 */
@WebServlet("/AcceptJobSeeker")
public class AcceptJobSeeker extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		System.out.println("Recruiter AcceptJobSeeker");
		request.getRequestDispatcher("Recruiter.jsp").forward(request, response);
	}

}
