/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author ukritpra
 */
import java.sql.*;

public class Validate
 {
     public static boolean checkUser(String user_name,String password) 
     {
      boolean st =false;
      try{

	 //loading drivers for mysql
         Class.forName("com.mysql.jdbc.Driver");

 	 //creating connection with the database 
         Connection conn = DBCPUtil.getDatabaseConnectionPool();;
         PreparedStatement ps =conn.prepareStatement
                             ("select * from user_admin where user_name=? and password=?");
         ps.setString(1, user_name);
         ps.setString(2, password);
         ResultSet rs =ps.executeQuery();
         st = rs.next();
        
      }catch(Exception e)
      {
          e.printStackTrace();
      }
         return st;                 
  }   
}
