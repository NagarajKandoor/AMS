<%-- 
    Document   : change_pwd
    Created on : Apr 25, 2013, 2:11:27 PM
    Author     : sudhir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%!
    String msg="";
    Connection conn = null;
    PreparedStatement stmt = null;
    PreparedStatement stmt1 = null;

    String oldpassword="";
    String newpassword="";
    String confirmpassword="";
    String var_loginid="";
    String var_oldpwd="";
    
    
    
     void connect() {
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:db2://localhost:50000/AMS", "db2admin", "ngk555");
        } catch (Exception e) {
            msg = e.getMessage();
        }
    }
    public void getting_session(HttpServletRequest request){
            try{
                HttpSession obj=request.getSession(false);

                var_loginid=obj.getAttribute("session_loginid").toString();
                var_oldpwd=obj.getAttribute("session_pwd").toString();
                }
                catch(Exception ex){
                    msg=ex.getMessage();
                               }
    }
    public void fetch(HttpServletRequest request){
        try{
            oldpassword=request.getParameter("txt_c_pwd");
            newpassword=request.getParameter("txt_new_pwd");
            confirmpassword=request.getParameter("txt_confirm_pwd");
            
        }
        catch(Exception ex){
            msg=ex.getMessage();
        
            
        }
    }
    

    public void update() {
        try {
            /*stmt1=conn.prepareStatement("select password from cusomer where customer_login=?");
            stmt1.setString(1,var_loginid);*/
            
            stmt = conn.prepareStatement("update student set password=? where usn=?");
            stmt.setString(1,confirmpassword);
            stmt.setString(2,var_loginid);
            stmt.executeUpdate();
            stmt.clearParameters();
            stmt.close();
         
        }

        catch (Exception ex) {
            msg =ex.getMessage();
        }

    }
     public void close()
            {
            try                     
            {
        conn.close();
               }
            catch(Exception e)       {
            msg=e.getMessage();                   
            }
                      }
%>

<%
if(request.getParameter("btn_sub")!=null)
       {
        connect();
        getting_session(request);
        fetch(request);
        if(var_oldpwd.equals(oldpassword)){
            
            if(newpassword.equals(confirmpassword)){
                              update();
                              msg="Password Changed Successfully";
            }
        }
               else{
             msg="Password combination doesnot match";
               }
        
        close();
        
        
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Changing password</title>
    </head>
     <script>
    function valid(frm)
        {
            
            if(frm.txt_c_pwd.value.trim()=="")
                {
                    alert("ENTER CURRENT PASSWORD");
                    frm.txt_c_pwd.value.focus();
                    return false;
                }   
                      if(frm.txt_new_pwd.value.trim()=="")
                {
                    alert("ENTER THE NEW PASSWORD");
                    frm.txt_new_pwd.value.focus();
                    return false;
                }
                if(frm.txt_confirm_pwd.trim()=="")
                {
                    alert("ENTER THE CONFIRMATION PASSWORD");
                    frm.txt_confirm_pwd.value.focus();
                    return false;
                }
                }
           </script>     


    <body bgcolor="#FFFFCC">
         <table width="98">
                <tr><td><img src="Images/854.gif" width="1348" height="146" /></td>
                </tr>
            </table>
            <form name="frm" method="POST" action="change_pwd.jsp">
            <br>
            <br>
            <h1 align="center">Change Student Password</h1>
            <br>
            <br>
            
            
        <table align="center" border="1" bordercolor="blue">
            <tr>
                <td>Enter the current password</td>
                <td><input type="password" name="txt_c_pwd" value="" required=""  placeholder="Enter Current Password"/></td>    
            </tr>
            <tr>
                <td>Enter the new password</td>
                <td><input type="password" name="txt_new_pwd" value="" required=""  placeholder="Enter New Password"/></td>
            </tr>
            <tr>
                <td>Confirm password</td>
                <td><input type="password" name="txt_confirm_pwd" value="" required=""  placeholder="Conform Password"/></td>
            </tr>
            <tr>
                <th><input type="submit" value="SUBMIT" name="btn_sub" onfocus="return valid(frm)"/></th>
                <td><input type="reset" value="RESET" name="btn_reset" /></td>
            </tr>
        </table>
            
        </form>
        <h1><a href="studenthome.jsp">Back</a></h1>
        
        <script>
            <%if(request.getParameter("btn_sub")!=null){%>
            alert("<%=msg%>");
            <%}%>
        </script>
        
        </body>
</html>
