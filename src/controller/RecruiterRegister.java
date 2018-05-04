package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RecruiterRegister extends HttpServlet 
{
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException
	{	
		System.out.println(" RecruiterRegister ");
				request.getRequestDispatcher("RecruiterLogin.jsp").forward(request, response);
				
		
		
	}

}
