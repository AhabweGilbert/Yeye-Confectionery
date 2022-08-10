/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package add;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
//import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author HP
 */
public class mregister extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
                try{
String connectionURL = "jdbc:mysql://localhost:3306/confectionery";
String f = request.getParameter("fname");
String l = request.getParameter("lname");
String pass = request.getParameter("password");
String em = request.getParameter("email2");


HttpSession hs = request.getSession();
//s.setAttribute("CID",userid);


Connection connection = null; 
Statement st = null;

Class.forName("com.mysql.jdbc.Driver");

connection = DriverManager.getConnection(connectionURL, "root", "");

st=connection.createStatement();

int addManager=st.executeUpdate("insert into manager(FName,LName,Email,Password)values('"+f+"','"+l+"','"+em+"','"+pass+"')");

//String userid="SELECT mid from manager where email='" + em + "' and password='" + pass + "'";
//ResultSet r = st.executeQuery(userid);
 if (addManager > 0) {
                String message = "Manager register successfully.";
                //Passing message via session.
                hs.setAttribute("success-message", message);
                //Sending response back to the user/customer
                response.sendRedirect("dashboard.jsp?name="+f);
            } else {
                //If customer fails to register 
                String message = "Manager registration fail";
                //Passing message via session.
                hs.setAttribute("fail-message", message);
                //Sending response back to the user/customer
                response.sendRedirect("managerlogin.jsp");
            }
    }catch(     IOException | ClassNotFoundException | SQLException ex){
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Sorry a manager already exists');");
        out.println("location='managerlogin.jsp';");
        out.println("</script>");
//        response.sendRedirect("managerlogin.jsp");
//    out.println("Connection Failed "+ex.getMessage());
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
