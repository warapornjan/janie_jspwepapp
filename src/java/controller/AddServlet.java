/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Room;
import model.Books;
import controller.ListBookServlet;
import javafx.scene.control.Alert;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;


        
/**
 *
 * @author wachirawittan
 */
public class AddServlet extends HttpServlet {

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
        String mode = request.getParameter("mode");
        String books_ID = request.getParameter("books_id");
        Books stu = null;
        if (mode != null && mode.equals("edit")) {

            try {
                Connection conn = DBCPUtil.getDatabaseConnectionPool();
                String command = "Select * from books WHERE books_id=?";
                PreparedStatement pst = conn.prepareStatement(command);
                pst.setString(1, books_ID);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    stu = new Books();
                    stu.setBooks_id(rs.getString("books_id"));
                    stu.setBookname(rs.getString("bookname"));
                    stu.setAuthor(rs.getString("author"));
                    stu.setPrice(rs.getString("price"));
                   
                }
                request.setAttribute("stuEdt", stu);
                request.setAttribute("mode", mode);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (Exception ex) {
                Logger.getLogger(AddServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            request.setAttribute("mode", "add");
            request.getRequestDispatcher("index.jsp").forward(request, response);
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
    @SuppressWarnings("empty-statement")
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.setContentType("application/json");
        response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
       try {
      // response.setContentType("text/html;charset=UFT-8");
       // PrintWriter out = response.getWriter();
        HttpSession  s = request.getSession();
        
            String output = "{}";
            
            String bookid = request.getParameter("bookid");
            String mode = request.getParameter("mode");
            String bookname =request.getParameter("bookname");
             String author =request.getParameter("author");
            String price =request.getParameter("price");
            Connection conn = DBCPUtil.getDatabaseConnectionPool();
            if (mode != null && mode.equals("add")) {
                String command = "INSERT INTO books (books_id,bookname,author,price)\n"
                        + "VALUES (?,?,?,?)";
                PreparedStatement pst = conn.prepareStatement(command);
                pst.setString(1, bookid);
                pst.setString(2, bookname);
                pst.setString(3, author);
                pst.setString(4, price);
             

                pst.execute();
                out.print("ok");
                
               

            } else if (mode != null && mode.equals("edit")) {

                String command = "UPDATE `books` SET `bookname`=?, `author`=?, `price`=? WHERE `books_id` = ?";
                PreparedStatement pst = conn.prepareStatement(command);
                pst.setString(1, bookname);
                pst.setString(2, author);
                pst.setString(3, price);
                pst.setString(4, bookid);
             
                pst.execute();
                out.print("ok");
            }

// Need change this
           response.sendRedirect("ListBookServlet");
            // out.close();

        } catch (Exception e) {
            e.printStackTrace();
            out.print("fail");
            
        }
        finally{
            out.close();
        }

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
