<%-- 
    Document   : jsLogin
    Created on : May 26, 2022, 1:56:06 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>JOBSEEKER || KBMC</title>
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
            /* Remove the navbar's default margin-bottom and rounded borders 
            .navbar {
                margin-bottom: 0;
                border-radius: 0;
            }*/

            /* Add a gray background color and some padding to the footer */
           /* footer {
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
                    <a class="navbar-brand" href="homepage.jsp"> KBMC HOSPITAL JOB VACANCY APPLICATION</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="homepage.jsp">Home</a></li>
                        <li><a href="viewJob.jsp">Browse Jobs</a></li>
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
                <h1>KBMC Hospital Job Vacancy Application</h1>
            </div>
            <br>
            <div>
                <fieldset>
                    <form action="LoginJs" method="POST">
                        
                        <h2 style="text-align: center">Sign in</h2> 
                        <table>
                            <tr>
                                <td><label>Email:</label></td>
                                <td><input style="margin-bottom: 10px" type="text" name="jsEmail" size="20" required/></td>
                            </tr>
                            <tr>
                                <td><label>Password:</label></td>
                                <td><input style="margin-bottom: 10px"  type="password" name="jsPass" size="20" required /></td>
                            </tr>
                        </table>
                        <br>
                       
                       <p style='text-align: center'><input type="submit" value="Sign in" style='font-family: century gothic;'></p>
                    </form>
          

       
    </body>
    
     <footer class="container-fluid text-center">
            <p>KBMC Hospital Job Vacancy Application</p>
        </footer>
</html>
