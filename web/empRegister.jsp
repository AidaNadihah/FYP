<%-- 
    Document   : empRegister
    Created on : May 25, 2022, 10:54:46 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>KBMC Hospital Job Vacancy</title>
        <style>

            .header {
                background-color: #a3c2c2;
                text-align: center;
                padding: 1px;
            }

            table {
                margin-left:auto;
                margin-right:auto;
            } 

            fieldset {
                border : 1px solid #527a7a;
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
                    <a class="navbar-brand" href="homepage.jsp">KBMC HOSPITAL JOB VACANCY APPLICATION </a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="homepage.jsp">Home</a></li>
                        <li><a href="jobList.jsp">Browse Jobs</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <br>
        <div style="border: 4px solid #527a7a; padding: 10px;">
            <div class="header">
                <h1>KBMC Hospital Job Vacancy</h1>
                <h3>Admin || Employer Registration</h3>
            </div>
            <br>
            <div>
                <fieldset >
                    <h2 style="text-align: center">Employer Registration</h2>
                    <form action="empRegisterProcess.jsp" method="POST">
                        <table>
                           <tr>
                                <td style="text-align: right"><label >Full Name:</label></td>
                                <td><input type="text" name="empName" placeholder="Employer full name.." size="20" required/></td>
                            </tr>
                            <tr>
                                <td style="text-align: right"><label >Email:</label></td>
                                <td><input type="text" name="empEmail" size="20" required/></td>
                            </tr>
                            <tr>
                                <td style="text-align: right"><label>Password:</label></td>
                                <td><input type="password" name="empPass" id="empPass" size="20" required/></td>
                            </tr>
               
                            <tr>
                                <td style="text-align: right"><label>Contact Number:</label></td>
                                <td><input type="text" name="empNo" size="20" placeholder="012-345678" required></td>
                            </tr>
                            
                             <tr>
                                <td style="text-align: right"><label>Position: </label></td>
                                <td><input type="text" name="empPos" size="20" placeholder="State the position" required></td>
                            </tr>
                            
                            
                        </table>
                        <br>
                        <p style='text-align: center'><input type="submit" style="text-align: center;"/>
                        <p style='text-align: center'>Already own an account? Login <a href="login.jsp">Here!</a></p>
                    </form>
                </fieldset>
            </div>
        </div>
        <br>

        <footer class="container-fluid text-center">
            <p><b>KBMC Hospital Job Vacancy</b></p>
        </footer>
    </body>

</html>