<%-- 
    Document   : enrollcourse
    Created on : Apr 25, 2014, 11:40:13 PM
    Author     : nagaraj
--%>

<%
HttpSession obj=request.getSession(false);

      String var_oldpwd,var_loginid;

        var_loginid=obj.getAttribute("session_loginid").toString();
        var_oldpwd=obj.getAttribute("session_pwd").toString();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import="java.sql.*"%>
<%@ page import="java.sql.*" %>

<%!
    Connection conn = null;
    PreparedStatement stmt_reg_insert = null;

    String usn;
    String cid;
    String cname;
    
    
       

    String msg = "";

    void connect() {
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:db2://localhost:50000/AMS", "db2admin", "ngk555");
        } catch (Exception e) {
            msg = e.getMessage();
        }
    }
    

    public void fetch(HttpServletRequest request) {
        usn = request.getParameter("usn").trim();
        cid = request.getParameter("cid").trim();
        cname = request.getParameter("cname").trim();
        
        
    }

    public void insert() {
        try {
            
            stmt_reg_insert = conn.prepareStatement("insert into enroll values(?,?,?)");
            stmt_reg_insert.setString(1,usn);
            stmt_reg_insert.setString(2,cid);
            stmt_reg_insert.setString(3,cname);
            
            

            stmt_reg_insert.executeUpdate();

            stmt_reg_insert.clearParameters();
            stmt_reg_insert.close();
            msg = "Your Registration Done";
            conn.close();

        } catch (Exception ex) {

            msg = ex.getMessage();
        }

    }


%>

<%
    if (request.getParameter("btnsub123") != null) {
        connect();
        fetch(request);
        insert();
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ENROLL</title>
    </head>
         <body bgcolor="#FFFFCC">
       <form action="" method="post">
            <table width="98">
                <tr><td><img src="Images/854.gif" width="1348" height="146" /></td>
                </tr>
            </table>
            <p>&nbsp;</p>
           
            <p>&nbsp;</p>
            <table border="1" align="center" bordercolor="blue">
                <td align="center" colspan="4">Course</td>
                <tr>
                    <td>c_Id:*</td><td><input type="text" name="cid" onkeypress=" return onlcn(event)" maxlength="10" min="1"
                                              required="" placeholder="Enter CID"/></td>
                </tr>
                <tr><td>USN:*</td><td><input type="text" onclick="" name="usn" onkeypress=" return onlcn(event)" maxlength="10" min="10"
                                             required="" placeholder="Enter USN"/></td></tr>
                <tr>
                    <td>C-Name:*</td><td><input type="text" name="cname" onkeypress=" return onlchar(event)" maxlength="10" min="3"
                                                required="" placeholder="Enter C-Name"/></td>
                </tr>
                 
                 <tr><td colspan="2" align="center"><input type="submit" name="btnsub123" /></td></tr>
            </table>
       </form>
             <h1><a href="studenthome.jsp">Back</a></h1>
         <script>
            <%if(request.getParameter("btnsub123")!=null){%>
                alert("<%=msg%>");
                <%}%>
        </script>
         <script type="text/javascript">
            function bsnum(e) {
    var k;
    document.all ? k = e.keyCode : k = e.which;
    
    if( k === 8 || k === 32 || k===9 || (k >= 48 && k <= 57))
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
    if( ((k > 64 && k < 91) || (k > 96 && k < 123) || k===44 || k===9 || k===46 || k === 8 || k === 32 || (k >= 48 && k <= 57)))
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
    if( k >= 48 && k <= 57)
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
    if( k >= 65 && k <= 90 || k > 96 && k < 123)
    {
        return true;
    }
    else
    {
         alert("Enter only charecters");
    return false;
        
    }
}
function onlcn(e) {
    var k;
    document.all ? k = e.keyCode : k = e.which;
    if( ((k > 64 && k < 91) || (k > 96 && k < 123) || k === 8 || k===9 || k === 32 || (k >= 48 && k <= 57)))
    {
        return true;
    }
    else
    {
         alert(" special charcater not allowed");
    return false;
        
    }
}

        </script>
    </body>
    
</html>
