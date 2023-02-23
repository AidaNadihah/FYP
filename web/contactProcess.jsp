<%-- 
    Document   : contactProcess
    Created on : Jun 12, 2022, 9:29:39 PM
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
        <title>Contact Us Process</title>
    </head>
    <body>
        <%
            
            String userEmail = request.getParameter("userEmail");
            String userName = request.getParameter("userName");
            String userSubject = request.getParameter("userSubject");
            String userMesg = request.getParameter("userMesg");
           

            
            Class.forName("com.mysql.jdbc.Driver");
            
            String myUrl = "jdbc:mysql://localhost:3306/kbmc";
            String uname = "root";
            String pass = "";
            Connection myConnection = DriverManager.getConnection(myUrl,uname,pass);
            
            String mySqlQuery = "insert into message " 
                    + "(userEmail, userName, userSubject, userMesg) "
                    + "values(?, ?, ?, ?)";
            
            PreparedStatement myPs = myConnection.prepareStatement(mySqlQuery);
            
            myPs.setString(1, userEmail);
            myPs.setString(2, userName);
            myPs.setString(3, userSubject);
            myPs.setString(4, userMesg);
            
            
            if(!myPs.execute()){
                
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Message has been sent successfully. Kindly check your email from time to time for the reply.\")");
                out.println("</script >");
                
                RequestDispatcher rd = request.getRequestDispatcher("homepage.jsp");
                rd.include(request, response);
            }
            myConnection.close();
        %>
    </body>
</html>
