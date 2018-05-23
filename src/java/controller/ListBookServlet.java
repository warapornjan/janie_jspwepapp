/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Room;
import model.Books;
import controller.AddServlet;
import javax.servlet.http.HttpSession;

/**
 *
 * @author wachirawittan
 */
public class ListBookServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ListStudentServlet</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ListStudentServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession  s = request.getSession();
        try {
            String output = "{}";
            Connection conn = DBCPUtil.getDatabaseConnectionPool();
            String mode = (String) s.getAttribute("mode");
            String bookid = (String) s.getAttribute("books_id");
            
            if (mode != null && mode.equalsIgnoreCase("delete")) {
                
                String command = "DELETE FROM books\n"
                        + "WHERE books_id = ?";
                PreparedStatement pst = conn.prepareStatement(command);
                pst.setString(1, bookid);
                pst.executeUpdate();
                
            }
            
            PreparedStatement preStm = conn.prepareStatement("SELECT * FROM `books` ");
            ResultSet rs = preStm.executeQuery();
            ArrayList<Books> data = new ArrayList<Books>();
            Books stu;
            
            while (rs.next()) {
                stu = new Books();
                stu.setBooks_id(rs.getString("books_id"));
                stu.setBookname(rs.getString("bookname"));
                stu.setAuthor(rs.getString("author"));
                stu.setPrice(rs.getString("price"));
                data.add(stu);
            }
            
                    
            request.setAttribute("listdata", data);
            try {
                conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
           
            request.getRequestDispatcher("pages/ListBook.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ListBookServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
