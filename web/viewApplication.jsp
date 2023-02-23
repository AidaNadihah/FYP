<%-- 
    Document   : viewApplication
    Created on : Jun 25, 2022, 3:27:55 AM
    Author     : USER
--%>

<%-- 
    Document   : jobList
    Created on : Jun 15, 2022, 11:37:18 PM
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
        <title>JOBSEEKER APPLICATION || KBMC </title>
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
    <body style="font-family: century gothic"">
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
        <div style="border: 4px solid #527a7a;">
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
                           <h3 style=" text-align: center;" class="header-title pb-3 mt-0"><b>Job Application of KBMC </b></h3>
                            <div class="table-responsive">
                                
                                    <%
                                        try{
                                            
                                        
                                    Class.forName("com.mysql.jdbc.Driver");

                                    String myUrl = "jdbc:mysql://localhost:3306/kbmc";
                                    String uname = "root";
                                    String pass = "";
                                    Connection myConnection = DriverManager.getConnection(myUrl,uname,pass);

                                    Statement myStatement = myConnection.createStatement();

                                    String myQuery = "select * from jobApplication";
                                    ResultSet myRs = myStatement.executeQuery(myQuery);
                                    
                                    while (myRs.next()) {
                                    int jobAppID = myRs.getInt("jobAppID");
                                    String jobAppDate = myRs.getString("jobAppDate");
                                    int jobID = myRs.getInt("jobID");                            
                                    String jobTitle = myRs.getString("jobTitle");
                                    int jsID = myRs.getInt("jsID"); 
                                    String jsName = myRs.getString("jsName");
                                    String jsEmail = myRs.getString("jsEmail");
                                    String resume = myRs.getString("resume");
                                    String path = myRs.getString("path");
                                    
                               
            %>
       
            <table class="table table-hover mb-0">
            <thead>
                <tr class=\"align-self-center\">
                    <th>Application ID</th>
                    <th>Application Date</th>
                    <th>Job ID</th>
                    <th>Job Title</th>
                    <th>Jobseeker ID</th>
                    <th>Jobseeker Name</th><!-- comment -->
                    <th>Jobseeker Email</th>
                    <th>Resume</th>
                    <th>Path</th>
                </tr>
                <tr>
                    <td><%=jobAppID%></td>
                    <td><%=jobAppDate%></td>
                    <td><%=jobID%></td>
                    <td><%=jobTitle%></td>
                    <td><%=jsID%></td>
                    <td><%=jsName%></td>
                    <td><%=jsEmail%></td>
                    <td><%=resume%></td>
                    <td><%=path%></td>
                     <td><a href="<%=resume%>" download>Download</a></td>
                </tr>
                
            
          </table>
                 <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
                            </div>
                            <!--end table-responsive-->
                            <div class="pt-3 border-top text-right">
                                <a href="jsDashboard.jsp" style="color: aliceblue;"><button type="button" id="submit" name="submit" class="btn btn-secondary">Back</button></a>
                            </div>
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
