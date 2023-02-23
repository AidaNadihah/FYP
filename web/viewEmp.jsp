<%-- 
    Document   : viewEmp
    Created on : May 26, 2022, 5:23:43 AM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <title>EMPLOYER PROFILE || KBMC</title>
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

            int empID = Integer.parseInt(request.getParameter("empID"));
            String empName="", empEmail="", empPass="", empNo="", empBranch="";


            Class.forName("com.mysql.jdbc.Driver");

            String myUrl= "jdbc:mysql://localhost:3306/kbmc";
            String uname="root";
            String pass="";

            Connection myConnection = DriverManager.getConnection(myUrl,uname,pass);

            String myQuery = "select * from employer "
                      + "where empID=" + empID;          

            Statement myStatement = myConnection.createStatement();

            ResultSet myRs = myStatement.executeQuery(myQuery);

            while(myRs.next()){
                empName = myRs.getString(2);
                empEmail = myRs.getString(3);
                empPass = myRs.getString(4);
                empNo = myRs.getString(5);
                empBranch = myRs.getString(6);
               
               
            }
            myConnection.close();
        %>
    
        <div style="border: 4px solid #94b8b8; padding: 10px;">
            <div class="header">
                <h1>KBMC Hospital Job Vacancy Application</h1>
            </div>
            <br>
            <div>
                <fieldset>
                 
                    
                     <div class="main">
                        <h4 style="text-align:center"><b>EMPLOYER SECTION </b></h4>
                        <p style="text-align: center">Welcome to Employer Section of KBMC <b><%=empName%></b></p>
              
                  </div>
                <fieldset> 
                   <div style="text-align: center"; class="scrollmenu">
                    <a href="viewEmp.jsp?empID=<%=empID%>">Manage Profile</a>
                    <a href="jobList.jsp">View Job Advertisement</a> 
                    <a href="jobApp.jsp">View Application</a>  
                    <a href="adminList.jsp">View Admin</a> 
                    
                    <a href="logoutEmp.jsp" >Sign Out</a>
                  </div>

                    <div>
                        <form action="viewEmpUpdate.jsp" method="POST">
                            <h1 style="text-align: center">Update Employer Profile</h1>
                            <table>
                                <tr>
                                   <td><label>Emp ID:</label></td>
                                    <td><input type="text" id="adminid" name="empID" value="<%=empID%>" required></td>
                                </tr>
                              
                                <tr>
                                    <td><label>Name:</label></td>
                                    <td><input type="text" name="empName" id="adminName" value="<%=empName%>" required></td>
                                </tr>
                                <tr>
                                    <td><label>Email:</label></td>
                                    <td><input type="text" name="empEmail" id="adminEmail" value="<%=empEmail%>" required></td>
                                </tr>
                                <tr>
                                    <td><label>Password:</label></td>
                                    <td><input type="text" name="empPass" id="adminPass" value="<%=empPass%>" required></td>
                                </tr>
                                <tr>
                                    <td><label>Phone Number: </label></td>
                                    <td><input type="text" name="empNo" id="adminNo" value="<%=empNo%>" required></td>
                                </tr>
                                <tr>
                                    <td><label>Branch: </label></td>
                                    <td><input type="text" name="empBranch" id="adminNo" value="<%=empBranch%>" required></td>
                                </tr>
                            </table>
                                <br>
                            <p style='text-align: center'><input type="submit" value="Update">
                                <input type="button" value="Cancel" onclick="window.location.href = 'empDashboard.jsp'; return false"/>
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
