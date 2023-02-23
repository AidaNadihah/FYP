<%-- 
    Document   : adminListUp
    Created on : Jun 22, 2022, 4:34:46 AM
    Author     : USER
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>ADMIN PROFILE UPDATE || KBMC</title>
    </head>
    <body>
        <%
            
            Integer adminID = (Integer) request.getSession().getAttribute("adminID");
            
            String adminName = request.getParameter("adminName");
            String adminEmail = request.getParameter("adminEmail");
            String adminPass = request.getParameter("adminPass");
            String adminNo = request.getParameter("adminNo");
           
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String myUrl = "jdbc:mySql://localhost:3306/kbmc";
            String uname="root";
            String pass="";
            Connection myConnection = DriverManager.getConnection(myUrl,uname,pass);

            String myQuery = "update admin "
                     + "set adminName=?, adminEmail=?, adminPass=?, adminNo=?"
                     + "where adminID=?";          

            PreparedStatement myPs = myConnection.prepareStatement(myQuery);
            
            myPs.setString(1, adminName);
            myPs.setString(2, adminEmail);
            myPs.setString(3, adminPass);
            myPs.setString(4, adminNo);
            myPs.setInt(5, adminID);
            
            
            if(myPs.executeUpdate()!=0){
                out.println("<script type=\text/javascript\">");
                out.println("alert(\"Account successfully update\")");
                out.println("</script>");
                
                RequestDispatcher rd = request.getRequestDispatcher("adminDashboard.jsp");
                rd.include(request, response);
            }
            myConnection.close();
        %> 
    </body>
</html>
