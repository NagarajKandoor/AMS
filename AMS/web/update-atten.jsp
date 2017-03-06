<%-- 
    Document   : update-atten
    Created on : May 15, 2014, 7:47:19 AM
    Author     : nagaraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@page import="java.util.Vector"%>
<%
HttpSession obj=request.getSession(false);

      String var_oldpwd,var_loginid;

        var_loginid=obj.getAttribute("session_loginid").toString();
        var_oldpwd=obj.getAttribute("session_pwd").toString();
%>


<%!
  
    Connection conn = null;
    PreparedStatement stmt = null;
    String msg="";
    String var_fid;
    String var_tot;
    String var_usn,var_cid,var_date,var_atten;
    
        Vector vec_usn=new Vector();
        Vector vec_cid=new Vector();
        Vector vec_fid=new Vector();
         Vector vec_tot=new Vector();
          Vector vec_atten=new Vector();
          Vector vec_date=new Vector();
        void connect() {
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:db2://localhost:50000/AMS", "db2admin", "ngk555");
        } catch (Exception e) {
            msg = e.getMessage();
        }
    }
   
        public void fetch() {
        try {
            stmt = conn.prepareStatement("select usn,fid,cid,date,total_class,attended_class from attedence");
           
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                
                vec_usn.add(rs.getString("usn"));
                vec_fid.add(rs.getString("fid"));
                vec_cid.add(rs.getString("cid"));
                 vec_date.add(rs.getString("date"));
                  vec_tot.add(rs.getString("total_class"));
                  vec_atten.add(rs.getString("attended_class"));
            }
            
            
            rs.close();
            stmt.clearParameters();
            stmt.close();

         
        }

        catch (Exception ex) {
            msg =ex.getMessage();
        }
               }
         public void getdept(HttpServletRequest request){
             try{
                 var_usn=request.getParameter("txt_usn");
                 var_fid=request.getParameter("txt_fid");
                  var_cid=request.getParameter("txt_cid");
                 var_tot=request.getParameter("txt_tot");
                 var_atten=request.getParameter("txt_atten");
                  var_date=request.getParameter("txt_date");
             }
             catch(Exception ex){
                 msg=ex.getMessage();
             }
         }
         public void update(){
             try{
                 stmt = conn.prepareStatement("update attedence set usn=?,fid=?,date=?,total_class=?,attended_class=? where cid=?");
            stmt.setString(1,var_usn);
            stmt.setString(2,var_fid);
            stmt.setString(3,var_date);
             stmt.setString(4,var_tot);
              stmt.setString(5,var_atten);
               stmt.setString(6,var_cid);
            stmt.executeUpdate();
            stmt.clearParameters();
            stmt.close();
            conn.close();
            msg="Updation Successful";
                 
             }
             catch(Exception ex){
                 msg=ex.getMessage();
             }
         }
    %>

<%
    if(request.getParameter("btn_sub")!=null){
        connect();
        getdept(request);
        update();
    }
       else{
    connect();
    fetch();
    }
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>updating of Attendance</title>
    </head>
    <body bgcolor="#FFFFCC">
        <form method="POST" action="update-atten.jsp" >
        <div id="page">
        <table width="98">
                <tr><td><img src="Images/854.gif" width="1348" height="146" /></td>
                </tr>
            </table>
            </br>
            </br>
        <table border="1" bordercolor="blue" align="center">
            <tr align="center"><td align="center" colspan="6">Attendance Details</td></tr>
            <tr>
                <td>USN</td>
                <td>F-id</td>
                <td>C-Id</td>
                <td>Date</td>
                <td>TOT-Class</td>
                <td>Attended-Class</td>
            </tr>
             <%
            for(int i=0;i<vec_cid.size();i++)
                              {
               %>
           <tr>
                <td><%=vec_usn.get(i)%></td>
                <td><%= vec_fid.get(i) %></td>
                <td><%=vec_cid.get(i) %></td>
               <td><%=vec_date.get(i) %></td>
               <td><%=vec_tot.get(i) %></td>
               <td><%=vec_atten.get(i) %></td>
           </tr>            
            <%}
                vec_usn.clear();
                vec_fid.clear();
                vec_date.clear();
               vec_tot.clear();
               vec_atten.clear();
               vec_cid.clear();
                %>
        </table>
                <br>
                    
                <table border="1" bordercolor="blue" align="center">
                    <tr><td colspan="2" align="center">If you wish to Update Course</td></tr>
                <tr>
                    <td>Enter the CID</td>
                    <td><input type="text" name="txt_cid"/></td>
                </tr>
                    <tr>
                    <td>Enter the USN</td>
                    <td><input type="text" name="txt_usn" /></td>
                </tr>
                            <tr>
                    <td>Enter the F-id</td>
                    <td><input type="text" name="txt_fid"/></td>
                </tr>
                 <tr>
                    <td>Enter the Date</td>
                    <td><input type="text" name="txt_date"/></td>
                </tr>
                 <tr>
                    <td>Enter the Total_class</td>
                    <td><input type="text" name="txt_tot"/></td>
                </tr>
                <tr>
                    <td>Enter the Attended_class</td>
                    <td><input type="text" name="txt_atten"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit"  name="btn_sub" value="Update"/></td>
                </tr>
                </table>
                </div>
        <h1> <a href="facultyhome.jsp">Back</a></h1>
        
               
        </form>
                <script>
                    <%
                    if(request.getParameter("btn_sub")!=null) {%>
                        alert("<%= msg %>");
                        <% } %>
                </script>
    </body>
</html>