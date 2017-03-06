<%-- 
    Document   : viewattendance
    Created on : Apr 25, 2014, 11:42:46 PM
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
<%@page import="java.util.Vector"%>

<!DOCTYPE html>

<%!
//Fetch parameter coming from previous page 
    String var_categoryid="";
    String msg="";
    
    
    Connection conn=null;
    PreparedStatement stmt = null;
    String cid="";
    Vector vec_usn=new Vector();
    Vector vec_fid=new Vector();
    Vector vec_cid=new Vector();
    Vector vec_date=new Vector();
    Vector vec_total_class=new Vector();
    Vector vec_attended_class=new Vector();   
   
    
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
        cid=request.getParameter("cid");
    stmt = conn.prepareStatement("select usn,fid,cid,date,total_class,attended_class from attedence where usn=? and cid=?");
            stmt.setString(1,var_categoryid);
            stmt.setString(2,cid);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
              
            vec_usn.add(rs.getString("usn"));
            vec_fid.add(rs.getString("fid"));
            vec_cid.add(rs.getString("cid"));
            vec_date.add(rs.getString("date"));
            vec_total_class.add(rs.getString("total_class"));
            vec_attended_class.add(rs.getString("attended_class"));            
            }
                
            
            rs.close();
            stmt.clearParameters();
            stmt.close();
            msg="Data retrieved successfully";

            if(vec_usn.isEmpty() && vec_cid.isEmpty()){
            msg="Not found";
            }
    
    
       }
        catch(Exception e){
            msg=e.getMessage();
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
    if(request.getParameter("btnsub123")!=null){
connect();
fetch(request);
close();
    }
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View-Attendance</title>
    </head>
     <body bgcolor="#FFFFCC">
         <form action="viewattendance.jsp" method="post">
            <table width="98">
                <tr><td><img src="Images/854.gif" width="1348" height="146" /></td>
                </tr>
            </table>
            <p>&nbsp;</p>
            <marquee direction="right">**All Fields Are Compulsory**</marquee>
            <p>&nbsp;</p>
            <table border="1" align="center" bordercolor="blue">
                <td align="center" colspan="4">View-Attendance</td>
                <tr>
                    <td>C-Id:*</td><td><input type="text" name="cid" required="" placeholder="Enter CourseID" onkeypress=" return onlcn(event)" maxlength="5" min="2"
                                              required="" placeholder="Enter CID"/></td>
                </tr>
                <tr><td>USN:*</td><td><input type="text" onclick="" name="usn" required="" placeholder="Enter USN" min="10" maxlength="10" onkeypress=" return onlcn(event)" maxlength="10" min="10"
                                             required="" placeholder="Enter USN"/></td></tr>
                 <tr><td colspan="2" align="center"><input type="submit" name="btnsub123" /></td></tr>
            </table>
            <%if (request.getParameter("btnsub123") != null) {%>
            
 <table border="1" align="center" bordercolor="bule">


        <tr>
            <td>USN</td>
            <td>fid</td>
            <td>C-Id</td>
            <td>date</td>
            <td>total_class</td>
            <td>attended class</td>
        </tr>
        <%
        for(int i=0;i<vec_usn.size();i++){
        %>
            
    <tr>

    <td><%=vec_usn.get(i)%></td>
    <td><%=vec_fid.get(i)%></td>
    <td><%=vec_cid.get(i)%></td>
    <td><%=vec_date.get(i)%></td>
    <td><%=vec_total_class.get(i)%></td>
    <td><%=vec_attended_class.get(i)%></td>
    </tr>
    <% }

            vec_usn.clear();
            vec_fid.clear();
            vec_cid.clear();
            vec_date.clear();
            vec_total_class.clear();
            vec_attended_class.clear();
            
        %>
  </table>
        <%}%>
       </form>
       <h1><a href="studenthome.jsp">Back</a></h1>
  <script>
                   <%    if(request.getParameter("btnsub123")!=null) {%>
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
    if( ((k > 64 && k < 91) || (k > 96 && k < 123) || k===44 || k===46  || k===9 || k === 32 || (k >= 48 && k <= 57)))
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
