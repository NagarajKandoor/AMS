<%-- 
    Document   : update-res
    Created on : May 15, 2014, 1:59:23 AM
    Author     : nagaraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>



<%!
  
    Connection conn = null;
    PreparedStatement stmt = null;
    String msg="";
    String var_usn;
    String var_sem;
    String var_cid;
    String var_score;
    String var_edate;
    
        Vector vec_usn=new Vector();
        Vector vec_edate=new Vector();
        Vector vec_sem=new Vector();
         Vector vec_score=new Vector();
          Vector vec_cid=new Vector();
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
            stmt = conn.prepareStatement("select usn,edate,cid,sem,score from result");
           
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                
                vec_usn.add(rs.getString("usn"));
                vec_edate.add(rs.getString("edate"));
                vec_cid.add(rs.getString("cid"));
                vec_sem.add(rs.getString("sem"));
                vec_score.add(rs.getString("score"));
            }
            
            
            rs.close();
            stmt.clearParameters();
            stmt.close();

         
        }

        catch (Exception ex) {
            msg =ex.getMessage();
        }
               }
         public void getres(HttpServletRequest request){
             try{
                 var_usn=request.getParameter("txt_usn");
                 var_edate=request.getParameter("txt_eadte");
                  var_cid=request.getParameter("txt_cid");
                  var_sem=request.getParameter("txt_sem");
                  var_score=request.getParameter("txt_score");
                 
             }
             catch(Exception ex){
                 msg=ex.getMessage();
             }
         }
         public void update(){
             try{
                 stmt = conn.prepareStatement("update result set score=?,edate=?,sem=?,usn=? where cid=?");
            stmt.setString(1,var_score);
            stmt.setString(2,var_edate);
            stmt.setString(3,var_sem);
            stmt.setString(4,var_usn);
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
        getres(request);
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
        <title>updating of book quantities</title>
         <!-- Load jQuery from Google's CDN -->
    <!-- Load jQuery UI CSS  -->
    <link rel="stylesheet" href="jquery-ui.css" />
    
    <!-- Load jQuery JS -->
    <script src="jquery-1.9.1.js"></script>
    <!-- Load jQuery UI Main JS  -->
    <script src="jquery-ui.js"></script>
    
    <!-- Load SCRIPT.JS which will create datepicker for input field  -->
    <script src="script.js"></script>
    </head>
    <body bgcolor="#FFFFCC">
        <form method="POST" action="update-res.jsp" >
        <div id="page">
        <table width="98">
                <tr><td><img src="Images/854.gif" width="1348" height="146" /></td>
                </tr>
            </table>
            </br>
            </br>
        <table border="1" bordercolor="blue" align="center">
            <tr align="center"><td align="center" colspan="5">Result Details</td></tr>
            <tr>
                <td>USN</td>
                <td>E-Date</td>
                <td>C-Id</td>
                <td>Sem</td>
                <td>Score</td>
                
            </tr>
             <%
            for(int i=0;i<vec_usn.size();i++)
                              {
               %>
           <tr>
                <td><%=vec_usn.get(i)%></td>
                <td><%= vec_edate.get(i) %></td>
                <td><%=vec_cid.get(i) %></td>
                <td><%=vec_sem.get(i) %></td>
                <td><%=vec_score.get(i) %></td>
               
           </tr>            
            <%}
                vec_usn.clear();
                vec_edate.clear();
                vec_cid.clear();
                vec_sem.clear();
                vec_score.clear();
               
                %>
        </table>
                <br>
                    
                <table border="1" bordercolor="blue" align="center">
                    <tr><td colspan="2" align="center">If you wish to Update Result</td></tr>
                <tr>
                    <td>Enter the USN</td>
                    <td><input type="text" name="txt_usn" onkeypress="return onlcn(event)"/></td>
                </tr>
                    <tr>
                    <td>Enter the E-date</td>
                    <td><input type="text" name="txt_edate" id="datepicker"/></td>
                </tr>
                            <tr>
                    <td>Enter the C-id</td>
                    <td><input type="text" name="txt_cid" onkeypress="return onlnum(event)"/></td>
                </tr>
                 <tr>
                    <td>Enter the SEM</td>
                    <td><input type="text" name="txt_sem" onkeypress="return onlchar(event)"/></td>
                </tr>
                 <tr>
                    <td>Enter the Score</td>
                    <td><input type="text" name="txt_score" onkeypress="return onlchar(event)"/></td>
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
                 <script type="text/javascript">
            function bsnum(e) {
    var k;
    document.all ? k = e.keyCode : k = e.which;
    
    if( k === 8 || k === 32 || k===9 || k===9 || (k >= 48 && k <= 57))
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
    if( ((k > 64 && k < 91) || (k > 96 && k < 123) || k===44 || k===9 || k===46 || k===9 || k === 8 || k === 32 || (k >= 48 && k <= 57)))
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
function checkEmail() {

    var email = document.getElementById('email_id');
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    

    if (!filter.test(email.value)) {
    alert('Please provide a valid email address');
    email.focus;
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
