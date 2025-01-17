<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
th {
text-align: left;
padding-right: 8px;
}
</style>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<br>
<h2 style="text-align: center;">투표하기</h2>
<br>
<section style="display: flex; justify-content: center;">
<form action="RegiConfirm.jsp" name="form">
	<table border="1" style="border-spacing: 0px;">
		<tr>
			<th>주민번호</th>
			<td>
			<input type="text" name="v_jumin" id="v_jumin"> ex)8906153154726&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<th>성명</th>
			<td>
			<input type="text" name="v_name" id="n_name">
			</td>
		</tr>
		<tr>
			<th>후보번호</th>
			<td>
			<select name="m_no" style="padding: 0 45px;">
			<option></option>
			<option value="1">[1]김후보</option>
			<option value="2">[2]이후보</option>
			<option value="3">[3]박후보</option>
			<option value="4">[4]조후보</option>
			<option value="5">[5]최후보</option>
			</select>
			</td>
		</tr>
		<tr>
			<th>투표시간</th>
			<td>
			<input type="text" name="v_time" id="v_time">
			</td>
		</tr>
		<tr>
			<th>투표장소</th>
			<td>
			<input type="text" name="v_area" id="v_area">
			</td>
		</tr>
		<tr>
			<th>유권자확인</th>
			<td>
			<input type="radio" name="v_confirm" value="Y" id="v_confirm">확인 
			<input type="radio" name="v_confirm" value="N" id="v_confirm">미확인
			</td>
		</tr>
		<tr>
			<td style="text-align: center;" colspan="2">
			<button type="submit" onclick="fn_submit(); return false;">투표하기</button>
			<button type="reset" onclick="fn_reset();">다시하기</button>
			</td>
		</tr>
	</table>
</form>
</section>
<script type="text/javascript">
function fn_submit() {
	var f = document.form;
	
	if(f.v_jumin.value == "") {
		alert("주민번호가 입력되지 않았습니다!");
		f.v_jumin.focus(); return false;
	}
	if(f.n_name.value == "") {
		alert("성명이 입력되지 않았습니다!");
		f.n_name.focus(); return false;
	}
	if(f.m_no.value == "") {
		alert("후보번호가 입력되지 않았습니다!");
		f.m_no.focus(); return false;
	}
	if(f.v_time.value == "") {
		alert("투표시간이 입력되지 않았습니다!");
		f.v_time.focus(); return false;
	}
	if(f.v_area.value == "") {
		alert("투표장소가 입력되지 않았습니다!");
		f.v_area.focus(); return false;
	}
	if(f.v_confirm.value == "") {
		alert("유권자확인이 입력되지 않았습니다!");
		f.v_confirm.focus(); return false;
	}
	f.submit();
}
function fn_reset() {
	var f = document.form;
	
	alert("모든 정보를 지우고 처음붵 다시 입력합니다");
	f.v_jumin.focus();
	
	f.reset();
}
</script>
</body>
</html>