<%-- 
    Document   : adminRegistration
    Created on : Jun 8, 2022, 2:37:25 PM
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
        
        <title>ADMIN REGISTER || KBMC</title>
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
                
            </div>
        </nav>
        <br>
        <div style="border: 4px solid #527a7a; padding: 10px;">
            <div class="header">
                <h1>KBMC Hospital Job Vacancy Application</h1>
                <h3 style="text-align: center"><b>ADMIN SECTION</b></h3>
            </div>
            <br>
            <div>
                <fieldset >
                    <h2 style="text-align: center">Admin Registration</h2>
                    <form action="adminRegisterProcess.jsp" method="POST">
                        <table><br>
                           <tr>
                                <td style="text-align: right"><label >Full Name:</label></td>
                                <td><input type="text" name="adminName" placeholder="Admin full name.." size="20" required/></td>
                            </tr>
                            <tr>
                                <td style="text-align: right"><label >Email:</label></td>
                                <td><input type="text" name="adminEmail" size="20" required/></td>
                            </tr>
                            <tr>
                                <td style="text-align: right"><label>Password:</label></td>
                                <td><input type="password" name="adminPass" id="adminPass" size="20" required/></td>
                            </tr>
               
                            <tr>
                                <td style="text-align: right"><label>Contact Number:</label></td>
                                <td><input type="text" name="adminNo" size="20" placeholder="012-345678" required></td>
                            </tr>
                            
                             <tr>
                                <td style="text-align: right"><label>Status:</label></td>
                                <td><select name="adminStatus" style="width:155px">  
                                <option>Active</option>  
                                <option>Inactive</option>  
                                    </select> </td>>
                                <!--td><input type="text" name="empBranch" size="20" placeholder="KBMC Pasir Mas" required></td>
                            </tr-->
                            
                            
                        </table>
                        <br>
                        <p style='text-align: center'><input type="submit" style="text-align: center;"/>
                        <p style='text-align: center'>Already own an account? Login <a href="adminLogin.jsp">Here!</a></p>
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