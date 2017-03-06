<%@ page import="java.io.*,java.util.*,java.sql.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<html> <head> <title>SELECT Operation</title> </head>
    <body>
        <sql:setDataSource var="snapshot" driver="com.ibm.db2.jcc.DB2Driver" url="jdbc:db2://localhost:50000/AMS" user="db2admin" password="ngk555"/> 
        <sql:query dataSource="${snapshot}" var="result">
            SELECT * from Employees; </sql:query>
            <table border="1" width="100%"> 
                <tr> 
                    <th>USER ID</th> 
                    <th>Password</th> 
                </tr> 
                <c:forEach var="row" items="${result.rows}">
                    <tr> <td><c:out value="${row.userid}"/></td>
                        <td><c:out value="${row.password}"/></td>
                </tr>
                </c:forEach> </table> </body> </html>