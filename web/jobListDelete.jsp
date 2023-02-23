<%-- 
    Document   : jobListDelete
    Created on : Jun 21, 2022, 1:43:48 AM
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
        <title>Admin || KBMC </title>
    </head>
    <body>
         <%
        
            int jobID =Integer.parseInt(request.getParameter("jobID"));
        
            Class.forName("com.mysql.jdbc.Driver");
            
            String myUrl = "jdbc:mysql://localhost:3306/kbmc";
            String uname = "root";
            String pass = "";
            Connection myConnection = DriverManager.getConnection(myUrl,uname,pass);
            
            String mySqlQuery = "delete from job where jobID=?";
                  
            
            PreparedStatement myPs = myConnection.prepareStatement(mySqlQuery);
            
            myPs.setInt(1, jobID);
            
            if(myPs.executeUpdate()!=0){
                
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Job information successfully deleted. \")");
                out.println("</script >");
                
                RequestDispatcher rd = request.getRequestDispatcher("jobList.jsp");
                rd.include(request, response);
            }
            myConnection.close();
        %>
    </body>
</html>
