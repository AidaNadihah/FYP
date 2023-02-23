<%-- 
    Document   : jProUpdate
    Created on : Jun 24, 2022, 10:31:14 PM
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
        <title>JOBSEEKER REGISTRATION || KBMC </title>
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
         <%                         String jsName = (String)request.getSession().getAttribute("jsName"); // nak keluarkan nama dekat acc dashboard, akan ke servlet 
                                   // Integer jsID = (Integer)request.getSession().getAttribute("adminID");
                                    
                                    int jsID = Integer.parseInt(request.getParameter("jsID"));
                                    String jobType ="";
                                    String jobTitle ="";
                                    String jobcatName ="";
                                    String jobInfo ="";
                                    String jobSalary ="";
                                    String jobDate = "";
                                    String jobStatus = "";
                                    String adminEmail ="";
                                        
                                    Class.forName("com.mysql.jdbc.Driver");

                                    String myUrl = "jdbc:mysql://localhost:3306/kbmc";
                                    String uname = "root";
                                    String pass = "";
                                    Connection myConnection = DriverManager.getConnection(myUrl,uname,pass);

                                    Statement myStatement = myConnection.createStatement();

                                    String myQuery = "select * from jobseeker";
                                    ResultSet myRs = myStatement.executeQuery(myQuery);
                                    
                                    
                                    out.print("<thead>");
                                    out.print("<tr class=\"align-self-center\">");
                                    out.print("<th>ID</th>");
                                    out.print("<th>Name</th>");
                                    out.print("<th>Email</th>");
                                    out.print("<th>Password</th>");
                                    out.print("<th>About</th>");
                                    out.print("<th>Address</th>");
                                    out.print("<th>DOB</th>");
                                    out.print("<th>City</th>");
                                    out.print("<th>Phone Number</th>");
                                    out.print("<th> CGPA </th>");
                                    out.print("<th> Qualification </th>");
                                    out.print("<th> Major </th>");
                                    out.println("<th>Action</th>");
                                    out.print("</tr>");
                                    out.print("</thead>");
                                    out.print("<tbody>");
                                    
                                    while (myRs.next()){
                                    out.println("<tr>");
                                    out.println("<td>" + myRs.getString(1) + "</td>");
                                    out.println("<td>" + myRs.getString(2) + "</td>");
                                    out.println("<td>" + myRs.getString(3) + "</td>");
                                    out.println("<td>" + myRs.getString(4) + "</td>");
                                    out.println("<td>" + myRs.getString(5) + "</td>");
                                    out.println("<td>" + myRs.getString(6) + "</td>");
                                    out.println("<td>" + myRs.getString(7) + "</td>");
                                    out.println("<td>" + myRs.getString(8) + "</td>");
                                    out.println("<td>" + myRs.getString(9) + "</td>");
                                    out.println("<td>" + myRs.getString(10) + "</td>");
                                    out.println("<td>" + myRs.getString(11) + "</td>");
                                    out.println("<td>" + myRs.getString(12) + "</td>");
                                    out.println("<td>" + myRs.getString(13) + "</td>");
                                    
                                    out.println("<td><a href=jProUpdate.jsp?jsID="
                                            + myRs.getString(1) + " style='text-decoration:none;'>Edit</a>"
                                            + "&nbsp;"
                                           // +"<i class='fa fa-pencil fa-fw' style='color:blueviolet'></i><a href=jobListDelete.jsp?jobID="
                                            //+myRs.getString(1) + " onclick=\"return confirm"
                                            //+"('Are you sure?')\"><i class='fa fa-trash-o fa-fw'  style='color:red' >Delete</a>"
                                            +"</td>");
                                    out.println("</tr>");
                                }
                                    out.println("</table>");
                                    /*out.println("<td><input type='button' value='Back' onclick='history.back();' "
                                            + "style='width:150px;background-color:#4CAF50;color:white;padding:14px 20px;"
                                            + "margin:8px 0;border:none;border-radius:4px;cursor:pointer;'/></td>");*/
                                    out.println("</div>");
                                    myConnection.close();
            %>
            
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
                <!--div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                    </ul>
                </div-->
            </div>
        </nav>
        <br>
        <div style="border: 4px solid #527a7a; font-family: century gothic">
            <div class="header">
                <h1><b>KBMC Hospital Job Vacancy</b></h1>
                <h3>KBMC || Jobseeker Registration</h3>
            </div>
            <br>
            <div>
                <fieldset >
                    <h2 style="text-align: center ; font-family: century gothic">Register Now!</h2>
                    <form action="FileUpload" method="POST">
                        <table>
                              <tr> <input style="margin-bottom: 5px" type="hidden" name="jsID" value="<%=jsID%>"></tr>

                           <tr>
                                <td style="text-align: left"><label >Full Name:</label></td>
                                <td><input style="margin-bottom: 5px" type="text" name="jsName" placeholder="Your full name" size="20" required style="width:390px;"/></td>
                            </tr>
                            <tr>
                                <td style="text-align: left"><label >Email:</label></td>
                                <td><input style="margin-bottom: 5px" type="text" name="jsEmail" size="20" required style="width:390px;"/></td>
                            </tr>
                            <tr>
                                <td style="text-align: left"><label>Password:</label></td>
                                <td><input style="margin-bottom: 5px" type="password" name="jsPass" id="jsPass" size="20" required style="width:390px;"/></td>
                            </tr>
                             <tr>
                                <td style="text-align: left"><label>About Yourself: </label></td>
                                <td><input style="margin-bottom: 5px" type="text" name="jsAbout" size="20" required style="width:390px;"></textarea></td>
                            </tr>
                            <tr>
                                <td style="text-align: left"><label>Address: </label></td>
                                <td><input style="margin-bottom: 5px" type="text" name="jsAddress" size="20" required style="width:390px;"></td>
                            </tr>
                             <tr>
                                <td style="text-align: left"><label>Date of Birth: </label></td>
                                <td><input style="margin-bottom: 5px" type="date" name="jsDOB" size="20"  required style="width:390px;"></td>
                            </tr>
                            <tr>
                                <td style="text-align: left"><label>City:</label></td>
                                <td><input style="margin-bottom: 5px" type="text" name="jsCity" size="20" placeholder="Kelantan" required style="width:390px;"></td>
                            </tr>
                            
                            <tr>
                                <td style="text-align: left"><label>Contact Number:</label></td>
                                <td><input style="margin-bottom: 5px" type="text" name="jsNo" size="20" placeholder="012-345678" required style="width:390px;"></td>
                            </tr>
                            <tr>
                                <td style="text-align: left"><label>CGPA:</label></td>
                                <td><input style="margin-bottom: 5px" type="text" name="jsCGPA" size="20" placeholder="4.0" required style="width:390px;"></td>
                            </tr>
                             <tr>
                                <td style="text-align: left"><label>Qualification: </label></td>
                                <td><input style="margin-bottom: 5px" type="text" name="jsQualification" size="20"  required style="width:390px;"></td>
                            </tr>
                            <tr>
                                <td style="text-align: left"><label>Major: </label></td>
                                <td><input style="margin-bottom: 5px" type="text" name="jsMajor" size="20"  required style="width:390px;"/></td>
                            </tr>
                            <tr>
                                <td style="text-align: left"><label>Resume File: </label></td>
                                <td><input style="margin-bottom: 5px" type="file" name="file" size="20"  required style="width:390px;"/></td>
                            </tr>
                           
                            
                        </table>
                        <br>
                        <p style='text-align: center'><input type="submit" style="text-align: center;"/>
                        <p style='text-align: center'>Already own an account? Login <a href="login.jsp">Here!</a></p>
                    </form>
                </fieldset>
                   <script language="javascript">
                var today = new Date();
                var dd = String(today.getDate()).padStart(2, '0');
                var mm = String(today.getMonth() + 1).padStart(2, '0');
                var yyyy = today.getFullYear();

                today = yyyy + '-' + mm + '-' + dd;
                $('#jsDOB').attr('min',today);
                    </script>
            </div>
        </div>
        <br>

        <footer class="container-fluid text-center">
            <p><b>KBMC Hospital Job Vacancy</b></p>
        </footer>
    </body>

</html>