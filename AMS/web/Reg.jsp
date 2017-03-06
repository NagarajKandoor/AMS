<%-- 
    Document   : Reg
    Created on : Mar 11, 2014, 7:43:54 PM
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

    String usn;
    String fname;
    String lname;
    String mname;
    String branch;
    String address;
    String dob;
    String sex;
    String sem;
    String mobno;
    String dno;
    String password;
       

    String msg = "";

    void connect() {
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:db2://localhost:50000/AMS", "db2admin", "ngk555");
        } catch (Exception e) {
            msg = e.getMessage();
        }
    }

    public void fetch(HttpServletRequest request) {
        usn = request.getParameter("usn").trim();
        fname = request.getParameter("fname").trim();
        lname = request.getParameter("lname").trim();
        mname = request.getParameter("mname").trim();
        branch = request.getParameter("branch").trim();
        address = request.getParameter("address").trim();
        dob = request.getParameter("dob").trim();
        sex = request.getParameter("sex").trim();
        sem = request.getParameter("sem").trim();
        mobno = request.getParameter("mobno").trim();
        dno = request.getParameter("dno").trim();
        password = request.getParameter("password").trim();
    }

    public void insert() {
        try {
            
            stmt_reg_insert = conn.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?,?,?,?)");
            stmt_reg_insert.setString(1,usn);
            stmt_reg_insert.setString(2,fname);
            stmt_reg_insert.setString(3,lname);
            stmt_reg_insert.setString(4,mname);
            stmt_reg_insert.setString(5,branch);
            stmt_reg_insert.setString(6,address);
            stmt_reg_insert.setString(7,dob);
            stmt_reg_insert.setString(8,sex);
            stmt_reg_insert.setString(9,sem);
            stmt_reg_insert.setString(10,mobno);
            stmt_reg_insert.setString(11,dno);
            stmt_reg_insert.setString(12,password);

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
        fetch(request);
        insert();
    }
%>








<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REGISTRATION </title>
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
        <form action="" method="post">
            <table width="98">
                <tr><td><img src="Images/854.gif" width="1348" height="146" /></td>
                </tr>
            </table>
            <p>&nbsp;</p>
             <marquee direction="right">**All Fields Are Compulsory**</marquee>
            <p>&nbsp;</p>
           
            <table width="200" height="200" align="left">
                <tr><td width="449"><img src="Images/registration2.gif"  width="200" height="200"/></td>
                </tr>
            </table>
            <table width="200" height="200" align="right">
                <tr><td width="449"><img src="Images/registration2.gif"  width="200" height="200"/></td>
                </tr>
            </table>
            <table border="1" align="center" bordercolor="blue">
                <td align="center" colspan="2">Registration Form</td>
                <tr>
                    <td>First-Name:*</td><td><input type="text" name="fname" id="sfname" onkeypress="return onlchar(event)" maxlength="20" min="3" 
                                                    required="" placeholder="Enter FName"/></td>
                </tr>
                <tr>
                    <td>Middle-Name:*</td><td><input type="text" name="mname"  id="smname" onkeypress="return onlchar(event)" maxlength="20" min="3"
                                                     required="" placeholder="Enter LName"/></td>
                </tr>
                <tr>
                    <td>Last-Name:*</td><td><input type="text" name="lname" id="slname"  onkeypress="return onlchar(event)" maxlength="20" min="3"
                                                   required="" placeholder="Enter LName"/></td>
                </tr>
                <tr>
                    <td>Gender:*</td><td>Male:<input type="radio" name="sex" value="Male" checked="checked" id="ssex" />
                        Female:<input type="radio" name="sex" value="Female" id="ssex"/></td>
                </tr>
                <tr>
                    <td>USN:*</td><td><input type="text" name="usn" id="susn" onkeypress="return csnum(event)" maxlength="10" min="10"
                                             required="" placeholder="Enter USN"/></td>
                </tr>
                <tr>
                    <td>Branch:*</td><td><select name="branch" size="1" id="sbranch">
                            <option value="sel">SELECT</option>
                            <option value="cse">CSE</option>
                            <option value="ise">ISE</option>
                            <option value="mec">MEC</option>
                            <option value="e&c">E&C</option>
                            <option value="eee">E&EE</option>
                            <option value="ch">CH</option>
                        </select></td>
                </tr>
                <tr>
                    <td>SEM:*</td>
                    <td colspan="2"><select name="sem" size="1" id="ssem">
                            <option value="sel">SELECT</option>
                            <option value="I">I</option>
                            <option value="II">II</option>
                            <option value="III">III</option>
                            <option value="IV">IV</option>
                            <option value="V">V</option>
                            <option value="VI">VI</option>
                            <option value="VII">VII</option>
                            <option value="VIII">VIII</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Mobile-Number:*</td><td><input type="text" name="mobno" id="smobno" onkeypress="return onlnum(event)" maxlength="10" min="10"
                                                       required="" placeholder="Enter MOB-NO"/></td>
                </tr>
                <tr>
                    <td>Address:*</td><td><textarea name="address" rows="5" cols="20" id="saddress" onkeypress="return csnum(event)"
                                                    required="" placeholder="Enter Address">
                        </textarea></td>
                </tr>
                <tr>
                    <td>DNO:*</td><td><input type="text" name="dno" id="sdno" onkeypress="return onlnum(event)"maxlength="3" min="2"
                                             required="" placeholder="Enter Dno"/></td>
                </tr>
                <tr>
                    <td>Password:*</td><td><input type="password" name="password" id="spassword" onkeypress="return csnum(event)" maxlength="10" min="4"
                                                  required="" placeholder="Enter Password"/></td>
                </tr>
                <tr>
                    <td>DOB:*</td><td><input type="text" name="dob"  id="datepicker"
                                             required="" placeholder="Enter DOB"/></td>
                </tr>
                
                    <tr><td colspan="2" align="center"><input type="submit" name="btnsub123" /></td></tr>
             


            </table>
            <h1><a href="login.jsp">Back</a></h1>
        </form> 
    <script>
            <%if(request.getParameter("btnsub123")!=null){%>
                alert("<%=msg%>");
                <%}%>
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
