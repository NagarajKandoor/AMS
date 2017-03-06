<%-- 
    Document   : deletestudent
    Created on : May 2, 2014, 6:19:05 AM
    Author     : nagaraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="java.util.Vector"%>
<%@page import="java.io.*" %> 
<!DOCTYPE html>
<%
HttpSession obj=request.getSession(false);

      String var_oldpwd,var_loginid;

        var_loginid=obj.getAttribute("session_loginid").toString();
        var_oldpwd=obj.getAttribute("session_pwd").toString();
%>
<%!
//Fetch parameter coming from previous page 
    String var_categoryid="";
    String msg="";
    
    
    Connection conn=null;
    PreparedStatement stmt=null;
    PrintWriter pw;
    String usn;
    ResultSet rs;
    
    
      void connect() {
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:db2://localhost:50000/AMS", "db2admin", "ngk555");
        } catch (Exception e) {
            msg = e.getMessage();
        }
    }
    public void fetch(HttpServletRequest request)
    {
        try{
    var_categoryid=request.getParameter("usn");
    
   
    stmt = conn.prepareStatement("delete from student where usn=?");
            stmt.setString(1,var_categoryid);
          int i= stmt.executeUpdate();
            stmt.clearParameters();
            stmt.close();
            msg="Record deleted successfully";
            if(i==0)
            {
                msg="record not found";
            }
      }
        catch(Exception ex){
            msg="Record Not found";
        }
                       }
    
    public void close()
                       {
        try{
            conn.close();
                       }
        catch(Exception e){
            msg=e.getMessage();
        }
                
        }
%>

<%
    if(request.getParameter("btnsub")!=null){
connect();
fetch(request);
close();
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete-department</title>
        <link rel="stylesheet" href="runnable.css" />
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
         <form action="deletestudent.jsp" method="post" >
            <table width="98">
                <tr><td><img src="Images/854.gif" width="1348" height="146" /></td>
                </tr>
            </table>
            <p>&nbsp;</p>
            <marquee direction="right">**All Fields Are Compulsory**</marquee>
            <p>&nbsp;</p>
            <table border="1" align="center" bordercolor="blue">
                <tr>   <td align="center" colspan="4">Delete-Student</td></tr>
                <tr>
                    <td>USN:*</td><td><input name="usn"  maxlength="10" min="10" required="" placeholder="Enter USN" 
                                             onkeypress="return onlcn(event)"/></td>
                </tr>
                <tr><td colspan="2" align="center"><input type="submit" name="btnsub" /></td></tr>
            </table>
     </form>
          <h1><a href="adminhome.jsp">Back</a></h1>
          <script>
                   <%    if(request.getParameter("btnsub")!=null) {%>
  alert("<%=msg%>");
         <%   }   %>

                 
                 
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
    window.alert("Enter vaild no");
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
         window.alert(" special charcater not allowed");
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
         window.alert("Enter only Numbers");
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
         window.alert("Enter only charecters");
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
         window.alert(" special charcater not allowed");
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
