<%@page import="quiz02.MembersDTO"%>
<%@page import="quiz02.MembersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<%@ include file="header.jsp" %>
	<%
		String idsave="";
		Cookie[] carr = request.getCookies();
		for(Cookie c : carr){
			if(c.getName().equals("idsave")){
				idsave = c.getValue();				
			}
		}
	%>
		
	<% if(session.getAttribute("id")!=null){%>
	<div align="center">
		<h1><%=session.getAttribute("name") %>님이 로그인중 입니다</h1>
	</div>					
	<%}else{%>
	<div align="center">
		<form action="check.jsp" method="post">
		<input type="text" name="id" placeholder="아이디" value="<%=idsave %>"><br>
		<input type="password" name="pwd" placeholder="비밀번호"><br>
		<input type="checkbox" name="id_save">아이디 저장<br>
		<input type="checkbox" name="auto">자동 로그인<br>
		<input type="submit" value="로그인">
		</form>
	</div>
	<%} %>
	<%@ include file="footer.jsp" %>
</body>
</html>