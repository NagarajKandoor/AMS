<%-- 
    Document   : update-course
    Created on : May 15, 2014, 2:22:33 AM
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
    String var_cid;
    String var_cname;
    String var_sem,var_fid,var_dno;
    
        Vector vec_dno=new Vector();
        Vector vec_cname=new Vector();
        Vector vec_cid=new Vector();
         Vector vec_sem=new Vector();
          Vector vec_fid=new Vector();
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
            stmt = conn.prepareStatement("select cid,cname,sem,fid,dno from course");
           
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                
                vec_cid.add(rs.getString("cid"));
                vec_cname.add(rs.getString("cname"));
                vec_sem.add(rs.getString("sem"));
                 vec_fid.add(rs.getString("fid"));
                  vec_dno.add(rs.getString("dno"));
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
                 var_cid=request.getParameter("txt_cid");
                 var_cname=request.getParameter("txt_cname");
                  var_fid=request.getParameter("txt_fid");
                 var_dno=request.getParameter("txt_dno");
                 var_sem=request.getParameter("txt_sem");
                 
             }
             catch(Exception ex){
                 msg=ex.getMessage();
             }
         }
         public void update(){
             try{
                 stmt = conn.prepareStatement("update course set cname=?,sem=?,fid=?,dno=? where cid=?");
            stmt.setString(1,var_cname);
            stmt.setString(2,var_sem);
            stmt.setString(3,var_fid);
             stmt.setString(4,var_dno);
              stmt.setString(5,var_cid);
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
        <title>updating of Course</title>
    </head>
    <body bgcolor="#FFFFCC">
        <form method="POST" action="update-course.jsp" >
        <div id="page">
        <table width="98">
                <tr><td><img src="Images/854.gif" width="1348" height="146" /></td>
                </tr>
            </table>
            </br>
            </br>
        <table border="1" bordercolor="blue" align="center">
            <tr align="center"><td align="center" colspan="5">Course Details</td></tr>
            <tr>
                <td>C-id</td>
                <td>C-name</td>
                <td>D-no</td>
                <td>F-id</td>
                <td>Sem</td>
            </tr>
             <%
            for(int i=0;i<vec_cid.size();i++)
                              {
               %>
           <tr>
                <td><%=vec_cid.get(i)%></td>
                <td><%= vec_cname.get(i) %></td>
                <td><%=vec_fid.get(i) %></td>
               <td><%=vec_dno.get(i) %></td>
               <td><%=vec_sem.get(i) %></td>
           </tr>            
            <%}
                vec_cid.clear();
                vec_cname.clear();
                vec_fid.clear();
               vec_dno.clear();
               vec_sem.clear();
               
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
                    <td>Enter the c-name</td>
                    <td><input type="text" name="txt_cname" /></td>
                </tr>
                            <tr>
                    <td>Enter the F-id</td>
                    <td><input type="text" name="txt_fid"/></td>
                </tr>
                 <tr>
                    <td>Enter the SEM</td>
                    <td><input type="text" name="txt_sem"/></td>
                </tr>
                 <tr>
                    <td>Enter the D-no</td>
                    <td><input type="text" name="txt_dno"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit"  name="btn_sub" value="Update"/></td>
                </tr>
                </table>
                </div>
        <h1> <a href="adminhome.jsp">Back</a></h1>
        
               
        </form>
                <script>
                    <%
                    if(request.getParameter("btn_sub")!=null) {%>
                        alert("<%= msg %>");
                        <% } %>
                </script>
    </body>
</html>
