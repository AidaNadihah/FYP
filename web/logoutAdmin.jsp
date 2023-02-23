<%-- 
    Document   : logoutAdmin
    Created on : May 26, 2022, 3:43:05 AM
    Author     : USER
--%>
<%
    session.invalidate(); //session destroy
    response.sendRedirect("adminLogin.jsp"); //after destroy redirect to index.jsp page
%>
