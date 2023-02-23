<%-- 
    Document   : adminRegister
    Created on : May 25, 2022, 10:39:46 PM
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
        <title>Employer Registration</title>
    </head>
    <body>
        <%
            
            String empName = request.getParameter("empName");
            String empEmail = request.getParameter("empEmail");
            String empPass = request.getParameter("empPass");
            String empNo = request.getParameter("empNo");
            String empPos = request.getParameter("empPos");

            
            Class.forName("com.mysql.jdbc.Driver");
            
            String myUrl = "jdbc:mysql://localhost:3306/kbmc";
            String uname = "root";
            String pass = "";
            Connection myConnection = DriverManager.getConnection(myUrl,uname,pass);
            
            String mySqlQuery = "insert into employer " 
                    + "(empName, empEmail, empPass, empNo, empPos) "
                    + "values(?, ?, ?, ?, ?)";
            
            PreparedStatement myPs = myConnection.prepareStatement(mySqlQuery);
            
            myPs.setString(1, empName);
            myPs.setString(2, empEmail);
            myPs.setString(3, empPass);
            myPs.setString(4, empNo);
            myPs.setString(5, empPos);
            
            if(!myPs.execute()){
                
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Account created successfully\")");
                out.println("</script >");
                
                RequestDispatcher rd = request.getRequestDispatcher("adminDashboard.jsp");
                rd.include(request, response);
            }
            myConnection.close();
        %>
    </body>
</html>
