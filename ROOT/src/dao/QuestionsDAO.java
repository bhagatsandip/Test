package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import db.ConnectionFactory;
import beans.Questions;;
 
public class QuestionsDAO {
    Connection connection;
    Statement stmt;
    //String subTopic ="arrays";
    private int noOfRecords;
    private String categoryname;
    
    public QuestionsDAO(String categoryname) { 
    	this.categoryname = categoryname;
    }
     
    private static Connection getConnection() 
            throws SQLException, 
                ClassNotFoundException 
    {
        Connection con = ConnectionFactory.
                getInstance().getConnection();
        return con;
    }
     
    public List<Questions> viewAllEmployees(
                int offset, 
                int noOfRecords)
    {
        String query = "select SQL_CALC_FOUND_ROWS * from "+categoryname+" limit "
                 + offset + ", " + noOfRecords;
        List<Questions> list = new ArrayList<Questions>();
        Questions questions = null;
        try {
            connection = getConnection();
            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
            	questions = new Questions();
            	questions.setUrl(rs.getString("url"));
            	questions.setTitle(rs.getString("title"));
            	questions.setCategory(rs.getString("category"));
            	questions.setDescription(rs.getString("description"));
                list.add(questions);
            }
            rs.close();
             
            rs = stmt.executeQuery("SELECT FOUND_ROWS()");
            if(rs.next())
                this.noOfRecords = rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }finally
        {
            try {
                if(stmt != null)
                    stmt.close();
                if(connection != null)
                    connection.close();
                } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }
 
    public int getNoOfRecords() {
        return noOfRecords;
    }
}