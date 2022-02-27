<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String uid = "ora_user";
String pass = "1234";

String sql = "select * from product";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="800" border="1">
	<tr>
		<th>이름</th><th>아이디</th><th>암호</th><th>이메일</th>
		<th>전화번호</th><th>권한(1:관리자, 0:일반회원)</th>
	</tr>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
conn = DriverManager.getConnection(url, uid, pass);
stmt = conn.createStatement();
rs = stmt.executeQuery(sql);
while(rs.next()){
	out.print("<tr>");
	out.print("<td>" + rs.getString("code") + "</td>");
	out.print("<td>" + rs.getString("name") + "</td>");
	out.print("<td>" + rs.getString("price") + "</td>");
	out.print("<td>" + rs.getString("pictureurl") + "</td>");
	out.print("<td>" + rs.getString("description") + "</td>");
	out.print("<td>" + rs.getString("col_date") + "</td>");
	out.print("</tr>");
}
stmt.close();
rs.close();
conn.close();
%>

</body>
</html>