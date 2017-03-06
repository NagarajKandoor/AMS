<%-- 
    Document   : facultyhome
    Created on : Mar 11, 2014, 10:47:06 PM
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
        <title>Faculty-Home</title>
        <link href="style.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <body background="Images/145987.gif">
   <form action="">
<table width="98">
    <tr><td><img src="Images/854.gif" width="1348" height="146" /></td>
</tr>
</table>
      <table align="center"><tr><td bgcolor="#CCFF66" width="175">FACULTY-HOME-PAGE</td></tr></table>
      <table align="right"><tr><td><a href="logout.jsp" /><font size="6" style="background-color: yellow">Logout</font></td></table>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div class="nav">

<nav>
	<ul>
		<li>
                    <h2><a href="#">Faculty<span class="caret"></span></a></h2>
			
				<ul>
                                    <li><a href="attendence.jsp"/>Enter-Attendance</a></li>
                                    <li><a href="facevent.jsp" />Register-Event</a></li>
					
				</ul>
		
		</li>
	</ul>
</nav></div>
<div class="nav">
    <nav>
	<ul>
		<li>
                    <h2><a href="#">Update<span class="caret"></span></a></h2>
			
				<ul>
                                    <li><a href="update-atten.jsp" />Update-Attendance</a></li>
                                    
				</ul>
			
		</li>
	</ul>
</nav></div>
   </form>
        
    </body>
</html>
