package com.olwebdirectory.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class submitsite
 */
@WebServlet("/submitsite")
public class submitsite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public submitsite() {
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
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String username = request.getParameter("username"); 
		String url = request.getParameter("url");
		String title = request.getParameter("title");
		String category = request.getParameter("category");
		Date date = new Date();
		String submitteddate = dateFormat.format(date);
		String description = request.getParameter("description");  


		Class.forName("com.mysql.jdbc.Driver");  
		connection = DriverManager.getConnection(connectionURL, "root", "");  
		PreparedStatement pst = connection.prepareStatement("insert into sites (Username, url, Title, Category, Date, Description) values(?,?,?,?,?,?)");  
		pst.setString(1,username);  
		pst.setString(2,url);
		pst.setString(3,title);
		pst.setString(4,category);
		pst.setString(5,submitteddate);
		pst.setString(6,description);

		int i = pst.executeUpdate();  
		if(i!=0){  

			response.sendRedirect("/");
			System.out.println("Site Submitted");

		}  
		else{  
		//pw.println("failed to submit data"); 
			response.sendRedirect("#");
			System.out.println("Site Submit Failed");
		}  
		}  
		catch (Exception e){  
		pw.println(e);  
		} 
	}

}
