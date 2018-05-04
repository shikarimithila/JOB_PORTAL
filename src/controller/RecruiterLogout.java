package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RecruiterLogout
 */
@WebServlet("/RecruiterLogout")
public class RecruiterLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException 
	{System.out.println("RecruiterLogout ");
	HttpSession session=request.getSession();
	session.removeAttribute("mail");
	session.invalidate();
	response.sendRedirect("RecruiterLogin.jsp");
	}
}
