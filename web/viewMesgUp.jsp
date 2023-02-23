<%-- 
    Document   : viewMesgUp
    Created on : Jun 21, 2022, 4:09:28 PM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <title>ADMIN ||KBMC </title>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
                    <a class="navbar-brand" href="homepage.jsp">Hospital Job Vacancy Application</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="employerLoginMain.jsp">Home</a></li>
                        <li><a href="jobList.jsp">Browse Jobs</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <br>
        <%
            String adminName = request.getParameter("adminName");
            int userID = Integer.parseInt(request.getParameter("userID"));
            String userEmail="", userName="", userSubject="", userMesg="";


            Class.forName("com.mysql.jdbc.Driver");

            String myUrl= "jdbc:mysql://localhost:3306/kbmc";
            String uname="root";
            String pass="";

            Connection myConnection = DriverManager.getConnection(myUrl,uname,pass);

            String myQuery = "select * from message "
                      + "where userID=" + userID;          

            Statement myStatement = myConnection.createStatement();

            ResultSet myRs = myStatement.executeQuery(myQuery);

            while(myRs.next()){
                userEmail = myRs.getString(2);
                userName = myRs.getString(3);
                userSubject = myRs.getString(4);
                userMesg = myRs.getString(5);
               
               
            }
            myConnection.close();
        %>
    
        <div style="border: 4px solid #94b8b8; padding: 10px;">
            <div class="header">
                <h1>KBMC Hospital Job Vacancy Application</h1>
                <h2>ADMIN SECTION</h2>
            </div>
            <br>
            <div>
                <fieldset>
                    <p style="text-align: center">Welcome to Admin Section of KBMC  <%=adminName%>[<a href="logoutAdmin.jsp" >Sign Out</a>]</p>
                    
                    <div>
                        <form action="viewMesgUpPro.jsp" method="POST">
                            <h1 style="text-align: center"> EMAIL USER</h1>
                            <table>
                            
                                <tr>
                                    <td><label>To: </label></td>
                                    <td><input type="text" name="userEmail" id="userEmail" value="<%=userEmail%>" required></td>
                                </tr>
                                <tr>
                                    <td><label>Name:</label></td>
                                    <td><input type="text" name="userName" id="userName" value="<%=userName%>" required></td>
                                </tr>
                                <tr>
                                    <td><label>Subject:</label></td>
                                    <td><input type="text" name="userSubject" id="userSubject" value="<%=userSubject%>" required></td>
                                </tr>
                                <tr>
                                    <td><label>Message: </label></td>
                                    <td><textarea rows="12" cols="80" name="userMesg"></textarea><br/>
                    </td>
                                </tr>

                            </table>
                            <p style='text-align: center'>
                                <input type="submit" value="Update">
                                <input type="reset" value="Reset">
                                <input type="button" value="Cancel" onclick="window.location.href = 'viewMesg.jsp'; return false"/>
                               
                            </p>
                          
                        </form>
                    </div>
                </fieldset>
            </div>
        </div>

        <br>

        <footer class="container-fluid text-center">
            <p>KBMC Hospital Job Vacancy Application System</p>
        </footer>
    </body>

    
</html>
