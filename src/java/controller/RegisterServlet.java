package controller;
import controller.DBCPUtil;
import java.io.IOException;  
import java.io.PrintWriter;  
import java.sql.Connection;
import java.sql.PreparedStatement;
  
import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import controller.Validate;
  
  
public class RegisterServlet extends HttpServlet {  
    
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
             RequestDispatcher rs = request.getRequestDispatcher("register.jsp");
            rs.forward(request, response);

    }
        @Override
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            RequestDispatcher rs = request.getRequestDispatcher("register.jsp");
            rs.forward(request, response);

    }  
    
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        try {
            String mode = request.getParameter("mode");
            String password = request.getParameter("password");
            String user_name = request.getParameter("user_name");
            Connection conn = DBCPUtil.getDatabaseConnectionPool();
       
                String command = "INSERT INTO user_admin (password, user_name)\n"
                        + "VALUES (?,?)";
                PreparedStatement pst = conn.prepareStatement(command);
                pst.setString(1, password);
                pst.setString(2, user_name);
              
                pst.execute();

        
                    response.sendRedirect("LoginServlet");
              
        


              response.sendRedirect("LoginServlet");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}