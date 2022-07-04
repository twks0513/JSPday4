<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#div1 {background-color: black; font-size: 15pt;}
#div1 a {color: white;}
#div1 a:hover {background-color: gray;}
</style>
</head>
<body>
<div align="center">
<header><h1>환영합니다</h1>
	<div id="div1">
	<a href="login.jsp">로그인 페이지</a>
	<%if(session.getAttribute("id")==null){ %> 
		<a href="register.jsp">회원가입</a> 
	<%} %>
	
	<a href="main.jsp">메인</a> <a href="showInfo.jsp">내 정보</a> 
	<%if(session.getAttribute("id")!=null){ %>
		<a href="logout.jsp">로그아웃</a>
	<%} %>
	</div>
</header>
<hr>
</div>
</body>
</html>