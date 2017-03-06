<%-- 
    Document   : attendence
    Created on : Apr 22, 2014, 11:13:40 AM
    Author     : nagaraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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

    String usn;
    String fid;
    String cid;
    String date;
    String total_class;
    String attended_class;
   
    
    
       

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
        fid = request.getParameter("fid").trim();
        cid = request.getParameter("cid").trim();
        date = request.getParameter("date").trim();
        total_class = request.getParameter("total_class").trim();
        attended_class= request.getParameter("attended_class").trim();
        
        
        
    }

    public void insert() {
        try {
            
            stmt_reg_insert = conn.prepareStatement("insert into attedence values(?,?,?,?,?,?)");
            stmt_reg_insert.setString(1,usn);
            stmt_reg_insert.setString(2,fid);
            stmt_reg_insert.setString(3,cid);
            stmt_reg_insert.setString(4,date);
            stmt_reg_insert.setString(5,total_class);
            stmt_reg_insert.setString(6,attended_class);
            
            

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
        <title>ATTEDANCE</title>
         <!-- Load jQuery from Google's CDN -->
    <!-- Load jQuery UI CSS  -->
    <link rel="stylesheet" href="jquery-ui.css" />
    
    <!-- Load jQuery JS -->
    <script src="jquery-1.9.1.js"></script>
    <!-- Load jQuery UI Main JS  -->
    <script src="jquery-ui.js"></script>
    
    <!-- Load SCRIPT.JS which will create datepicker for input field  -->
    <script src="script.js"></script>
    
    <link rel="stylesheet" href="runnable.css" />
    </head>
    <body bgcolor="#FFFFCC">
        <form action="" method="post">
            <table width="98">
                <tr><td><img src="Images/854.gif" width="1348" height="146" /></td>
                </tr>
            </table>
            <p>&nbsp;</p>
            <marquee direction="right">**All Fields Are Compulsory**</marquee>
            <p>&nbsp;</p>
            <table border="1" align="center" bordercolor="blue">
                <td align="center" colspan="4">Attendance</td>
                <tr>
                    <td>USN:*</td><td><input type="text" name="usn"onkeypress=" return onlcn(event)" maxlength="10" min="6"
                                             required="" placeholder="Enter USN"/></td>
                </tr>
                <tr><td>Date:*</td><td><input type="text" id="datepicker"   name="date"/></td></tr>
                <tr>
                    <td>Total-Class:*</td><td><input type="text" name="total_class" onkeypress=" return onlnum(event)"maxlength="2" min="1"
                                                     required="" placeholder="Enter Total-Class"/></td>
                </tr>
                 <tr>
                     <td>Attended-Class:*</td><td><input type="text" name="attended_class"onkeypress="return onlnum(event)" maxlength="2" min="1"
                                                         required="" placeholder="Enter Attended-Class"/></td>
                </tr>
                <tr>
                    <td>F-Id:*</td><td><input type="text" name="fid"onkeypress="return onlcn(event)" maxlength="6" min="3"
                                              required="" placeholder="Enter-FID"/></td>
                </tr>
                <tr>
                    <td>C-ID:*</td><td><input type="text" name="cid"onkeypress="return onlcn(event)"maxlength="6" min="3"
                                              required="" placeholder="Enter C-ID"/></td>
                </tr>
                 <tr><td colspan="2" align="center"><input type="submit" name="btnsub123" /></td></tr>
            </table>
       </form>
        <h1><a href="facultyhome.jsp">Back</a></h1>
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
    if( ((k > 64 && k < 91) || k===9 || (k > 96 && k < 123) || k===44 || k===46 || k === 8 || k === 32 || (k >= 48 && k <= 57)))
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
    if( ((k > 64 && k < 91) || k===9 || (k > 96 && k < 123) || k === 8 || k === 32 || (k >= 48 && k <= 57)))
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
 <script>
            /*  jQuery ready function. Specify a function to execute when the DOM is fully loaded.  */
$(document).ready(
  
  /* This is the function that will get executed after the DOM is fully loaded */
  function () {
    $( "#datepicker" ).datepicker({
      changeMonth: true,//this option for allowing user to select month
      changeYear: true //this option for allowing user to select from year range
    });
  }

);
        </script>
    </body>
</html>
