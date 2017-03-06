<%-- 
    Document   : faculty-reg
    Created on : Mar 11, 2014, 7:44:26 PM
    Author     : nagaraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="java.sql.*"%>
<%@ page import="java.sql.*" %>

<%!
    Connection conn = null;
    PreparedStatement stmt_reg_insert = null;

    String fid;
    String fname;
    String dno;
    String address;
    String fpassword;
    String contact_no;
    String qualification;
    String email_id;
    String desig;
    int count,fid123;
       

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
            stmt_reg_insert = conn.prepareStatement("select count(*),max(dno) from department");
            ResultSet rs = stmt_reg_insert.executeQuery();
            rs.next();count=rs.getInt(1);
            if(count==0){
                fid123=1;
            }
                       else{
                       fid123=rs.getInt(2);
                       fid123=fid123+1;
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
        fid = request.getParameter("fid").trim();
        fname = request.getParameter("fname").trim();
        
        address = request.getParameter("address").trim();
        contact_no = request.getParameter("contact_no").trim();
        qualification= request.getParameter("qualification").trim();
        dno = request.getParameter("dno").trim();
         desig= request.getParameter("desig").trim();
          email_id= request.getParameter("email_id").trim();
        fpassword= request.getParameter("password").trim();
        
       
       
        
    }

    public void insert() {
        try {
            
            stmt_reg_insert = conn.prepareStatement("insert into faculty values(?,?,?,?,?,?,?,?,?)");
            stmt_reg_insert.setString(1,fid);
            stmt_reg_insert.setString(2,fname);
            stmt_reg_insert.setString(3,dno);
            stmt_reg_insert.setString(4,address);
            stmt_reg_insert.setString(5,fpassword);
            stmt_reg_insert.setString(6,contact_no);
            stmt_reg_insert.setString(7,qualification);
            stmt_reg_insert.setString(8,email_id);
            stmt_reg_insert.setString(9,desig);
            

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
        auto_primary_key();
        fetch(request);
        insert();
    }
%>






<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty_Register</title>
    </head>
    <body bgcolor="#FFFFCC">
        <form action="faculty-reg.jsp" method="post">
            <table width="98">
                <tr><td><img src="Images/854.gif" width="1348" height="146" /></td>
                </tr>
            </table>
            <p>&nbsp;</p>
            <marquee direction="right">**All Fields Are Compulsory**</marquee>
            <p>&nbsp;</p>
            <table border="1" align="center" bordercolor="blue">
                <td align="center" colspan="2">Faculty-Registration-Form</td>
                <tr>
                    <td width="77">Faculty-ID:*</td><td width="155"><input type="text" name="fid" onkeypress="return onlnum(event)"
                                                                           required="" placeholder="Enter FID" value="<%=fid123%>" readonly=""/></td>
                </tr>
                <tr>
                    <td>Name:*</td><td><input type="text" name="fname" onkeypress="return onlchar(event)" 
                                              required="" placeholder="Enter Name"/></td>
                </tr>
                
                <tr>
                    <td>Address:*</td>
                    <td><textarea cols="21" rows="8" name="address" onkeypress="return csnum(event)"
                                  required="" placeholder="Enter Address"></textarea></td>
                </tr>
                <tr>
                    <td>Contact-No:*</td><td><input type="text" name="contact_no" onkeypress="return onlnum(event)" 
                                                    required="" placeholder="Enter Contact-No"/></td>
                </tr>
                <tr>
                <td>Qualification:*</td><td><input type="text" name="qualification" onkeypress="return csnum(event)" 
                                                   required="" placeholder="Enter Qualification"/></td>
                </tr>
                <tr>
                    <td>Dept_no:*</td>
                    <td><input type="text" name="dno" onkeypress="return onlnum(event)" maxlength="3" min="1"required="" placeholder="Enter DNO"/></td>
                </tr>
                <tr>
                    <td>Designation:*</td>
                    <td><select name="desig"  size="1" >
                            <option value="op">SELECT</option>
                            <option value="H.O.D">H.O.D</option>
                            <option value="Professor">Professor</option>
                            <option value="Assistent.professor">Assistant.Professor</option>
                        </select></td>
                </tr><tr>
                    <td>E-Mail:*</td><td><input type="text" size="25" name="email_id" maxlength="25" onclick="return checkEmail(event)"
                                            required="" placeholder="Enter E-Mail"/></td></tr>
                <tr>
                    </tr>
                    <td>F-Password:*</td><td><input type="password" size="12" name="password" maxlength="12"onkeypress="return csnum(event)" 
                                                    required="" placeholder="Enter FPassword"/></td>
                <tr>
                    
                </tr>
                 <tr><td colspan="2" align="center"><input type="submit" name="btnsub123" /></td></tr>
            </table>
        </form>
                 <h1><a href="adminhome.jsp">Back</a></h1>
        <script>
            <%if(request.getParameter("btnsub123")!=null){%>
                alert("<%=msg%>");
                <%}%>
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


        </script>
        <script>
            function checkEmail() {

    var email = document.getElementById('email_id');
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    

    if (!filter.test(email.value)) {
    alert('Please provide a valid email address');
    email.focus;
    return false;}}
        </script>
    </body>
</html>
