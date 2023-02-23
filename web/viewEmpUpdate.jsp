<%-- 
    Document   : viewEmpUpdate
    Created on : May 26, 2022, 5:32:21 AM
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
        <title>Employer Update Profile</title>
    </head>
    <body>
        <%
            
            Integer empID = (Integer) request.getSession().getAttribute("empID");
            
            String empName = request.getParameter("empName");
            String empEmail = request.getParameter("empEmail");
            String empPass = request.getParameter("empPass");
            String empNo = request.getParameter("empNo");
            String empBranch = request.getParameter("empBranch");
           
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String myUrl = "jdbc:mySql://localhost:3306/kbmc";
            String uname="root";
            String pass="";
            Connection myConnection = DriverManager.getConnection(myUrl,uname,pass);

            String myQuery = "update employer "
                     + "set empName=?, empEmail=?, empPass=?, empNo=?, empBranch=? "
                     + "where empID=?";          

            PreparedStatement myPs = myConnection.prepareStatement(myQuery);
            
            myPs.setString(1, empName);
            myPs.setString(2, empEmail);
            myPs.setString(3, empPass);
            myPs.setString(4, empNo);
            myPs.setString(5, empBranch);
            myPs.setInt(6, empID);
            
            
            if(myPs.executeUpdate()!=0){
                out.println("<script type=\text/javascript\">");
                out.println("alert(\"Account successfully update\")");
                out.println("</script>");
                
                RequestDispatcher rd = request.getRequestDispatcher("empDashboard.jsp");
                rd.include(request, response);
            }
            myConnection.close();
        %> 
    </body>
</html>
