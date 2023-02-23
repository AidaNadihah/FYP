<%-- 
    Document   : empDashboard
    Created on : May 26, 2022, 5:12:35 AM
    Author     : USER
--%>


<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>EMPLOYER DASHBOARD || KBMC</title>
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
     
             margin-left:250px;
             margin-right:300px;
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
        <%
            String empName = (String)request.getSession().getAttribute("empName"); // nak keluarkan nama dekat acc dashboard, akan ke servlet 
            Integer empID = (Integer)request.getSession().getAttribute("empID");
        %>
        
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
               
                <div class="main">
                        <h4 style="text-align:center"><b>EMPLOYER SECTION </b></h4>
                        <p style="text-align: center">Welcome to Employer Section of KBMC <b><%=empName%></b></p>
              
                  </div>
                <fieldset> 
                   <div style="text-align: center"; class="scrollmenu">
                    <a href="viewEmp.jsp?empID=<%=empID%>">Manage Profile</a>
                    <a href="jobListE.jsp">Apply Job </a> 
                    <a href="Application.jsp">View Application</a>   
                    <a href="adminList.jsp?empID=<%=empID%>">View Current Admin</a> 
                    <a href="viewMesgE.jsp">View Message</a>  
                    <a href="logoutEmp.jsp" >Sign Out</a>
                  </div>

                </fieldset>
            </div>
                   
        
        </div>
                    <br>

        <footer class="container-fluid text-center">
            <p>KBMC Hospital Job Vacancy Application</p>
        </footer>
    </body>
</html>

