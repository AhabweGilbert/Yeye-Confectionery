
package add;
import java.sql.*;


public class DatabaseConnection {
    Connection conn;
    public Connection getConn(){
        try{
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                System.out.println("Error:"+ ex);
            }
             conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/confectionery","root","");
            
        }catch(SQLException e){
            
        }
        return conn;
        
        
    }
}
