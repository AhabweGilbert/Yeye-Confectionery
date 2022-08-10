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
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Gilbert
 */
public class SalesReallocate extends HttpServlet {

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
        
         
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            DatabaseConnection connection = new DatabaseConnection();        
            Connection conn = connection.getConn();
                    Statement st= conn.createStatement();
      
              Statement st1= conn.createStatement();
             Statement st5= conn.createStatement();
             Statement st7= conn.createStatement();
             Statement st9= conn.createStatement();
             Statement st8= conn.createStatement();
             Statement st2= conn.createStatement();
             Statement st12= conn.createStatement();
             Statement st13= conn.createStatement();
             Statement st14= conn.createStatement();
             
             ResultSet rs = st.executeQuery("Select count(SID)  from staff");          
             ResultSet rs5 = st7.executeQuery("Select sum(STotal)  from sales WHERE PName='"+"Cookies"+"'");
             ResultSet rs6 = st9.executeQuery("Select sum(STotal)  from sales WHERE PName='"+"Doughnuts"+"'");
             ResultSet rs4 = st5.executeQuery("Select sum(STotal)  from sales WHERE PName='"+"Cakes"+"'");           
             ResultSet rs2 = st1.executeQuery("Select sum(STotal)  from sales WHERE PName='"+"Bread"+"'");
              ResultSet rs8 = st8.executeQuery("Select sum(STotal)  from sales"); 
             rs.next();
             int count = rs.getInt(1);
             rs2.next();
             int t = rs2.getInt(1); 
             rs4.next();
             int c = rs4.getInt(1);
             rs5.next();
             int o = rs5.getInt(1);
             rs6.next();
             int u = rs6.getInt(1);
             rs8.next();
             int w = rs8.getInt(1);
             
              int p=(t*count)/w;
              int q=(c*count)/w;
              int k=(o*count)/w; 
              int j=(u*count)/w;
              
              if(p == 0 || q==0 || k==0 || j==0){
                if(p==0)
                    p+=1;
                else if(q==0)
                    q+=1;
                else if(k==0)
                    k+=1;
                else if(j==0)
                    j+=1;
                    
            }
            
            int tot=p+q+k+j;
            int sa= count-tot;
            if(tot!=count){
            int arr[]={p,q,k,j};
              int max = Arrays.stream(arr).max().getAsInt();
              
              //out.println(max);
              if(p==max)
                    p+=sa;
                else if(q==max)
                    q+=sa;
                else if(k==max)
                    k+=sa;
                else if(j==max)
                    j+=sa;
            }
     
              ResultSet rs1 = st2.executeQuery("Select *  from staff LIMIT "+k+""); 
	while(rs1.next()){
             st.executeUpdate("update staff set Category='"+"Long-term"+"' where SID = '"+rs1.getString("SID")+"' ");
        }	
              ResultSet rs11 = st12.executeQuery("Select *  from staff LIMIT "+j+" OFFSET "+k+""); 
              while(rs11.next()){
             st.executeUpdate("update staff set Category='"+"Mid-term"+"' where SID = '"+rs11.getString("SID")+"' ");
        }	
              ResultSet rs12 = st13.executeQuery("Select *  from staff LIMIT  "+q+" OFFSET "+(k+j)+""); 
              while(rs12.next()){
             st.executeUpdate("update staff set Category='"+"Mid-term"+"' where SID = '"+rs12.getString("SID")+"' ");
        }	
              ResultSet rs13 = st14.executeQuery("Select *  from staff LIMIT "+(p)+" OFFSET "+(k+q+j)+""); 
              while(rs13.next()){
             st.executeUpdate("update staff set Category='"+"Short-term"+"' where SID = '"+rs13.getString("SID")+"' ");
        }	
            RequestDispatcher dispatcher=request.getRequestDispatcher("reallocate.jsp");
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
