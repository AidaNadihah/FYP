<%-- 
    Document   : viewJs
    Created on : Jun 22, 2022, 10:40:30 AM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <title>JOBSEEKER PROFILE || KBMC</title>
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
             div.scrollmenu {
             background-color: #333;
             overflow: auto;
             white-space: nowrap;
     
             margin-left:400px;
             margin-right:400px;
           }

           div.scrollmenu a {
             display: inline-block;
             color: white;
             text-align: center;
             padding: 10px;
             text-decoration: none;
           }

           div.scrollmenu a:hover {
             background-color: #777;
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
        <%

            int jsID = Integer.parseInt(request.getParameter("jsID"));
            String jsName="", jsEmail="", jsPass="", jsAddress="", jsDOB="", jsCity="", jsNo="", jsCGPA="", jsQualification="", jsMajor="";


            Class.forName("com.mysql.jdbc.Driver");

            String myUrl= "jdbc:mysql://localhost:3306/kbmc";
            String uname="root";
            String pass="";

            Connection myConnection = DriverManager.getConnection(myUrl,uname,pass);

            String myQuery = "select * from jobseeker "
                      + "where jsID=" + jsID;          

            Statement myStatement = myConnection.createStatement();

            ResultSet myRs = myStatement.executeQuery(myQuery);

            while(myRs.next()){
                jsName = myRs.getString(2);
                jsEmail = myRs.getString(3);
                jsPass = myRs.getString(4);
                jsAddress = myRs.getString(5);
                jsDOB = myRs.getString(6);
                jsCity = myRs.getString(7);
                jsNo = myRs.getString(8);
                jsCGPA = myRs.getString(9);
                jsQualification = myRs.getString(10);
                jsMajor = myRs.getString(11);
                
            }
            myConnection.close();
        %>
    
        <div style="border: 4px solid #94b8b8;">
            <div class="header">
                <h1>KBMC Hospital Job Vacancy Application</h1>
            </div>
            <br>
            <div>
                <fieldset>
                 
                    
                     <div class="main">
                        <h4 style="text-align:center"><b>JOBSEEKER SECTION </b></h4>
                        <p style="text-align: center">Welcome to Jobseeker Section of KBMC <b><%=jsName%></b></p>
              
                  </div>
                <fieldset> 
                   <div style="text-align: center"; class="scrollmenu">
                     <a href="viewJs.jsp?jsID=<%=jsID%>">Manage Profile</a>
                    <a href="jobListJs.jsp">View Job </a> 
                    <a href="Application.jsp">View Application Status</a>   
                    <a href="logoutJs.jsp" >Sign Out</a>
                  </div>

                    <div>
                        <form action="viewJsUpdate.jsp" method="POST">
                            <h1 style="text-align: center">Update Jobseeker Profile</h1>
                            <table>
                                <tr>
                                   <!--td style="text-align: left"><label>JS ID:</label></td>
                                    <td><input style="margin-bottom: 5px" type="text" id="jsID" name="jsID" value="<%=jsID%>" required></td-->
                                </tr>
                              
                                <tr>
                                    <td style="text-align: left"><label>Name:</label></td>
                                    <td><input style="margin-bottom: 5px" type="text" name="jsName" id="jsName" value="<%=jsName%>" required></td>
                                </tr>
                                <tr>
                                    <td style="text-align: left"><label>Email:</label></td>
                                    <td><input style="margin-bottom: 5px" type="text" name="jsEmail" id="jsEmail" value="<%=jsEmail%>" required></td>
                                </tr>
                                <tr>
                                    <td style="text-align: left"><label>Password:</label></td>
                                    <td><input style="margin-bottom: 5px" type="text" name="jsPass" id="jsPass" value="<%=jsPass%>" required></td>
                                </tr>
                                <tr>
                                    <td style="text-align: left"><label>Phone Number: </label></td>
                                    <td><input style="margin-bottom: 5px" type="text" name="jsNo" id="jsNo" value="<%=jsNo%>" required></td>
                                </tr>
                                <tr>
                                    <td style="text-align: left"><label>Address: </label></td>
                                    <td><input style="margin-bottom: 5px" type="text" name="jsAddress" id="jsAddress" value="<%=jsAddress%>" required></td>
                                </tr>
                                <tr>
                                    <td style="text-align: left"><label>Date of Birth:  </label></td>
                                    <td><input style="margin-bottom: 5px" type="text" name="jsDOB" id="jsDOB" value="<%=jsDOB%>" required></td>
                                </tr>
                                <tr>
                                    <td style="text-align: left"><label>City:  </label></td>
                                    <td><input style="margin-bottom: 5px" type="text" name="jsCity" id="jsDOB" value="<%=jsCity%>" required></td>
                                </tr>
                                <tr>
                                <td style="text-align: left"><label>Contact Number:</label></td>
                                <td><input style="margin-bottom: 5px" type="text" name="jsNo" size="20" placeholder="012-345678" required value="<%=jsNo%>" style="width:390px;"></td>
                            </tr>
                            <tr>
                                <td style="text-align: left"><label>CGPA:</label></td>
                                <td><input style="margin-bottom: 5px" type="text" name="jsCGPA" size="20" placeholder="4.0" required value="<%=jsCGPA%>" style="width:390px;"></td>
                            </tr>
                             <tr>
                                <td style="text-align: left"><label>Qualification: </label></td>
                                <td><input style="margin-bottom: 5px" type="text" name="jsQualification" size="20"  required value="<%=jsQualification%>" style="width:390px;"></td>
                            </tr>
                            <tr>
                                <td style="text-align: left"><label>Major </label></td>
                                <td><input style="margin-bottom: 5px" type="text" name="jsMajor" size="20"  required value="<%=jsMajor%>" style="width:390px;"/></td>
                            </tr>
                           
                            </table>
                                <br>
                            <p style='text-align: center'><input type="submit" value="Update">
                                <input type="button" value="Cancel" onclick="window.location.href = 'jsDashboard.jsp'; return false"/>
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
