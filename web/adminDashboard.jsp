<%-- 
    Document   : adminLoginMain
    Created on : Jan 1, 2022, 3:33:28 PM
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
        <title>ADMIN DASHBOARD|| KBMC</title>
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
    
    <body style="text-align: centre; text-align: center; font-family: century gothic">
        <%
            String adminName = (String)request.getSession().getAttribute("adminName"); // nak keluarkan nama dekat acc dashboard, akan ke servlet 
            Integer adminID = (Integer)request.getSession().getAttribute("adminID");
            
           // nak keluarkan id dekat acc dashboard, akan ke servlet 
            Integer userID = (Integer)request.getSession().getAttribute("userID");
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
                <div class="collapse navbar-collapse" id="myNavbar">
                   
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="adminLogin.jsp"><span class="glyphicon glyphicon-log-in"></span> Log Out</a></li>
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
                <!--fieldset>
                    <p style="text-align: center">Welcome to Admin Section of KBMC  <%=adminName%>[<a href="logoutAdmin.jsp" >Sign Out</a>]</p>
                    <div style="text-align: center">
                        <a href="viewAdmin.jsp?adminID=<%=adminID%>">Manage Profile</a> | <a href="viewJob.jsp">Manage Jobs</a> | <a href="Application.jsp">View Application</a> | <a href="empRegister.jsp">Add Employer</a> 
                        | <a href="viewEmpList.jsp?adminID=<%=adminID%>">View Employer List</a> 
                    </div>
                </fieldset-->
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

                </fieldset>
            </div>
                    <br><!-- comment -->
                    <br><!-- comment -->
                   
        </div>
                    </div
                    <br>

        <footer class="container-fluid text-center">
            <h4><b> KBMC Hospital Job Vacancy Application</b></h4>
        </footer>
    </body>
</html>

