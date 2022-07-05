<%@page import="quiz02.MembersDTO"%>
<%@page import="quiz02.MembersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {width: 300px;}
tr {text-align: center;}
td {text-align: center;  width: 70%;}
td input{text-align: center; width: 50%;}
th {text-align: center;}
</style>
<script type="text/javascript">
	function chkval() {
		let id = document.modifyForm.id.value;
		let pwd = document.modifyForm.pwd.value;
		let re_pwd = document.modifyForm.re_pwd.value;
		
		if(pwd==""){
			alert('비밀번호는 필수사항입니다')
			modifyForm.pwd.focus()
		}else if(pwd != re_pwd){
			alert('비밀번호 확인이 다릅니다')	
			modifyForm.re_pwd.focus()
		}else{
			modifyForm.submit();
		}
	}
</script>
</head>
<body>
	<%
	MembersDAO dao = new MembersDAO();
	MembersDTO dto = dao.getUser((String)session.getAttribute("id"));
	%>
	<%@ include file="header.jsp" %>
	<div align="center">		
	<h1>회원 정보 수정</h1>
		<form name="modifyForm" action="modifychk.jsp" method="post">
		<table border="1">
			<tr><th>아이디 </th><th><%=dto.getId() %></th></tr>
			<tr><th>비밀번호 </th><td><input type="password" name="pwd" value="<%=dto.getPwd() %>"></td></tr>
			<tr><th>비밀번호 확인 </th><td><input type="password" name="re_pwd" value="<%=dto.getPwd() %>"></td></tr>
			<tr><th>이름 </th><td><input type="text" name="name" value="<%=dto.getName() %>"></td></tr>
			<tr><th>주소 </th><td><input type="text" name="addr" value="<%=dto.getAddr() %>"></td></tr>
			<tr><th>전화번호 <td><input type="text" name="tel" value="<%=dto.getTel() %>"></td></tr>
		</table>
			<button type="button" onclick="chkval()">수정</button>
		</form>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>