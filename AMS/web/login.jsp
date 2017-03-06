<%-- +
    Document   : login
    Created on : Mar 11, 2014, 7:43:38 PM
    Author     : nagaraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<%!
    Connection conn = null;
    PreparedStatement stmt = null;
    String msg = "", name, cpassword, cloginid, ccpassword;
    String var_loginid, var_oldpwd;

    void connect() {
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:db2://localhost:50000/AMS", "db2admin", "ngk555");
        } catch (Exception e) {
            msg = e.getMessage();
        }
    }

    public void input(HttpServletRequest request) {

        name = request.getParameter("txtname");
        cpassword = request.getParameter("txtpwd");
        HttpSession obj = request.getSession(true);
        obj.setAttribute("session_loginid", name);
        obj.setAttribute("session_pwd", cpassword);
    }

    public void fetch() {
        try {
            stmt = conn.prepareStatement("select usn,password from student where usn=? and password=?");
            stmt.setString(1, name);
            stmt.setString(2, cpassword);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            cloginid = rs.getString("usn");
            ccpassword = rs.getString("password");
            rs.close();
            stmt.clearParameters();
            stmt.close();
            conn.close();

        } catch (Exception ex) {
            msg = ex.getMessage();
        }

    }


%>

<%
    if (request.getParameter("sub") != null) {
        connect();
        input(request);
        fetch();

        if (name.equalsIgnoreCase(cloginid)) {
            if (cpassword.equals(ccpassword)) {

                response.sendRedirect("studenthome.jsp");

            }
        } else {
            msg = "User name and password combination does not match";
        }
    }
%>




<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body bgcolor="#FFFFCC">
        <form action="login.jsp" method="post">
            <table width="98">
                <tr><td><img src="Images/854.gif" width="1348" height="146" /></td>
                </tr>
            </table>
            <p>&nbsp;</p>
            <marquee direction="right">**All Fields Are Compulsory**</marquee>
            <p>&nbsp;</p>

            <table align="center" border="1"bordercolor="blue">
                <tr>
                    <td>User-ID</td><td><input type="text" name="txtname" maxlength="10" min="3"required="" placeholder="Enter User-ID" /></td>
                </tr><br />
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txtpwd"  maxlength="10" min="4"required="" placeholder="Enter Password"/></td>
                </tr>
                <tr><td colspan="2" align="center"><input type="submit" name="sub" /></td></tr>
            </table>
            <p>&nbsp;</p>
            <p>&nbsp;</p>

            <table align="center"><tr><td><a href="Reg.jsp">Registration</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr></table>
        </form>
        <h1><a href="HomePage.jsp">Back</a></h1>

        <script>


            <%if (request.getParameter("sub") != null) {%>
            alert("<%=msg%>");
            <%}%>
        </script>
        <script type="text/javascript">
            function bsnum(e) {
                var k;
                document.all ? k = e.keyCode : k = e.which;

                if (k === 8 || k === 32 || k === 9 || (k >= 48 && k <= 57))
                {
                    return true;
                }
                else
                {
                    alert("Enter vaild no");
                    return false;
                }
            }
            function csnum(e) {
                var k;
                document.all ? k = e.keyCode : k = e.which;
                if (((k > 64 && k < 91) || (k > 96 && k < 123) || k === 44 || k === 46 || k === 9 || k === 8 || k === 32 || (k >= 48 && k <= 57)))
                {
                    return true;
                }
                else
                {
                    alert(" special charcater not allowed");
                    return false;

                }
            }


            function onlnum(e) {
                var k;
                document.all ? k = e.keyCode : k = e.which;
                if (k >= 48 && k <= 57)
                {
                    return true;
                }
                else
                {
                    alert("Enter only Numbers");
                    return false;

                }
            }
            function onlchar(e) {
                var k;
                document.all ? k = e.keyCode : k = e.which;
                if (k >= 65 && k <= 90 || k > 96 && k < 123)
                {
                    return true;
                }
                else
                {
                    alert("Enter only charecters");
                    return false;

                }
            }

        </script>
    </body>
</html>
