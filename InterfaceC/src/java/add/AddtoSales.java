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
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;


import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Gilbert
 */
@WebServlet(name = "AddToSales", urlPatterns = {"/AddToSales"})
public class AddtoSales extends HttpServlet {
     
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
            HttpSession hs = request.getSession();
             String CID = (String)hs.getAttribute("CID");
             String location = request.getParameter("location");
                
                LocalDate date1=LocalDate.now();
             try ( PrintWriter out = response.getWriter()) {
                
            DatabaseConnection connection = new DatabaseConnection();        
            Connection conn = connection.getConn();
            Statement st= conn.createStatement();
            Statement st2= conn.createStatement();
            Statement st3= conn.createStatement();
            Statement st4= conn.createStatement();
            Statement st5= conn.createStatement();
             ResultSet rs3 = st3.executeQuery("Select * from customers where CID="+CID);
              out.println(CID);
             while(rs3.next()){
                  
                     ResultSet rs = st.executeQuery("Select * from orders where CID="+CID);
                    
                     
                     while(rs.next()){
                         int P = Integer.parseInt(rs.getString("OPrice"));
                         int Q = Integer.parseInt(rs.getString("OQuantity"));
                         int Total = P*Q;
                         String OID=rs.getString("OID");
                         String PName=rs.getString("PName");
                         String OQuantity=rs.getString("OQuantity");
                         int Minus = rs.getInt("OQuantity"),Minus1;
                         String Gender = rs3.getString("Gender");
                         out.println(Gender);
                           try{
                         ResultSet rs5 = st5.executeQuery("Select * from products where PName='"+PName+"'");
                          while(rs5.next()){
                               Minus1 = rs5.getInt("PQuantity");
                                int MinusQuant = Minus1-Minus;
                                 
                                      
                              
                                    out.println(MinusQuant);
                                st2.executeUpdate("Update products SET PQuantity ='"+MinusQuant+"' where PName='"+PName+"'");
                               
                         }
                         }catch(SQLException eks){
                                    out.println(eks);
                                }
                        
                         
                         //String CID=rs.getString("CID");
                          try{
                              String Hax=CID;
                        st2.executeUpdate("insert into sales(OID,PName,OQuantity,STotal,CID,Region,Date,Gender) values('"+OID+"','"+PName+"','"+OQuantity+"','"+Total+"','"+Hax+"','"+location+"','"+date1+"' ,'"+Gender+"')");
                          }catch(SQLException e){
                              out.println(e);
                          }
                        out.println(rs.getString("OID"));
                      
                     }

        }
               st4.executeUpdate("Delete From orders where CID="+CID);
                                RequestDispatcher dispatcher=request.getRequestDispatcher("cart.jsp");
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
            Logger.getLogger(AddtoSales.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AddtoSales.class.getName()).log(Level.SEVERE, null, ex);
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
