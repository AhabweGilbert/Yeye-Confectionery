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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HP
 */
public class Mlogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
           String email = request.getParameter("email2");
//           session.putValue("email",email);
        String password = request.getParameter("password");
        //Creating Session
        HttpSession hs = request.getSession();
        String message = "Manager register successfully.";

        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Clogin</title>");            
            out.println("</head>");
            out.println("<body>");
            
            try {
            String connectionURL = "jdbc:mysql://localhost:3306/confectionery";

        //Creating Session
            
            Connection connection = null; 
            Statement st = null;

            Class.forName("com.mysql.jdbc.Driver");

            connection = DriverManager.getConnection(connectionURL, "root", "");

            st=connection.createStatement();


            //Creating Resultset
            ResultSet resultset = null;

            resultset = st.executeQuery("select * from manager where Email='" + email + "' and Password='" + password + "'");

            try{
            resultset.next();

	        if(email.equals(resultset.getString("Email"))&&password.equals(resultset.getString("Password"))) 
			{ 
                                                              String f=resultset.getString("FName");
                                                              hs.setAttribute("Fname",resultset.getString("Fname"));
			      response.sendRedirect("dashboard.jsp?name="+f); 
			}
		else{
			 out.println("Invalid email or password.");
		    }
                
            }catch(Exception er){
                out.println("<script type=\"text/javascript\">");
                                                        out.println("alert('Invalid credentials please try again');");
                                                        out.println("location='managerlogin.jsp';");
                                                        out.println("</script>");
            }


        } catch (SQLException e) {
            System.out.println("Error is "+e.getMessage());
        }
            out.println("</body>");
            out.println("</html>");
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Mlogin.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Mlogin.class.getName()).log(Level.SEVERE, null, ex);
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
