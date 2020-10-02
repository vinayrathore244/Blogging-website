//*************************DONE***************************
package com.upgrad.blog.db;

import java.sql.*;

/**
 * TODO 6.2: Implement the DatabaseConnection class using the Singleton Pattern (Hint. Should have the 
 * private no-arg constructor).
 * TODO 6.3: The getInstance() method should create a connection object which is
 * connected with the local database and return this connection object.
 * TODO 6.4: You should handle the ClassNotFoundException and SQLException individually,
 * and not using the Exception class.
 */
public class DatabaseConnection {

    private static Connection con = null;


    /**
     *
     * @return
     */
    public static Connection getConnection() {
        if (con == null) {
//            String url = "jdbc:oracle:thin:@//database-2.csjdrsz4hudy.us-east-2.rds.amazonaws.com:1521/ORCL";
//            String user = "admin";
//            String pass = "password";
            
            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            String user = "ishwar";
            String pass = "oracle";
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                con = DriverManager.getConnection(url, user, pass);
            }
            catch (ClassNotFoundException e) {
                e.printStackTrace();
            }catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return con;
    }
    
    private DatabaseConnection () {}

//    public static void main(String[] args) throws SQLException{
//        try {
//        	DatabaseConnection.getConnection();
//        	System.out.println("Connected");
//        } catch (Exception e) {
//        	System.out.println("Not Connected");
//        }
//    }
}
