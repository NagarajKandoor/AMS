<%-- 
    Document   : logout
    Created on : May 6, 2014, 2:29:21 AM
    Author     : nagaraj
--%>

<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    try
    {
    HttpSession obj=request.getSession(false);
    //obj.invalidate();
    session.invalidate();
   
       response.sendRedirect("HomePage.jsp");
       session.setAttribute("loginid", null);
    }    
 
catch (Exception ee)
 {
 out.println("Session Expried"+ee);
 
 }
       
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>logout</title>
    </head>
    <body>
        <form method="POST" action="logout.jsp">
            
        </form>

    </body>
</html>
