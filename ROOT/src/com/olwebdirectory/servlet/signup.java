package com.olwebdirectory.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class signup
 */
@WebServlet("/signup")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signup() {
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
		String email = request.getParameter("email");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String password = request.getParameter("password");  


		Class.forName("com.mysql.jdbc.Driver");  
		connection = DriverManager.getConnection(connectionURL, "root", "");  
		PreparedStatement pst = connection.prepareStatement("insert into registeruser (Username, Email, Fname, Lname, UPassword) values(?,?,?,?,?)");  
		pst.setString(1,username);  
		pst.setString(2,email);
		pst.setString(3,firstname);
		pst.setString(4,lastname);
		pst.setString(5,password);
		
/*		PreparedStatement pst1 = connection.prepareStatement("insert into userlogin (username, password) values(?,?)");
		pst1.setString(1,username);
		pst1.setString(2,password);*/


		int i = pst.executeUpdate();  
	//	int j = pst1.executeUpdate();
		if(i!=0){  

			response.sendRedirect("login.jsp");
			System.out.println("User Inserted");

		}  
		else{  
		//pw.println("failed to submit data"); 
			response.sendRedirect("#");
			System.out.println("User Reg Failed");
		}  
		}  
		catch (Exception e){  
		pw.println(e);  
		} 
	}

}
