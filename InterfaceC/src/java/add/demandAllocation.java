/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package add;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Gilbert
 */
public class demandAllocation extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
           
        try ( PrintWriter out = response.getWriter()) {
            String Demand = request.getParameter("From");
             String Demandto = request.getParameter("To");
         
            /* TODO output your page here. You may use following sample code. */
            DatabaseConnection connection = new DatabaseConnection();        
            Connection conn = connection.getConn();
                    Statement st= conn.createStatement();
      
              Statement st1= conn.createStatement();
             Statement st5= conn.createStatement();
           
             
            
             ResultSet rs5 = st.executeQuery("Select count(SID)  from staff WHERE Category='"+Demand+"' ");
             rs5.next();
             int count = rs5.getInt(1);
             int c= (count/2);
             ResultSet rs2 = st1.executeQuery("Select SID  from staff  WHERE Category='"+Demand+"' LIMIT "+c+" ");
          
            
             
           
            while(rs2.next()){
             st5.executeUpdate("update staff set Category='"+Demandto+"' where SID = '"+rs2.getString("SID")+"' ");
        }  
       
              RequestDispatcher dispatcher=request.getRequestDispatcher("productlinedemand.jsp");
            dispatcher.forward(request,response);    
               
        }
       
          
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SalesReallocate.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SalesReallocate.class.getName()).log(Level.SEVERE, null, ex);
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
