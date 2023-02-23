<%-- 
    Document   : viewMesgUpPro
    Created on : Jun 21, 2022, 4:26:28 PM
    Author     : USER
--%>


<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN || KBMC </title>
    </head>
    <body>
        <%
            int userID = Integer.parseInt(request.getParameter("userID"));
            //Integer empID = (Integer) request.getSession().getAttribute("empID");
            String userEmail = request.getParameter("userEmail");
            String userName = request.getParameter("userName");
            String userSubject = request.getParameter("userSubject");
            String userMessage = request.getParameter("userMessage");
           
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String myUrl = "jdbc:mySql://localhost:3306/kbmc";
            String uname="root";
            String pass="";
            Connection myConnection = DriverManager.getConnection(myUrl,uname,pass);

            String myQuery = "update message "
                     + "set userEmail=?, userName=?, userSubject=?, userMessage=?"
                     + "where userID=?";          

            PreparedStatement myPs = myConnection.prepareStatement(myQuery);
            
            myPs.setString(1, userEmail);
            myPs.setString(2, userName);
            myPs.setString(3, userSubject);
            myPs.setString(4, userMessage);
            myPs.setInt(5, userID);
            
            
            if(myPs.executeUpdate()!=0){
                out.println("<script type=\text/javascript\">");
                out.println("alert(\"Employer list successfully update\")");
                out.println("</script>");
                
                RequestDispatcher rd = request.getRequestDispatcher("viewMesg.jsp");
                rd.include(request, response);
            }
            myConnection.close();
        %> 
    </body>
        <script src="https://smtpjs.com/v3/smtp.js"></script>
    <script>
        var btn = document.getElementById('btn');
        btn.addEventListener('click', function (e) {
            e.preventDefault()

            var email = document.getElementById('email').value;
            var subject = document.getElementById('subject').value;
            var message = document.getElementById('message').value;
            var toemail = document.getElementById('emel').value;
            var body = 'Perkara: ' + subject + '<br/> Mesej: ' + message;
            Email.send({
                Host: "smtp.elasticemail.com",
                Username: "ikarikinaro@gmail.com",
                Password: "AD0020EA32AB8BD3EBDEEAF630867FBD66AA",
                To: toemail,
                From: email,
                Subject: subject,
                Body: body
            }).then(
                    message => alert("Emel berjaya dihantar!")
            );
        })
    </script>
</html>

