<%-- 
    Document   : viewAdmin
    Created on : Apr 12, 2022, 7:42:48 PM
    Author     : USER
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <title>ADMIN PROFILE || KBMC</title>
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
     
             margin-left:auto;
             margin-right:auto;
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

            int adminID = Integer.parseInt(request.getParameter("adminID"));
            String adminName="", adminEmail="", adminPass="", adminNo="";


            Class.forName("com.mysql.jdbc.Driver");

            String myUrl= "jdbc:mysql://localhost:3306/kbmc";
            String uname="root";
            String pass="";

            Connection myConnection = DriverManager.getConnection(myUrl,uname,pass);

            String myQuery = "select * from admin "
                      + "where adminID=" + adminID;          

            Statement myStatement = myConnection.createStatement();

            ResultSet myRs = myStatement.executeQuery(myQuery);

            while(myRs.next()){
                adminName = myRs.getString(2);
                adminEmail = myRs.getString(3);
                adminPass = myRs.getString(4);
                adminNo = myRs.getString(5);
               
            }
            myConnection.close();
        %>
    
        <div style="border: 4px solid #94b8b8;">
            <div class="header">
                <h1>KBMC Hospital Job Vacancy Application</h1>
            </div>
            <br>
            <div>
                
                   
                    <div class="main">
                        <h4 style="text-align:center"><b>ADMIN SECTION </b></h4>
                        <p style="text-align: center">Welcome to Admin Section of KBMC <b><%=adminName%></b></p>
              
                    </div>
                        
                    <fieldset>    
                    <div style="text-align: center"; class="scrollmenu">
                    <a href="viewAdmin.jsp?adminID=<%=adminID%>">Manage Profile</a>
                    <a href="jobList.jsp">View Job </a> 
                    <a href="createJob.jsp">Add Job</a> 
                    <a href="Application.jsp">View Application</a> 
                    <a href="empRegister.jsp">Add Employer</a>   
                    <a href="empList.jsp?adminID=<%=adminID%>">View Employer List</a> 
                    <a href="viewMesg.jsp">View Message</a>  
                    <a href="logoutAdmin.jsp" >Sign Out</a>
                  </div>
                
                    <div>
                        <form  style="center" action="viewAdminUpdate.jsp" method="POST">
                            <h1 style="text-align: center">Update Admin Profile</h1>
                            <table>
                                <tr>
                                    <!--td><label>Admin ID</label><input type="hidden" name="hidid" value="<%=adminID%>"/></td>
                                    <!--td><input type="text" id="adminid" name="adminID" value="<%=adminID%>" style="width:250px;" readonly></td-->
                                </tr>
                              
                                <tr>
                                    <td><label>Name:</label></td>
                                    <td><input style="margin-bottom: 10px" type="text" name="adminName" id="adminName" value="<%=adminName%>" style="width:250px;" required></td>
                                </tr>
                                <tr>
                                    <td><label>Email:</label></td>
                                    <td><input style="margin-bottom: 10px" type="text" name="adminEmail" id="adminEmail" value="<%=adminEmail%>" style="width:250px;" required></td>
                                </tr>
                                <tr>
                                    <td><label>Password:</label></td>
                                    <td><input style="margin-bottom: 10px" type="text" name="adminPass" id="adminPass" value="<%=adminPass%>" style="width:250px;" required></td>
                                </tr>
                                <tr>
                                    <td><label>Phone Number: </label></td>
                                    <td><input style="margin-bottom: 10px" type="text" name="adminNo" id="adminNo" value="<%=adminNo%>" style="width:250px;" required></td>
                                </tr>
                                <tr>
                                    
                                </tr>
                            </table>
                            <p style='text-align: center'><input type="submit" value="Update">
                                <input type="button" value="Cancel" onclick="window.location.href = 'adminDashboard.jsp'; return false"/>
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