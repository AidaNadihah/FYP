<%-- 
    Document   : jobListUpdate
    Created on : Jun 24, 2022, 12:24:33 AM
    Author     : USER
--%>

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
    <body style="text-align: centre;font-family: century gothic">
        
          <%
            String adminName = (String)request.getSession().getAttribute("adminName"); // nak keluarkan nama dekat acc dashboard, akan ke servlet 
            Integer adminID = (Integer)request.getSession().getAttribute("adminID");
            
            
            int jobID =Integer.parseInt(request.getParameter("jobID"));
            String jobType ="";
            String jobTitle ="";
            String jobcatName ="";
            String jobInfo ="";
            String jobSalary ="";
            String jobDate = "";
            String jobStatus = "";
            String adminEmail ="";
            
            
           

            Class.forName("com.mysql.jdbc.Driver");

            String myUrl= "jdbc:mysql://localhost:3306/kbmc";
            String uname="root";
            String pass="";

            Connection myConnection = DriverManager.getConnection(myUrl,uname,pass);

            String myQuery = "select * from job "
                      + "where jobID=" + jobID;          

            Statement myStatement = myConnection.createStatement();

            ResultSet myRs = myStatement.executeQuery(myQuery);

            while(myRs.next()){
                jobType= myRs.getString(2);
                jobTitle = myRs.getString(3);
                jobcatName = myRs.getString(4);
                jobInfo = myRs.getString(5);
                jobSalary = myRs.getString(6);
                jobDate = myRs.getString(7);
                jobStatus = myRs.getString(8);
                adminEmail = myRs.getString(9);
               
            }
            myConnection.close();
        %>
  
        
        <div style="border: 4px solid #94b8b8; padding: 10px;">
            <div class="header">
                <h1>KBMC Hospital Job Vacancy Application System</h1>
                 
            </div>
            <br>
            <div>
            
         
                <div class="main">
                        <h3 style="text-align:center"><b>ADMIN SECTION </b></h3>
                        <p style="text-align: center">Welcome to Admin Section of KBMC <b><%=adminName%></b></p>
              
                  </div>
            
                <fieldset style="text-align: center; font-family: century gothic">
                   
                     
                        <div style="text-align: centre" class="scrollmenu">
                        <a href="viewAdmin.jsp?adminID=<%=adminID%>">Manage Profile</a>
                        <a href="jobList.jsp">View Job </a> 
                        <a href="createJob.jsp">Add Job</a> 
                        <a href="Application.jsp">View Application</a> 
                        <a href="empRegister.jsp">Add Employer</a>   
                        <a href="viewEmpList.jsp?adminID=<%=adminID%>">View Employer List</a> 
                        <a href="logoutAdmin.jsp" >Sign Out</a>
                       </div>

                </fieldset>
                    
                    <h1 style="text-align: center; font-family: century gothic">Update Job Advertisement</h1>
                    <form  style="center" action="jobListUpdateProcess.jsp" method="post">
                        <table>
                            <tr> <input type="hidden" name="jobID" value="<%=jobID%>"></tr>
                            <tr>
                                <td><label>Type:</label></td>
                                <td>
                                    <label class="container">
                                        <input type="radio" checked="checked" name="jobType" value="<%=jobType%>">Full Time
                                        <span class="checkmark" required></span>
                                    </label>
                                    <label class="container">
                                        <input type="radio" checked="checked" name="jobType" value="<%=jobType%>">Part Time
                                        <span class="checkmark" required></span>
                                    </label>
                                    <label class="container">
                                        <input type="radio" checked="checked" name="jobType" value="<%=jobType%>">Internship
                                        <span class="checkmark" required></span>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td><label>Position:</label></td>
                                <td><input type="text" name="jobTitle" id="jobTitle" size="50" value="<%=jobTitle%>"/></td>
                            </tr>
                            <tr>
                                <td><label>Category:</label></td>
                                <td><select name="jobcatName" id="jobcatName" style="width:370px" class="dropdown-el"/>
                                        <option >Specialist Clinic</option>
                                        <option >Accident & Emergency</option>
                                        <option >Ambulance</option>
                                        <option >Radiology</option>
                                        <option >Laboratory</option>
                                        <option >Maternity</option>
                                        <option >Operation</option>
                                        <option >Pharmacy</option>
                                        <option >Physiotherapy</option>
                                        <option >High Dependency Unit (HDU)</option>
                                        <option >Staff Nurse</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td><label>Job Scope:</label></td>
                                <td><input type="text" name="jobInfo" id="jobInfo" size="50" value="<%=jobInfo%>"/></td>
                            </tr>
                            <tr>
                                <td><label>Contact Email:</label></td>
                                <td><input type="text" name="adminEmail" id="adminEmail" size="50" required value="<%=adminEmail%>" ></td>
                            </tr>
                            <tr>
                                <td><label>Starting Salary (RM):</label></td>
                                <td><input type="text" name="jobSalary" id="jobSalary"  size="50" required value="<%=jobSalary%>"></td>
                            </tr>
                            <tr>
                            <td><label>Date Posted:</label></td>
                            <td><input type="date" id="jobDate" name="jobDate" placeholder="Pick up a date" style="width:390px;" value="<%=jobDate%>"></td>
                            </tr>
                            
                            <tr>
                            <td><label>Status:</label></td>
                            <td>
                                <!--input type="text" id="jobStatus" name="jobStatus" value="Available" style="width:390px;"></td-->
                            <select name="jobStatus" value="<%=jobStatus%>" style="width:370px;" id="jobStatus" class="dropdown-el">
                                        <option >Unavailable</option>
                                        <option >Available</option>
                                        </select>
                       
                            </tr>
                            
                            
                          
                        </table>
                        <p style="text-align: center"><input type="submit" value="Update">
                          
                            <input type="button" value="Cancel" onclick="window.location.href = 'adminDashboard.jsp'; return false"/>
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


