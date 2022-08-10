/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package add;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Gilbert
 */
//@WebServlet(name = "addToCart", urlPatterns = {"/addToCart"})
public class ToCart extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
          HttpSession hs = request.getSession();
       // String CID = (String)hs.getAttribute("CID");
          String Name = (String)hs.getAttribute("CustomerName");
         
        try ( PrintWriter out = response.getWriter()) {
            

            
            String pname = request.getParameter("productName");
            String CID = request.getParameter("customerID");
            String price = request.getParameter("productPrice");
             if(Name!=null){
                          DatabaseConnection connection = new DatabaseConnection();        
            Connection conn = connection.getConn();
            Statement st= conn.createStatement();
           
                      ResultSet rs = st.executeQuery("Select * from orders where CID='"+CID+"' AND PName = '"+pname+"' ");
                      if(rs.next()){
                          int k=rs.getInt("OQuantity")+1;
                           st.executeUpdate("Update orders SET OQuantity ='"+k+"' where PName='"+pname+"'");
                      }
                      else{
                          st.executeUpdate("insert into orders(CID,PName,OPrice)values('"+CID+"','"+pname+"','"+price+"')");
                      }
                    
               
                           RequestDispatcher dispatcher=request.getRequestDispatcher("viewproducts.jsp");
           dispatcher.forward(request,response);
          }
            

            
       
            RequestDispatcher dispatcher=request.getRequestDispatcher("Customer_login.jsp");
           dispatcher.forward(request,response);
         
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ToCart.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ToCart.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
