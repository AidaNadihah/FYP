<%-- 
    Document   : jsRegistrationProcess
    Created on : May 26, 2022, 1:15:40 AM
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
        <title>KBMC || Jobseeker Section</title>
    </head>
    <body>
        <%
            String jsName = request.getParameter("jsName");
            String jsEmail = request.getParameter("jsEmail");
            String jsPass = request.getParameter("jsPass");
            //String jsAbout = request.getParameter("jsAbout");
            String jsAddress = request.getParameter("jsAddress");
            String jsDOB = request.getParameter("jsDOB");
            String jsCity = request.getParameter("jsCity");
            String jsNo = request.getParameter("jsNo");
            String jsCGPA = request.getParameter("jsCGPA");
            String jsQualification = request.getParameter("jsQualification");
            String jsMajor = request.getParameter("jsMajor");
            //String jsResume = request.getParameter("jsResume");
            
            
            
            
            
            
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String myUrl = "jdbc:mysql://localhost:3306/kbmc";
            String uname = "root";
            String pass = "";
            Connection myConnection = DriverManager.getConnection(myUrl,uname,pass);
            
            String mySqlQuery = "insert into jobseeker " 
                    + "(jsName, jsEmail, jsPass, jsAddress, jsDOB, jsCity, jsNo, jsCGPA, jsQualification, jsMajor) "
                    + "values(?,?,?,?,?,?,?,?,?,?)";
            
            PreparedStatement myPs = myConnection.prepareStatement(mySqlQuery);
            
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
          
            
            
            if(!myPs.execute()){
                
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Jobseeker account's created successfully\")");
                out.println("</script >");
                
                RequestDispatcher rd = request.getRequestDispatcher("jsLogin.jsp");
                rd.include(request, response);
            }
            myConnection.close();
        %>
    </body>
</html>
