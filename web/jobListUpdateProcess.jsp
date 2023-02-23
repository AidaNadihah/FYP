<%-- 
    Document   : jobListUpdateProcess
    Created on : Jun 20, 2022, 11:57:15 PM
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
        <title>Admin ||Update Job List</title>
    </head>
    <body>
         <%
            //String adminName = (String)request.getSession().getAttribute("adminName"); // nak keluarkan nama dekat acc dashboard, akan ke servlet 
           // Integer adminID = (Integer)request.getSession().getAttribute("adminID");
            
         
            int jobID = Integer.parseInt(request.getParameter("jobID"));
           //int jobID =Integer.parseInt(request.getParameter("jobID"));
           
            String jobType = request.getParameter("jobType");
            String jobTitle = request.getParameter("jobTitle");
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
            
            String mySqlQuery = "update job " 
                    +"set jobType=?, jobTitle=?,  jobcatName=?, jobInfo=?, jobSalary=?, jobDate=?, jobStatus=?, adminEmail=? "
                    + "where jobID=?";
            
            PreparedStatement myPs = myConnection.prepareStatement(mySqlQuery);
            
            myPs.setString(1, jobType);
            myPs.setString(2, jobTitle);
            myPs.setString(3, jobcatName);
            myPs.setString(4, jobInfo);
            myPs.setString(5, jobSalary);
            myPs.setString(6, jobDate);
            myPs.setString(7, jobStatus);
            myPs.setString(8, adminEmail);
            myPs.setInt(9, jobID);
            
            
           if(myPs.executeUpdate()!=0){
                
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Job information successfully updated. \")");
                out.println("</script >");
                
                RequestDispatcher rd = request.getRequestDispatcher("jobList.jsp");
                rd.include(request, response);
            }
            myConnection.close();
        %>
    
        
    </body>
</html>

