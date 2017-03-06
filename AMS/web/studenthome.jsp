<%-- 
    Document   : studenthome
    Created on : Mar 11, 2014, 10:47:20 PM
    Author     : nagaraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


<%
HttpSession obj=request.getSession(false);

      String var_oldpwd,var_loginid;

        var_loginid=obj.getAttribute("session_loginid").toString();
        var_oldpwd=obj.getAttribute("session_pwd").toString();
        session.setMaxInactiveInterval(120);
       
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-Home</title>
        <link href="style.css" rel="stylesheet" type="text/css" media="screen" />

    </head>
    <body background="Images/145987.gif">
<table width="98">
    <tr><td><img src="Images/854.gif" width="1348" height="146" /></td>
</tr>
</table>
      <table align="center"><tr><td bgcolor="#CCFF66" width="165">Student-HOME-PAGE</td></tr></table>
      <table align="right"><tr><td><a href="logout.jsp" /><font size="6" style="background-color: yellow">Logout</font></td></table>
<p>&nbsp;</p>
<p>&nbsp;</p>

<div class="nav">
    <nav>
	<ul>
		<li>
                     <h2><a href="#">STUDENT<span class="caret"></span></a></h2>
				<ul>
                                    <li><a href="enrollcourse.jsp" />Enroll-Course</a></li>
                                    <li><a href="Event.jsp" />Register-Event</a></li>
                                    <li><a href="viewattendance.jsp" />View-Attendance</a></li>
                                    <li><a href="viewres.jsp" />View-Result</a></li>
                                    <li><a href="change_pwd.jsp" />Change-Password</a></li>
				</ul>
			
		</li>
	</ul>
</nav></div>
<!--<table width="200" height="200" align="left">
    <tr><td><a href="enrollcourse.jsp" />Enroll-Course</td></tr>
    <tr><td><a href="Event.jsp" />Register-event</td></tr>
    <tr><td><a href="viewattendance.jsp" />View-Attendance</td></tr>
    <tr><td><a href="viewres.jsp" />View-Result</td></tr>
    <tr><td><a href="change_pwd.jsp" />Change Password</td></tr>
</table>-->
   </form>
    </body>
</html>
