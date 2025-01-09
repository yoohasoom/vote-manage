<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
th {
padding: 0 30px;
}
td {
text-align: center;
}
</style>
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

String sql = "select tm.m_no, tm.m_name, tp.p_name, tm.p_school, substr(tm.m_jumin, 1, 6), substr(tm.m_jumin, 7, 7), tm.m_city, tp.p_tel1, tp.p_tel2, tp.p_tel3 "
			+ "from tbl_member_202006 tm, tbl_party_202006 tp "
			+ "where tm.p_code = tp.p_code "
			+ "order by tm.m_no ";

ResultSet rs = conn.prepareStatement(sql).executeQuery();
%>
<jsp:include page="Header.jsp"></jsp:include>
<br>
<h2 style="text-align: center;">후보조회</h2>
<br>
<section style="display: flex; justify-content: center;">
	<table border="1" style="border-spacing: 0px;">
		<tr>
			<th>후보번호</th>
			<th>성명</th>
			<th>소속정당</th>
			<th>학력</th>
			<th>주민번호</th>
			<th>지역구</th>
			<th>대표전화</th>
		</tr>
		<%
		while(rs.next()) {
		%>
		<tr>
			<td><%= rs.getString(1) %></td>
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getString(3) %></td>
			<td><%= rs.getString(4).equalsIgnoreCase("1") ? "고졸" : rs.getString(4).equalsIgnoreCase("2") ? "학사" : rs.getString(4).equalsIgnoreCase("3") ? "석사" : (rs.getString(4).equalsIgnoreCase("4") ? "박사" : "") %></td>
			<td><%= rs.getString(5) %>-<%= rs.getString(6) %></td>
			<td><%= rs.getString(7) %></td>
			<td><%= rs.getString(8) %>-<%= rs.getString(9) %>-<%= rs.getString(10) %></td>
		</tr>
		<%
		}
		%>
	</table>
</section>
</body>
</html>