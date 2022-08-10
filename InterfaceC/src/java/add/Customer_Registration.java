/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package add;

//import com.mysql.cj.x.protobuf.MysqlxDatatypes.Scalar.String;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class Customer_Registration extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
                try{
String connectionURL = "jdbc:mysql://localhost:3306/confectionery";
String f = request.getParameter("fname");
String l = request.getParameter("lname");
String pn = request.getParameter("pnum");
String g = request.getParameter("cgen");
String pass = request.getParameter("pass");
String em = request.getParameter("email");


HttpSession hs = request.getSession();
//s.setAttribute("CID",userid);


Connection connection = null; 
Statement st = null;

Class.forName("com.mysql.jdbc.Driver");

connection = DriverManager.getConnection(connectionURL, "root", "");

st=connection.createStatement();

int addCustomer=st.executeUpdate("insert into customers(FName,LName,PNumber,Gender,Email,date_of_registration,Password)values('"+f+"','"+l+"','"+pn+"','"+g+"','"+em+"',CURRENT_DATE - INTERVAL FLOOR(RAND() * 14) DAY,'"+pass+"')");

String userid="SELECT CID from customers where Email='" + em + "' and Password='" + pass + "' ";
ResultSet r = st.executeQuery(userid);
 if (addCustomer > 0) {
                String message = "Customer register successfully.";
                //Passing message via session.
                hs.setAttribute("CID", userid);
                hs.setAttribute("CustomerName", f);
                //Sending response back to the user/customer
                response.sendRedirect("Customer_login.jsp");
            } else {
                //If customer fails to register 
                String message = "Customer registration fail";
                //Passing message via session.
                hs.setAttribute("fail-message", message);
                //Sending response back to the user/customer
                response.sendRedirect("Customer-register.jsp");
            }
    }catch(     IOException | ClassNotFoundException | SQLException ex){
    out.println("Connection Failed "+ex.getMessage());
    }
        }
//        response.sendRedirect("index.jsp");
        
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
        processRequest(request, response);
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
