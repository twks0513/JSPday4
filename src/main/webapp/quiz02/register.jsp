<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chkval() {
		let id = document.join.id.value;
		let pwd = document.join.pwd.value;
		let re_pwd = document.join.re_pwd.value;
		
		if(id==""){
			alert('아이디는 필수사항입니다')
			join.id.focus()
		}else if(pwd==""){
			alert('비밀번호는 필수사항입니다')
			join.pwd.focus()
		}else if(pwd != re_pwd){
			alert('비밀번호 확인이 다릅니다')	
			join.re_pwd.focus()
		}else{
			join.submit();
		}
	}
</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div align="center">
	<h1>회원가입 페이지</h1>
	<form name="join" action="registercheck.jsp" method="post">
		<input type="text" name="id" placeholder="아이디(*필수항목)"><br>		
		<input type="password" name="pwd" placeholder="비밀번호(*필수항목)"><br>
		<input type="password" name="re_pwd" placeholder="비밀번호 확인(*필수항목)"><br>
		<input type="text" name="name" placeholder="이름"><br>
		<input type="text" name="addr" placeholder="주소"><br>
		<input type="text" name="tel" placeholder="전화번호"><br>
		<button type="button" onclick="chkval()">회원가입</button>
		
	</form>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>