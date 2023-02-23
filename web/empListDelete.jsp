<%-- 
    Document   : empListDelete
    Created on : May 26, 2022, 5:00:13 AM
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int empID = Integer.parseInt(request.getParameter("empID")); //kalau nak 
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String myUrl= "jdbc:mysql://localhost:3306/hjva";
            String uname="root";
            String pass="";
            
            Connection myConnection = DriverManager.getConnection(myUrl,uname,pass);
            
            String mySqlQuery = "delete from employer where empID=?";
            PreparedStatement myPs = myConnection.prepareStatement(mySqlQuery);
            
            myPs.setInt(1, empID);
            
            if(myPs.executeUpdate()!=0){
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Success delete the info\")");
                out.println("<script>");
                
                RequestDispatcher rd = request.getRequestDispatcher("viewEmpList.jsp");
                rd.include(request, response);
            }
        %>
    </body>
</html>