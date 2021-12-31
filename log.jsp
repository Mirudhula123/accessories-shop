<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,java.io.*"%>
<html>
<body>
<%
String pass1=request.getParameter("pass112");
String r1="";
String r2="";
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/shop", "root", "miru");

Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery("select *from shop.user where pass='"+pass1+"'");
while(rs.next())
{

r1 = rs.getString(1);
r2 = rs.getString(2);

}
}

catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
if(r2.equals(pass1))
{
response.sendRedirect("main.html");
}
else
{ %>
<script>
 alert('User or password incorrect');
 window.location.href='index.html';
</script>
<%}

%>

</body>
</html>
