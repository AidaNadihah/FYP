<%-- 
    Document   : viewJsUpdate
    Created on : Jun 22, 2022, 11:07:52 AM
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
       <title>JOBSEEKER PROFILE UPDATE || KBMC</title>
    </head>
    <body>
        <%
            
            Integer jsID = (Integer) request.getSession().getAttribute("jsID");
            
            String jsName = request.getParameter("jsName");
            String jsEmail = request.getParameter("jsEmail");
            String jsPass = request.getParameter("jsPass");
            String jsAddress = request.getParameter("jsAddress");
            String jsDOB = request.getParameter("jsDOB");
            String jsCity = request.getParameter("jsCity");
            String jsNo = request.getParameter("jsNo");
            String jsCGPA = request.getParameter("jsCGPA");
            String jsQualification = request.getParameter("jsQualification");
            String jsMajor = request.getParameter("jsMajor");
            

           
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String myUrl = "jdbc:mySql://localhost:3306/kbmc";
            String uname="root";
            String pass="";
            Connection myConnection = DriverManager.getConnection(myUrl,uname,pass);

            String myQuery = "update jobseeker "
                     + "set jsName=?, jsEmail=?, jsPass=?, jsAddress=?, jsDOB=?, jsCity=?, jsNo=?, jsCGPA=?, jsQualification=?, jsMajor=? "
                     + "where jsID=?";          

            PreparedStatement myPs = myConnection.prepareStatement(myQuery);
            
            myPs.setString(1, jsName);
            myPs.setString(2, jsEmail);
            myPs.setString(3, jsPass);
            myPs.setString(4, jsAddress);
            myPs.setString(5, jsDOB);
            myPs.setString(6, jsCity);
            myPs.setString(7, jsNo);
            myPs.setString(8, jsCGPA);
            myPs.setString(9, jsQualification);
            myPs.setString(10, jsMajor);
            myPs.setInt(11, jsID);
            
            
            if(myPs.executeUpdate()!=0){
                out.println("<script type=\text/javascript\">");
                out.println("alert(\"Account successfully update\")");
                out.println("</script>");
                
                RequestDispatcher rd = request.getRequestDispatcher("jsDashboard.jsp");
                rd.include(request, response);
                //response.sendRedirect("viewAdmin.jsp");
            }
            myConnection.close();
        %> 
    </body>
</html>
