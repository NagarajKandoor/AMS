<%-- 
    Document   : facevent
    Created on : May 6, 2014, 11:42:42 PM
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

    String eno;
    String edate;
    String eocc;
    String guest;
    String eco;
    String eex;
    String usn;
    String fid;
     int count;
     int eno123;

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
            stmt_reg_insert = conn.prepareStatement("select count(*),max(eno) from event");
            ResultSet rs = stmt_reg_insert.executeQuery();
            rs.next();count=rs.getInt(1);
            if(count==0){
                eno123=1;
            }
                       else{
                       eno123=rs.getInt(2);
                       eno123=eno123+1;
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
        eno = request.getParameter("eno").trim();
        edate = (request.getParameter("edate"));
        eocc = request.getParameter("eocc").trim();
        guest = request.getParameter("guest").trim();
        eco = request.getParameter("eco").trim();
        eex = request.getParameter("eex").trim();
        usn=request.getParameter("usn").trim();
        fid=request.getParameter("fid").trim();
    }

    public void insert() {
        try {
            
            stmt_reg_insert = conn.prepareStatement("insert into event values(?,?,?,?,?,?,?,?)");
            stmt_reg_insert.setString(1,eno);
            stmt_reg_insert.setString(2,usn);
            stmt_reg_insert.setString(3,fid);
            stmt_reg_insert.setString(4,eocc);
            stmt_reg_insert.setString(5,eco);
            stmt_reg_insert.setString(6,edate);
             stmt_reg_insert.setString(7,guest);
              stmt_reg_insert.setString(8,eex);
            

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
        auto_primary_key();
        fetch(request);
        insert();
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EVENT</title>
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
        <form action="facevent.jsp" method="post" name="thisform">
            <table width="98">
                <tr><td><img src="Images/854.gif" width="1348" height="146" /></td>
                </tr>
            </table>
            <p>&nbsp;</p>
            <marquee direction="right">**All Fields Are Compulsory**</marquee>
            <p>&nbsp;</p>
            <table border="1" align="center" bordercolor="blue">
                <td align="center" colspan="4">EVENTS-REGISTRATION</td>
                <tr>
                    <td>Event-No:*</td><td><input type="text" name="eno" required="" placeholder="EVENT-NO" onkeypress="return alpha(event)" maxlength="3"
                                                  min="1" value="<%=eno123%>" readonly=""/></td>
                </tr>
                 <tr>
                    <td>USN:*</td><td><input type="text" name="usn" required="" placeholder="Enter USN" maxlength="10" min="10" onkeypress="return alpha123(event)" /></td>
                </tr>
                <tr>
                    <td>F-Id:*</td><td><input type="text" name="fid" required="" placeholder="Enter FID" maxlength="5" min="1" onkeypress="return alpha123(event)" /></td>
                </tr>
                <tr><td>Date:*</td><td><input type="text" id="datepicker" name="edate" onselect="return des(event)" required="" placeholder="Enter Date"/></td></tr>
                <tr>
                    <td>Occasion:*</td><td><input type="text" name="eocc" required="" placeholder="OCCASION" onkeypress="return alpha123(event)"/></td>
                </tr>
                <tr>
                    <td>NO-of-Days:*</td><td><input type="text" name="guest" required="" placeholder="No-Of-Day" maxlength="2" min="1" onkeypress="return onlnum(event)" /></td>
                </tr>
                <tr>
                    <td>Co-ordinator:*</td><td><textarea name="eco" rows="5" cols="16" required="" placeholder="CO-Ordinator" onkeypress="return alpha123(event)" >
                        </textarea></td>  </tr>
                <tr><td>Expense(Rs):*</td><td><input type="text" name="eex" required="" placeholder="Expense" onkeypress="return onlnum(event)" maxlength="5" min="3"/></td></tr>
                 <tr><td colspan="2" align="center"><input type="submit" name="btnsub123" /></td></tr>
            </table>

        </form>
        
        <script>
            <%if (request.getParameter("btnsub123") != null) {%>
                alert("<%=msg%>");
            <%}%>
        </script>
        <script type="text/javascript">
            function alpha(e) {
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
 function alpha123(e) {
    var k;
    document.all ? k = e.keyCode : k = e.which;
    if( ((k > 64 && k < 91) || (k > 96 && k < 123) || k===9 || k===44 || k===46 || k === 8 || k === 32 || (k >= 48 && k <= 57)))
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
