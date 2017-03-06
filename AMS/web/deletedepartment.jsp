<%-- 
    Document   : deletedepaetment
    Created on : Apr 30, 2014, 11:12:14 PM
    Author     : nagaraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="java.util.Vector"%>
<%@page import="java.io.*" %>
<%
HttpSession obj=request.getSession(false);

      String var_oldpwd,var_loginid;

        var_loginid=obj.getAttribute("session_loginid").toString();
        var_oldpwd=obj.getAttribute("session_pwd").toString();
%>
<!DOCTYPE html>

<%!
//Fetch parameter coming from previous page 
    String var_categoryid="";
    String msg="";
    
    
    Connection conn=null;
    PreparedStatement stmt = null;
    PrintWriter pw;
    String dno=null;
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
    var_categoryid=request.getParameter("dno");
    
   
    stmt = conn.prepareStatement("delete from department where dno=?");
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
    </head>
     <body bgcolor="#FFFFCC">
       <form action="deletedepartment.jsp" method="post" >
            <table width="98">
                <tr><td><img src="Images/854.gif" width="1348" height="146" /></td>
                </tr>
            </table>
            <p>&nbsp;</p>
            <marquee direction="right">**All Fields Are Compulsory**</marquee>
            <p>&nbsp;</p>
            <table border="1" align="center" bordercolor="blue">
                <tr>   <td align="center" colspan="4">Department</td></tr>
                <tr>
                    <td>Dno:*</td><td><input type="text" name="dno"  maxlength="6" min="1" required="" placeholder="Enter Dno" 
                                             onkeypress="return onlnum(event)"/></td>
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
function disable(e)
{
    e.getElementbyId("dno").disabled = true;
}
</script>
     </body>
</html>
