<%-- 
    Document   : viewres
    Created on : Apr 25, 2014, 11:42:29 PM
    Author     : nagaraj
--%>


<%-- 
    Document   : books1
    Created on : Apr 23, 2013, 10:36:49 PM
    Author     : sudhir
--%>
<%
HttpSession obj=request.getSession(false);

      String var_oldpwd,var_loginid;

        var_loginid=obj.getAttribute("session_loginid").toString();
        var_oldpwd=obj.getAttribute("session_pwd").toString();
%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%!
//Fetch parameter coming from previous page 
    String var_con="";
    String msg="";
    
    
    Connection conn=null;
    PreparedStatement stmt = null;
    
    Vector vec_usn=new Vector();
    Vector vec_edate=new Vector();
    Vector vec_cid=new Vector();
    Vector vec_sem=new Vector();
    Vector vec_score=new Vector();
    Vector vec_fname=new Vector();
    Vector vec_cname=new Vector();
    
   
    
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
    
    var_con=request.getParameter("usn");
   
    stmt = conn.prepareStatement("select r.usn,s.fname,r.edate,r.cid,r.sem,c.cname,r.score from student as s,course as c,result as r where s.usn=? and r.usn=? and c.cid=r.cid");
            stmt.setString(1,var_con);
                        stmt.setString(2,var_con);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
              
            vec_usn.add(rs.getString("usn"));
            vec_fname.add(rs.getString("fname"));
            vec_edate.add(rs.getString("edate"));
            vec_cid.add(rs.getString("cid"));
            vec_sem.add(rs.getString("sem"));
            vec_cname.add(rs.getString("cname"));
            vec_score.add(rs.getString("score"));
            
            
            }
                
            
            rs.close();
            stmt.clearParameters();
            stmt.close();
    
            msg="Successfully retrieved";
            if(vec_usn.isEmpty()){
            msg="No usn Found";
            }
    
    
       }
        catch(Exception ex){
            msg="No USN found"+ex.getMessage();
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
        <title>View-Result</title>
    </head>
     <body bgcolor="#FFFFCC">
       <form action="viewres.jsp" method="post">
            <table width="98">
                <tr><td><img src="Images/854.gif" width="1348" height="146" /></td>
                </tr>
            </table>
            <p>&nbsp;</p>
            <marquee direction="right">**All Fields Are Compulsory**</marquee>
            <p>&nbsp;</p>
            <table border="1" align="center" bordercolor="blue">
                <tr>   <td align="center" colspan="4">Course</td></tr>
                <tr>
                    <td>USN:*</td><td><input type="text" name="usn" required="" placeholder="Enter USN" onkeypress="return onlcn(event)" maxlength="10" min="10"
                                             required="" placeholder="Enter USN"/></td>
                </tr>
                 <tr><td colspan="2" align="center"><input type="submit" name="btnsub" /></td></tr>
            </table>
                        <%if (request.getParameter("btnsub") != null) {%>
            <table border="1" align="center" bordercolor="bule">
        <tr>
            <th>USN</th>
            <th>Fname</th>
            <th>E-Date</th>
            <th>C-Id</th>
            <th>C-Name</th>
            <th>Sem</th>
            <th>Score</th>
        </tr>
        <%
        for(int i=0;i<vec_usn.size();i++){
        %>
            
    <tr>

    <td><%=vec_usn.get(i)%></td>
    <td><%=vec_fname.get(i)%></td>
    <td><%=vec_edate.get(i)%></td>
    <td><%=vec_cid.get(i)%></td>
      <td><%=vec_cname.get(i)%></td>
    <td><%=vec_sem.get(i)%></td>
    <td><%=vec_score.get(i)%></td>
    </tr>
    <% }

            vec_usn.clear();
            vec_fname.clear();
            vec_edate.clear();
            vec_cid.clear();
            vec_cname.clear();
            vec_sem.clear();
            vec_score.clear();
            
        %>
  </table>
  <%}%>
             </form>
             <h1><a href="studenthome.jsp">Back</a></h1>
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
     </body>
</html>