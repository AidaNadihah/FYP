<%-- 
    Document   : adminRegisterProcess
    Created on : Jun 8, 2022, 2:41:39 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN REGISTER || KBMC</title>
    </head>
    <body>
        <%
            
            String adminName = request.getParameter("adminName");
            String adminEmail = request.getParameter("adminEmail");
            String adminPass = request.getParameter("adminPass");
            String adminNo = request.getParameter("adminNo");
            String adminStatus = request.getParameter("adminStatus");
            

            
            Class.forName("com.mysql.jdbc.Driver");
            
            String myUrl = "jdbc:mysql://localhost:3306/kbmc";
            String uname = "root";
            String pass = "";
            Connection myConnection = DriverManager.getConnection(myUrl,uname,pass);
            
            String mySqlQuery = "insert into admin " 
                    + "(adminName, adminEmail, adminPass, adminNo, adminStatus) "
                    + "values(?, ?, ?, ?, ?)";
            
            PreparedStatement myPs = myConnection.prepareStatement(mySqlQuery);
            
            myPs.setString(1, adminName);
            myPs.setString(2, adminEmail);
            myPs.setString(3, adminPass);
            myPs.setString(4, adminNo);
            myPs.setString(5, adminStatus);
            
            
            
            if(!myPs.execute()){
                
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Account created successfully\")");
                out.println("</script >");
                
                RequestDispatcher rd = request.getRequestDispatcher("adminLogin.jsp");
                rd.include(request, response);
            }
            myConnection.close();
        %>
    </body>
</html>

