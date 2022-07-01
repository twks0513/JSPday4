<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<% if(session.getAttribute("id")!=null){%>
		<h1>로그인이 되어있습니다</h1>
		<button onclick="location.href='main.jsp'">메인으로 돌아가기</button>					
	<%}else{%>
		<form action="check.jsp" method="post">
		<input type="text" name="id" placeholder="아이디"><br>
		<input type="password" name="pwd" placeholder="비밀번호"><br>
		<input type="submit" value="로그인">
		</form>
	<%} %>
</body>
</html>