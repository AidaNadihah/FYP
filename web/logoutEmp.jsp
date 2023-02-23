<%-- 
    Document   : logoutEmp
    Created on : May 26, 2022, 5:28:59 AM
    Author     : USER
--%>

<%
    session.invalidate(); //session destroy
    response.sendRedirect("empLogin.jsp"); //after destroy redirect to index.jsp page
%>