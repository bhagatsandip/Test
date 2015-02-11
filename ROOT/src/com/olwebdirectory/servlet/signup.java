package com.olwebdirectory.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.ConnectionFactory;

/**
 * Servlet implementation class signup
 */
@WebServlet("/signup")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection connection; 
   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signup() {
        super();
        // TODO Auto-generated constructor stub
    }
    private static Connection getConnection() 
            throws SQLException, 
                ClassNotFoundException 
    {
        Connection con = ConnectionFactory.
                getInstance().getConnection();
        return con;
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

		try{  
		String username = request.getParameter("username"); 
		String email = request.getParameter("email");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String password = request.getParameter("password");  
		connection = getConnection();
		PreparedStatement pst = connection.prepareStatement("insert into registeruser (Username, Email, Fname, Lname, UPassword) values(?,?,?,?,?)");  
		pst.setString(1,username);  
		pst.setString(2,email);
		pst.setString(3,firstname);
		pst.setString(4,lastname);
		pst.setString(5,password);


		int i = pst.executeUpdate();  
		if(i!=0){  
			response.sendRedirect("login.jsp");
		}  
		else{  
			response.sendRedirect("#");
			}  
		}  
		catch (Exception e){  
		pw.println(e);  
		}finally
        {
            try {
                if(connection != null)
                    connection.close();
                } catch (SQLException e) {
                e.printStackTrace();
            }
        } 
	}

}
