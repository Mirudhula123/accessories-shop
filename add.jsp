<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<body align="center">
<form action="mycart.html">
<%
String RollNo = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "shop";
String userid = "root";
String password = "miru";

try {
Class.forName(driver);
} 
catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<h1 align="center">PRODUCT DETAILS</h1>
<table border="1" align="center" cellpadding="5" cellspacing="5">
<tr>

</tr>
<tr>
<td>Id</td>
<td>Name of product</td>
<td>Prize</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from shop.clothes";


resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>

<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("prize") %></td>

</tr><br<br>
<%
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table><br>
<input type="submit" value="PLACE YOUR ORDER"><br><br>
</form>
</body>
</html>

