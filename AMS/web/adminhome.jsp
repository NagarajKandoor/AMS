<%-- 
    Document   : adminhome
    Created on : Mar 11, 2014, 10:46:46 PM
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
      <table align="center"><tr><td bgcolor="#CCFF66" width="165">ADMIN-HOME-PAGE</td></tr></table>
      <table align="right"><tr><td><a href="logout.jsp" /><font size="6" style="background-color: yellow">Logout</font></td></table>
<p>&nbsp;</p>
<p>&nbsp;</p>




<div class="nav">

<nav>
	<ul>
		<li>
                    <h2><a href="#">Register <span class="caret"></span></a></h2>
			
				<ul>
					<li><a href="depart-reg.jsp"/>Register-Department</a></li>
                                        <li><a href="exam.jsp" />Exam</a></li>
					<li><a href="result.jsp" />Result</a></li>
                                        <li><a href="faculty-reg.jsp" />Faculty-Register</a></li>
                                        <li><a href="course.jsp" />Course</a></li>
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
                                    <li><a href="update-dept.jsp" />Update-Department</a></li>
                                 <!--   <li><a href="update-res.jsp" />Update-Result</a></li>-->
                                    <li><a href="update-course.jsp" />Update-Course</a></li>
				</ul>
			
		</li>
	</ul>
</nav></div>
<div class="nav">
    <nav>
	<ul>
		<li>
                    <h2><a href="#">Delete<span class="caret"></span></a></h2>
			
				<ul>
                                    <li><a href="deletedepartment.jsp"/>Delete-Department</a></li>
                                    <li><a href="deleteexam.jsp"/>Delete-Exam</a></li>
                                    <li><a href="deleteresult.jsp"/>Delete-Result</a></li>
                                    <li><a href="delevent.jsp"/>Delete-Event</a></li>
                                    <li><a href="deletestudent.jsp"/>Delete-Student</a></li>
                                    <li><a href="deletefaculty.jsp"/>Delete-Faculty</a></li>
                                    <li><a href="deletecourse.jsp"/>Delete-Course</a></li>
				</ul>
			
		</li>
	</ul>
</nav></div>
      

   
    </body>
</html>
