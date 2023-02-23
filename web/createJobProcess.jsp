<%-- 
    Document   : createJobProcess
    Created on : Jun 8, 2022, 3:11:05 PM
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
        <title>KBMC || Add Job Process</title>
    </head>
    <body>
        <%
           
            String jobTitle = request.getParameter("jobTitle");
            String jobType = request.getParameter("jobType");
            String jobcatName = request.getParameter("jobcatName");
            String jobInfo = request.getParameter("jobInfo");
            String jobSalary = request.getParameter("jobSalary");
            String jobDate = request.getParameter("jobDate");
            String jobStatus = request.getParameter("jobStatus");
            String adminEmail = request.getParameter("adminEmail");
            
            
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String myUrl = "jdbc:mysql://localhost:3306/kbmc";
            String uname = "root";
            String pass = "";
            Connection myConnection = DriverManager.getConnection(myUrl,uname,pass);
            
            String mySqlQuery = "insert into job " 
                    + "(jobTitle, jobType, jobcatName, jobInfo, jobSalary, jobDate, jobStatus, adminEmail) "
                    + "values(?,?,?,?,?,?,?,?)";
            
            PreparedStatement myPs = myConnection.prepareStatement(mySqlQuery);
            
            myPs.setString(1, jobTitle);
            myPs.setString(2, jobType);
            myPs.setString(3, jobcatName);
            myPs.setString(4, jobInfo);
            myPs.setString(5, jobSalary);
            myPs.setString(6, jobDate);
            myPs.setString(7, jobStatus);
            myPs.setString(8, adminEmail);
            
            if(!myPs.execute()){
                
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"New job created successfully\")");
                out.println("</script >");
                
                RequestDispatcher rd = request.getRequestDispatcher("adminDashboard.jsp");
                rd.include(request, response);
            }
            myConnection.close();
        %>
    </body>
</html>

    