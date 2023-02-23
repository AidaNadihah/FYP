<%-- 
    Document   : adminList
    Created on : Jun 22, 2022, 4:18:11 AM
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
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>KBMC HOSPITAL JOB VACANCY APPLICATION</title>
        <style>

            .header {
                background-color: #94b8b8;
                text-align: center;
                padding: 1px;
            }

            table {
                margin-left:auto;
                margin-right:auto;
            } 

            fieldset {
                border : 1px solid #94b8b8;
                padding:4px;
            }
            /* Remove the navbar's default margin-bottom and rounded borders */ 
            .navbar {
                margin-bottom: 0;
                border-radius: 0;
            }

            /* Add a gray background color and some padding to the footer */
            footer {
                background-color: #f2f2f2;
                padding: 25px;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="homepage.jsp">KBMC HOSPITAL JOB VACANCY APPLICATION</a>
                </div>
                
            </div>
        </nav>
        <br>
        <div style="border: 4px solid #527a7a; padding: 10px;">
            <div class="header">
                <h1>KBMC Hospital Job Vacancy Application</h1>
            </div>
            <br>
            <div>
                <fieldset>
                     <body class="d-flex flex-column min-vh-100">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                           <h3 style=" text-align: center;" class="header-title pb-3 mt-0"><b>Admin Of Kota Bharu Medical Centre</b></h3>
                            <div class="table-responsive">
                                <table class="table table-hover mb-0">
                                    <%
                                    Class.forName("com.mysql.jdbc.Driver");

                                    String myUrl = "jdbc:mysql://localhost:3306/kbmc";
                                    String uname = "root";
                                    String pass = "";
                                    Connection myConnection = DriverManager.getConnection(myUrl,uname,pass);

                                    Statement myStatement = myConnection.createStatement();

                                    String myQuery = "select * from admin";
                                    ResultSet myRs = myStatement.executeQuery(myQuery);
                                    
                                    
                                    out.print("<thead>");
                                    out.print("<tr class=\"align-self-center\">");
                                    out.println("<th> Name </th>");
                                    out.println("<th> Email</th>");
                                    out.println("<th> Password </th>");
                                    out.println("<th> Phone Number </th>");
                                    out.println("<th>Status</th>");
                                    out.println("<th>Action</th>");
                                    out.print("</tr>");
                                    out.print("</thead>");
                                    out.print("<tbody>");
                                    
                                    while (myRs.next()){
                                     out.println("<tr>");
                                    out.println("<td>" + myRs.getString(2) + "</td>");
                                    out.println("<td>" + myRs.getString(3) + "</td>");
                                    out.println("<td>" + myRs.getString(4) + "</td>");
                                    out.println("<td>" + myRs.getString(5) + "</td>");
                                    out.println("<td>" + myRs.getString(6) + "</td>");
                                   
                                    out.println("<td><a href=adminListUp.jsp?adminID="
                                                + myRs.getString(1) + " style='text-decoration:none;'>Update</a>"
                                                + "&nbsp;"+"<a href=adminListDelete.jsp?adminID="
                                                +myRs.getString(1) + " onclick=\"return confirm"+
                                                    "('Are you sure you want to delete?')\" style='text-decoration:none;'>Delete</a>"
                                                +"</td>");
                                        out.println("</tr>");
                                    }
                                   out.println("</table>");
      
            out.println("</div>");
            myConnection.close();
            %>
        
            </div>
          </table>
                            </div>
                            <!--end table-responsive-->
                            <div class="pt-3 border-top text-right">
                                <a href="empDashboard.jsp" style="color: aliceblue;"><button type="button" id="submit" name="submit" class="btn btn-secondary">Back</button></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <br>

        <footer class="container-fluid text-center">
            <p><b>KBMC Hospital Job Vacancy Application</b></p>
        </footer>
    <body>
        
    </body>
</html>
