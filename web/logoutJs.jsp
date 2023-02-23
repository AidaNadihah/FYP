<%-- 
    Document   : logoutJs
    Created on : Jun 25, 2022, 12:53:10 AM
    Author     : USER
--%>

<%
    session.invalidate(); //session destroy
    response.sendRedirect("jsLogin.jsp"); //after destroy redirect to index.jsp page
%>
