<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
th {
padding: 0 15px;
}
td {
text-align: center;
}
</style>
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "system", "1234");

String sql = "select tm.m_no, tm.m_name, count(*) as total "
			+ " from tbl_vote202006 tv, tbl_member_202006 tm"
			+ " where tv.m_no = tm.m_no and v_confirm = 'Y'"
			+ " group by tm.m_no, tm.m_name"
			+ " order by total desc";

ResultSet rs = conn.prepareStatement(sql).executeQuery();

%>
<jsp:include page="Header.jsp"></jsp:include>
<br>
<h2 style="text-align: center;">후보자등수</h2>
<br>
<section style="display: flex; justify-content: center;">
	<table border="1" style="border-spacing: 0px;">
		<tr>
			<th>후보번호</th>
			<th>성명</th>
			<th>총투표건수</th>
		</tr>
                <%
                while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>          
                    <td><%=rs.getString(3)%></td>
                                      
                </tr>
                <%
                }
                %>
	</table>
</section>
</body>
</html>