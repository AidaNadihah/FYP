 <%-- 
    Document   : viewEmpList
    Created on : May 26, 2022, 4:10:29 AM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>
    <%
        Class.forName("com.mysql.jdbc.Driver");

        String myUrl = "jdbc:mysql://localhost:3306/kbmc";
        String uname = "root";
        String pass = "";
        Connection myConnection = DriverManager.getConnection(myUrl,uname,pass);

        Statement myStatement = myConnection.createStatement();

        String myQuery = "select * from employer";
        ResultSet myRs = myStatement.executeQuery(myQuery);

        out.println("<div style='font-family: century gothic; padding=15px;'>");
        out.println("<br>");
        out.println("<center><p style='font-family:Arial, Helvetica, sans-serif;'>Class List</p></center></div>");
        out.println("<div align='center'>");
        out.println("<br>");
        out.println("</div>");
        out.println("<div align='center'>");
        out.println("<table id='customers'; border='1'; style='border-collapse: collapse;'>");
        out.println("<tr>");
        out.println("<th> Name </th>");
        out.println("<th> Email</th>");
        out.println("<th> Password </th>");
        out.println("<th> Phone Number </th>");
        out.println("<th> PBranch </th>");
        out.println("<th>Action</th>");
        out.println("<tr>");
        while (myRs.next()){
            out.println("<tr>");
            out.println("<td>" + myRs.getString(2) + "</td>");
            out.println("<td>" + myRs.getString(3) + "</td>");
            out.println("<td>" + myRs.getString(4) + "</td>");
            out.println("<td>" + myRs.getString(5) + "</td>");
            out.println("<td>" + myRs.getString(6) + "</td>");
            out.println("<td><a href=empListUpdate.jsp?empID="
                    + myRs.getString(1) + " style='text-decoration:none;'>Update</a>"
                    + "&nbsp;"+"<a href=empListDelete.jsp?empID="
                    +myRs.getString(1) + " onclick=\"return confirm"+
                        "('Are you sure you want to delete?')\" style='text-decoration:none;'>Delete</a>"
                    +"</td>");
            out.println("</tr>");
        }
            out.println("</table>");
            out.println("<td><input type='button' value='Back' onclick='history.back();' "
                    + "style='width:150px;background-color:#4CAF50;color:white;padding:14px 20px;"
                    + "margin:8px 0;border:none;border-radius:4px;cursor:pointer;'/></td>");
            out.println("</div>");
            myConnection.close();
            %>

</body>
</html>

