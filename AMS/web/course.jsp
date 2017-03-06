<%-- 
    Document   : course
    Created on : Apr 22, 2014, 11:18:37 AM
    Author     : nagaraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import="java.sql.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.*"%>
<%
HttpSession obj=request.getSession(false);

      String var_oldpwd,var_loginid;

        var_loginid=obj.getAttribute("session_loginid").toString();
        var_oldpwd=obj.getAttribute("session_pwd").toString();
%>

<%!
    Connection conn = null;
    PreparedStatement stmt_reg_insert = null;

    String cid;
    String cname;
    String sem;
    String fid;
    String dno;
    int count=000,cid123;
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
            stmt_reg_insert = conn.prepareStatement("select count(*),max(dno) from course");
            ResultSet rs = stmt_reg_insert.executeQuery();
            rs.next();count=rs.getInt(1);
            if(count==0){
                cid123=1;
            }
                       else{
                       cid123=rs.getInt(2);
                       cid123=cid123+1;
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
        cid = request.getParameter("cid").trim();
        cname =request.getParameter("cname").trim();
        sem = request.getParameter("sem").trim();
        fid= request.getParameter("fid").trim();
        dno = request.getParameter("dno").trim();
        
    }

    public void insert() {
        try {
            
            stmt_reg_insert = conn.prepareStatement("insert into course values(?,?,?,?,?)");
            stmt_reg_insert.setString(1,cid);
            stmt_reg_insert.setString(2,cname);
            stmt_reg_insert.setString(3,sem);
            stmt_reg_insert.setString(4,fid);
            stmt_reg_insert.setString(5,dno);
            

            stmt_reg_insert.executeUpdate();
         //   stmt_reg_insert.executeQuery();
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
        <title>COURSE</title>
    </head>
    <body bgcolor="#FFFFCC">
        <form action="course.jsp" method="post" >
            <table width="98">
                <tr><td><img src="Images/854.gif" width="1348" height="146" /></td>
                </tr>
            </table>
            <p>&nbsp;</p>
            <marquee direction="right">**All Fields Are Compulsory**</marquee>
            <p>&nbsp;</p>
            <table border="1" align="center" bordercolor="blue">
                <td align="center" colspan="4">Course</td>
                <tr>
                    <td>C-Id:*</td><td><input type="text" name="cid"onkeypress=" return onlcn(event)"maxlength="10" min="1"
                                              required="" placeholder="Enter CID" value="<%=cid123%>"/></td>
                </tr>
                <tr><td>Name:*</td><td><input type="text" onclick="" name="cname"onkeypress="return onlchar(event)" maxlength="15" min="3"
                                              required="" placeholder="Enter C-Name"/></td></tr>
                <tr>
                    <td>Sem:*</td><td><input type="text" name="sem" onkeypress="return onlchar(event)" maxlength="2" min="2"
                                             required="" placeholder="Enter SEM"/></td>
                </tr>
                 <tr>
                     <td>F-Id:*</td><td><input type="text" name="fid"onkeypress="return onlcn(event)"maxlength="6" min="3"
                                               required="" placeholder="Enter FID"/></td>
                </tr>
                <tr>
                    <td>Dno:*</td><td><input type="text" name="dno"onkeypress="return onlnum(event)"maxlength="3" min="1"
                                             required="" placeholder="Enter DNO"/></td>
                </tr>
                 <tr><td colspan="2" align="center"><input type="submit" name="btnsub123" /></td></tr>
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
    if( ((k > 64 && k < 91) || (k > 96 && k < 123) || k===44 || k===46 || k===9 || k === 8 || k === 32 || (k >= 48 && k <= 57)))
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
    if( ((k > 64 && k < 91) || (k > 96 && k < 123) || k === 8 || k === 32 || k===9 || (k >= 48 && k <= 57)))
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
