package com.olwebdirectory.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
		PrintWriter pw = response.getWriter();  
		String connectionURL = "jdbc:mysql://127.0.0.1:3306/olwebdirectory";// newData is the database  
		Connection connection;  
		try{  
		String username = request.getParameter("username"); 
		String password = request.getParameter("password");  


		Class.forName("com.mysql.jdbc.Driver");  
		connection = DriverManager.getConnection(connectionURL, "root", "");  

		Statement stmt= null;
		stmt = connection.createStatement();
		String query = "select username from registeruser where Username='"+username+"' and UPassword='"+password+"'";
		ResultSet rs = stmt.executeQuery(query);


		if(rs.next()){  
            Cookie loginCookie = new Cookie("user",username);
            loginCookie.setMaxAge(30*60);
            response.addCookie(loginCookie);
			response.sendRedirect("/");
			System.out.println("User Authenticated");

		}  
		else{  
		//pw.println("failed to submit data"); 
			response.sendRedirect("#");
			System.out.println("User Authentication Failed");
		}  
		}  
		catch (Exception e){  
		pw.println(e);  
		} 
	}

}
