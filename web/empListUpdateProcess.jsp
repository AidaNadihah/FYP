<%-- 
    Document   : empListUpdateProcess
    Created on : May 26, 2022, 4:43:10 AM
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
        <title>Admin ||Update Employer List</title>
    </head>
    <body>
        <%
            int empID = Integer.parseInt(request.getParameter("empID"));
            //Integer empID = (Integer) request.getSession().getAttribute("empID");
            String empName = request.getParameter("empName");
            String empEmail = request.getParameter("empEmail");
            String empPass = request.getParameter("empPass");
            String empNo = request.getParameter("empNo");
            String empPos= request.getParameter("empPos");
           
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String myUrl = "jdbc:mySql://localhost:3306/kbmc";
            String uname="root";
            String pass="";
            Connection myConnection = DriverManager.getConnection(myUrl,uname,pass);

            String myQuery = "update employer "
                     + "set empName=?, empEmail=?, empPass=?, empNo=?, empPos=?"
                     + "where empID=?";          

            PreparedStatement myPs = myConnection.prepareStatement(myQuery);
            
            myPs.setString(1, empName);
            myPs.setString(2, empEmail);
            myPs.setString(3, empPass);
            myPs.setString(4, empNo);
            myPs.setString(5, empPos);
            myPs.setInt(6, empID);
            
            
            if(myPs.executeUpdate()!=0){
                out.println("<script type=\text/javascript\">");
                out.println("alert(\"Employer list successfully update\")");
                out.println("</script>");
                
                RequestDispatcher rd = request.getRequestDispatcher("empList.jsp");
                rd.include(request, response);
            }
            myConnection.close();
        %> 
    </body>
</html>

