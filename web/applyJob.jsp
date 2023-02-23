<%-- 
    Document   : applyJob
    Created on : Jun 25, 2022, 1:49:41 AM
    Author     : USER
--%>


<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN ADD JOB || KBMC </title>
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
    <body style="font-family: century gothic">
          <%
            String jsName = (String)request.getSession().getAttribute("jsName"); // nak keluarkan nama dekat acc dashboard, akan ke servlet 
            Integer jsID = (Integer)request.getSession().getAttribute("jsID");
            int jobID = Integer.parseInt(request.getParameter("jobID"));
            String jobTitle = (String)request.getSession().getAttribute("jobTitle");
            String jsEmail = (String)request.getSession().getAttribute("jsEmail");
            
        %>
  
        
        <div style="border: 4px solid #94b8b8; padding: 10px;">
            <div class="header">
                <h1>KBMC Hospital Job Vacancy Application System</h1>
                 
            </div>
            <br>
            <div>
            
         
                <div class="main">
                        <h3 style="text-align:center"><b>JOBSEEKER SECTION</b></h3>
                        <p style="text-align: center">Welcome to Admin Section of KBMC <b><%=jsName%></b></p>
              
                  </div>
            
                <fieldset style="text-align: center; font-family: century gothic">
                   
                     
                        <div style="text-align: center"; class="scrollmenu">
                        <a href="viewJs.jsp?jsID=<%=jsID%>">Manage Profile</a>
                        <a href="jobListJs.jsp?jsID=<%=jsID%>"">View Job </a> 
                        <a href="viewApplication.jsp">View Application Status</a>   
                        <a href="logoutJs.jsp" >Sign Out</a>
                        </div>

                
                    
                    <h1 style=" font-family: century gothic">Apply Job Vacancies</h1>
                    <form action="FileUploadServlet" method="post">
                        <table>
                            <!--tr> <input type="hidden" name="jobID"></tr-->
                            <tr>
                                <!--td><label>Application ID</label></td-->
                                <td><input type="hidden" id="jobAppID" size="50"/></td>
                                
                            </tr>
                            <tr>
                                <td><label>Submission Date</label></td>
                                <td><input type="date" id="jobAppDate" size="50"/></td>
                                
                            </tr>
                            <tr>
                                <td><label>Job ID</label></td>
                                <td><input type="text" id="jobID" size="50" value="<%=jobID%>"/></td>
                                
                            </tr>
                            <tr>
                                <td><label>Position</label></td>
                                <td><input type="text" id="jobTitle" size="50" value="<%=jobTitle%>"/></td>
                                
                            </tr>
                            <tr>
                                <td><label>Jobseeker ID</label></td>
                                <td><input type="text" id="jsID" size="50" value="<%=jsID%>"/></td>
                                
                            </tr>
                            
                            <tr>
                                <td><label>Name</label></td>
                                <td><input type="text" id="jsName" size="50" value="<%=jsName%>"/></td>
                            </tr>
                            <tr>
                                <td><label>Email:</label></td>
                                <td><input type="text" id="jsEmail" size="50" value="<%=jsEmail%>" required></td>
                            </tr>
                            
                            <tr>
                            <td><label>Resume:</label></td>
                            <td><input type="file" name="file" id="jobDate" size="50" required=""></td>
                            </tr>
                            
                            
                            
                          
                        </table>
                        <p style="text-align: center"><input type="submit" value="Add New Job">
                             <!--center><a href="viewApplication.jsp">View All </a></center-->
                          
                            <input type="button" value="Cancel" onclick="window.location.href = 'jsDashboard.jsp'; return false"/>
                        </p>
                    </form>
               </fieldset>
                
                <script language="javascript">
                var today = new Date();
                var dd = String(today.getDate()).padStart(2, '0');
                var mm = String(today.getMonth() + 1).padStart(2, '0');
                var yyyy = today.getFullYear();

                today = yyyy + '-' + mm + '-' + dd;
                $('#jobDate').attr('min',today);
                    </script>
            </div>
        </div>
        <br>

        <footer class="container-fluid text-center">
            <center><h4> KBMC Hospital Job Vacancy System</h4></center>
        </footer>
    </body>
</html>


