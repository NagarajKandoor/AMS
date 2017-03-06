<%-- 
    Document   : depart-reg
    Created on : Mar 11, 2014, 7:44:10 PM
    Author     : nagaraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%@ page import="java.sql.*" %>
<%
HttpSession obj=request.getSession(false);

      String var_oldpwd,var_loginid;

        var_loginid=obj.getAttribute("session_loginid").toString();
        var_oldpwd=obj.getAttribute("session_pwd").toString();
%>

<%!
    Connection conn = null;
    PreparedStatement stmt_reg_insert = null;

    String dno;
    String dname;
    String hod;
    String password123;
    int count;
     int dno123=0;  
    String msg = "";

    void connect() {
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:db2://localhost:50000/AMS", "db2admin", "ngk555");
        } catch (Exception e) {
            msg = e.getMessage();
        }
    }
     public void auto_primary_key()
                       {
       try {
            stmt_reg_insert = conn.prepareStatement("select count(*),max(dno) from department");
            ResultSet rs = stmt_reg_insert.executeQuery();
            rs.next();count=rs.getInt(1);
            if(count==0){
                dno123=1;
            }
                       else{
                       dno123=rs.getInt(2);
                       dno123=dno123+1;
                       }
            
            rs.close();
            stmt_reg_insert.clearParameters();
            stmt_reg_insert.close();
            }

        catch (Exception ex) {
            msg ="Primary_key_exist"+ex.getMessage();
        }
        }
    public void fetch(HttpServletRequest request) {
        dno = request.getParameter("dno").trim();
        dname = request.getParameter("dname").trim();
        hod = request.getParameter("hod").trim();
        password123 = request.getParameter("pass").trim();
    }

    public void insert() {
        try {
            
            stmt_reg_insert = conn.prepareStatement("insert into department values(?,?,?,?)");
            stmt_reg_insert.setString(1, dno);
            stmt_reg_insert.setString(2, dname);
            stmt_reg_insert.setString(3, hod);
            stmt_reg_insert.setString(4,password123);
            

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
    else
    {
        connect();
        auto_primary_key();
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <titlE>DEPARTMENT</title>
    </head>
    <body bgcolor="#FFFFCC">
        <form  method="post" >
            <table width="98">
                <tr><td><img src="Images/854.gif" width="1348" height="146" /></td>
                </tr>
            </table>
            <p>&nbsp;</p>
            <marquee direction="right">**All Fields Are Compulsory**</marquee>
            <p>&nbsp;</p>
            <table border="1" align="center" bordercolor="blue">
                <td align="center" colspan="2">Department-Registration-Form</td>
                <tr>
                    <td>Department-No:*</td><td><input type="text" name="dno" id="dno" onkeypress="return  onlnum(event)" maxlength="2" min="1"
                                                       required="" placeholder="Enter DNO" value="<%=dno123%>" readonly=""/></td>
                </tr>
                <tr>
                    <td>Department-Name:*</td><td><input type="text" name="dname" id="dname" onkeypress="return onlchar(event)" maxlength="10" min="3"
                                                         required="" placeholder="Enter DName"/></td>
                </tr>
                <tr>
                    <td>HOD:*</td><td><input type="text" name="hod" id="hod" onkeypress=" return onlchar(event)" maxlength="10" min="3"
                                             required="" placeholder="Enter HOD"/></td>
                </tr>
                <tr>
                    <td>Password:*</td><td><input type="password" name="pass" id="pass" onkeypress=" return csnum(event)" maxlength="10" min="4" 
                                                  required="" placeholder="Enter Password"/></td>
                </tr>
                <tr><td colspan="2" align="center"><input type="submit" name="btnsub123" id="sub" /></td></tr>
            </table>
        </form>
                 <h1><a href="adminhome.jsp">Back</a></h1>
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

        </script>
    </body>
</html>
