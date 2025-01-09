<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
td {
text-align: center;
}
th {
padding: 0 15px;
}
</style>
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "system", "1234");

String sql = "select v_name, substr(v_jumin,1,2), substr(v_jumin,3,2), substr(v_jumin,5,2),"
			+ "substr(v_jumin, 7, 1), m_no, substr(v_time,1,2), "
			+ "substr(v_time,3,2), v_confirm, substr(v_jumin, 1, 1)  "
			+ "from tbl_vote202006 "
			+ "where v_area = '제1투표장'";

ResultSet rs = conn.prepareStatement(sql).executeQuery();

int i;
int man;
String st1;
String st2;
String st3;

LocalDate today = LocalDate.now();

int month = today.getMonthValue();
int day = today.getDayOfMonth();
%>
<jsp:include page="Header.jsp"></jsp:include>
<br>
<h2 style="text-align: center;">투표검수조회</h2>
<br>
<section style="display: flex; justify-content: center;">
	<table border="1" style="border-spacing: 0px;">
		<tr>
			<th>이름</th>
			<th>생년월일</th>
			<th>나이</th>
			<th>성별</th>
			<th>후보번호</th>
			<th>투표시간</th>
			<th>유권자확인</th>
		</tr>
                <%
                while (rs.next()) {
                %>
                <% 
                i = Integer.parseInt(rs.getString(2));
                st1 = rs.getString(9);
                st2 = rs.getString(5);
                st3 = rs.getString(9);
                
                if (st2.equals("9") || st2.equals("0")) {
    				i += 1800;
    			} else if(st2.equals("1") || st2.equals("2")){
    				i += 1900;
    			} else if(st2.equals("3") || st2.equals("4")){
    				i += 2000;
    			} else if(st2.equals("5") || st2.equals("6")){
    				i += 1900;
    			} else if(st2.equals("7") || st2.equals("8")){
    				i += 2000;
    			}
    			
    			man = 2020 - i;

    			if (rs.getInt(3) > month) {
    				man = man - 1;
    			}else if(rs.getInt(3) == month){
    				if(rs.getInt(4) > day){
    					man = man - 1;
    				}
    			}

    			if (man > 120) {
    				if (st2.equals("9")) {
    					st2 = "남";
    				} else if (st2.equals("0")) {
    					st2 = "여";
    				}
    			} else if (man > 20) {
    				if (st2.equals("1") || st2.equals("5")) {
    					st2 = "남";
    				} else if (st2.equals("2") || st2.equals("6")) {
    					st2 = "여";
    				}
    			} else if (man < 20) {
    				if (st2.equals("3") || st2.equals("7")) {
    					st2 = "남";
    				} else if (st2.equals("4") || st2.equals("8")) {
    					st2 = "여";
    				}
    			}
                %>
                <tr>
                <td><%=rs.getString(1)%></td>
                    <td><%=i%>년<%=rs.getString(3)%>월<%=rs.getString(4)%>일생</td>
                    <td>만<%=man%>세</td>  
                    <td><%=st2%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><%=rs.getString(7)%>:<%=rs.getString(8)%></td>
                    <td><%=rs.getString(9).equalsIgnoreCase("Y") ? "확인" : (rs.getString(9).equalsIgnoreCase("N") ? "미확인" : "")%></td>                 
                </tr>
                <%
                }
                %>
	</table>
</section>
</body>
</html>