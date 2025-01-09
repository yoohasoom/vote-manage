<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "system", "1234");
	int result = 0;
	
	String sql = "insert into tbl_vote202006 values(?, ?, ?, ?, ?, ?)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);  
	
	pstmt.setString(1, request.getParameter("v_jumin"));
	pstmt.setString(2, request.getParameter("v_name"));
	pstmt.setString(3, request.getParameter("m_no"));
	pstmt.setString(4, request.getParameter("v_time"));
	pstmt.setString(5, request.getParameter("v_area"));
	pstmt.setString(6, request.getParameter("v_confirm"));
	
	result = pstmt.executeUpdate();

	if(result == 1) {
%>
<script type="text/javascript">
alert("정상적으로 등록되었습니다");
location = "TuList.jsp";
</script>
<%
	}
%>
</body>
</html>