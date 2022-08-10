<%-- 
    Document   : customer
    Created on : Aug 4, 2022, 10:54:38 AM
    Author     : KOKS
--%>


<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*" %><!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
              <style>
            td{
                padding: 10px;
            }
            div{
                width: 50%;
                border: 1px solid black;
                border-radius: 5px;
                background:lightsteelblue;
            }
        </style>
    </head>
    <body>
        <form action="login" method="POST">
        <%
         try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/confectionery","root","");
            
             Statement st= conn.createStatement();
             Statement st2= conn.createStatement();
             Statement st3= conn.createStatement();
              Statement st4= conn.createStatement();
              
              
                
                 
                   ResultSet rs = st.executeQuery("Select count(SID)  from staff");
               
                rs.next();
                int count = rs.getInt(1);
          %>
          <%
              int x =(count*4)/7;   
              int p =(x/2);
              int q=(x/4);
              int r= count-(x+p+q);
              int w=(p%2);
              st.executeUpdate("update staff set Category='"+"Long-term"+"' WHERE SID BETWEEN 1 and '"+x+"'");
              st.executeUpdate("update staff set Category='"+"Mid-term"+"' WHERE SID BETWEEN '"+(x+1)+"' and '"+(x+p)+"'");
              st.executeUpdate("update staff set Category='"+"Short-term"+"' WHERE SID BETWEEN '"+(x+p+1)+"' and '"+(x+p+q+r)+"'");
              
              
              ResultSet rs1 = st2.executeQuery("Select * from staff WHERE SID BETWEEN 1 and '"+x+"'");
              ResultSet rs2 = st3.executeQuery("Select * from staff WHERE SID BETWEEN '"+(x+1)+"' and '"+(x+p)+"'");
              ResultSet rs3 = st4.executeQuery("Select * from staff WHERE SID BETWEEN '"+(x+p+1)+"' and '"+(x+p+q+r)+"'");
              
        //      ResultSet rs1 = st2.executeQuery("Select * from staff WHERE SID BETWEEN 1 and '"+x+"'");
       %>
          <div>
            <table border="0">
            <tr>
                <td>Number of Staff</td>
                <td><% out.println(count);%></td>
            </tr>
            </table>
          </div>
            <br>
            
            
        </form>
                 <h2>LONG TERM STAFF</h2>
                 <form action="Allocate" method="POST">
                  <table width="50%">
                <tr>
                    <th>SID</th>
                    <th>FName</th>
                    <th>LName</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <th>PNumber</th>
                    <th>Category</th>
                   
                </tr>
            <%
                
                while(rs1.next()){
                %>
                <tr>
                    <td><%out.println(rs1.getString("SID"));%></td>
                    <td><%out.println(rs1.getString("FName"));%></td>
                    <td><%out.println(rs1.getString("LName"));%></td>
                        <td><%out.println(rs1.getString("Email"));%></td>
                    <td><%out.println(rs1.getString("Gender"));%> </td>
                   <td><%out.println(rs1.getString("PNumber"));%> </td>
                   <td><%out.println(rs1.getString("Category"));%> </td>
                      
                </tr>
                 </form>
                 
                 <%
                  
                }
            %>
              </table>
             
                 <h2>MEDIUM TERM STAFF</h2>
                 <form action="Allocate" method="POST">
                  <table width="50%">
                <tr>
                    <th>SID</th>
                    <th>FName</th>
                    <th>LName</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <th>PNumber</th>
                   <th>Category</th>
                </tr>
            <%
                
                while(rs2.next()){
                %>
                <tr>
                    <td><%out.println(rs2.getString("SID"));%></td>
                    <td><%out.println(rs2.getString("FName"));%></td>
                    <td><%out.println(rs2.getString("LName"));%></td>
                        <td><%out.println(rs2.getString("Email"));%></td>
                    <td><%out.println(rs2.getString("Gender"));%> </td>
                   <td><%out.println(rs2.getString("PNumber"));%> </td>
                      <td><%out.println(rs2.getString("Category"));%> </td>
                </tr>
                 </form>
                  
                 <%
                  
                }
            %> 
            </table>
                <h2>SHORT TERM STAFF</h2>
                 <form action="Allocate" method="POST">
                  <table width="50%">
                <tr>
                    <th>SID</th>
                    <th>FName</th>
                    <th>LName</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <th>PNumber</th>
                   <th>Category</th>
                </tr>
            <%
                
                while(rs3.next()){
                %>
                <tr>
                    <td><%out.println(rs3.getString("SID"));%></td>
                    <td><%out.println(rs3.getString("FName"));%></td>
                    <td><%out.println(rs3.getString("LName"));%></td>
                    <td><%out.println(rs3.getString("Email"));%></td>
                    <td><%out.println(rs3.getString("Gender"));%> </td>
                   <td><%out.println(rs3.getString("PNumber"));%> </td>
                   <td><%out.println(rs3.getString("Category"));%> </td>
                      
                </tr>
                 </form>
                   <%
                  
                }
            %> 
            
          <%
              }
            
        
        catch(Exception er){
            out.println("Connection Failed" +er.getMessage());
        }
        %>
        
      
           
        
          
        
    </body>
</html>
