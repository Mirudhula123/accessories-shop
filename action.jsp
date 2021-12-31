<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,java.io.*"%>
<html>
<body>
<script>
      alert('Successfully Registered');
      window.location.href='index.html';
</script>
<%
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/shop", "root", "miru");

PreparedStatement st;
st=conn.prepareStatement("INSERT INTO `shop`.`user`(`uname`,`pass`) VALUES(?,?)");
st.setString(1, request.getParameter("uname"));
st.setString(2, request.getParameter("pass"));
st.executeUpdate();
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}

%>
</form>
</body>
</html>
