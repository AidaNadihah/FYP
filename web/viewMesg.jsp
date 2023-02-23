<%-- 
    Document   : viewMesg
    Created on : Jun 21, 2022, 3:53:28 PM
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
                <div class="collapse navbar-collapse" id="myNavbar">
                   
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="logoutAdmin.jsp"><span class="glyphicon glyphicon-log-in"></span> Log Out</a></li>
                    </ul>
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
                            <h4 class="header-title pb-3 mt-0"><b>Message List</b></h4>
                            <div class="table-responsive">
                                <table class="table table-hover mb-0">
                                    <%
                                    Class.forName("com.mysql.jdbc.Driver");

                                    String myUrl = "jdbc:mysql://localhost:3306/kbmc";
                                    String uname = "root";
                                    String pass = "";
                                    Connection myConnection = DriverManager.getConnection(myUrl,uname,pass);

                                    Statement myStatement = myConnection.createStatement();

                                    String myQuery = "select * from message";
                                    ResultSet myRs = myStatement.executeQuery(myQuery);
                                    
                                    
                                    out.print("<thead>");
                                    out.print("<tr class=\"align-self-center\">");
                                    out.print("<th>User ID</th>");
                                    out.print("<th>user Email</th>");
                                    out.print("<th>User Name</th>");
                                    out.print("<th>User Subject</th>");
                                    out.print("<th>User Message</th>");
                                    out.print("<th>Action</th>");
                                    out.print("</tr>");
                                    out.print("</thead>");
                                    out.print("<tbody>");
                                    
                                    while (myRs.next()){
                                    out.println("<tr>");
                                    out.println("<td>" + myRs.getString(1) + "</td>");
                                    out.println("<td>" + myRs.getString(2) + "</td>");
                                    out.println("<td>" + myRs.getString(3) + "</td>");
                                    out.println("<td>" + myRs.getString(4) + "</td>");
                                    out.println("<td>" + myRs.getString(5) + "</td>");
                                    out.println("<td><a href=emailSend.jsp?userID="
                                            + myRs.getString(1) + " style='text-decoration:none;'>Email</a>"
                                            +"</td>");
                                    
                                    out.println("</tr>");
                                }
                                    out.println("</table>");
                                    /*out.println("<td><input type='button' value='Back' onclick='history.back();' "
                                            + "style='width:150px;background-color:#4CAF50;color:white;padding:14px 20px;"
                                            + "margin:8px 0;border:none;border-radius:4px;cursor:pointer;'/></td>");*/
                                    out.println("</div>");
                                    myConnection.close();
            %>
        
            </div>
          </table>
                            </div>
                            <!--end table-responsive-->
                            <div class="pt-3 border-top text-right">
                                <a href="adminDashboard.jsp" style="color: aliceblue;"><button type="button" id="submit" name="submit" class="btn btn-secondary">Back</button></a>
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
