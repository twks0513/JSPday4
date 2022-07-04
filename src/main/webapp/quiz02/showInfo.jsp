<%@page import="quiz02.MembersDAO"%>
<%@page import="quiz02.MembersDTO"%>
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
		MembersDAO dao = new MembersDAO();
		MembersDTO dto = dao.getUser((String)session.getAttribute("id"));
		if(session.getAttribute("id")==null){%>
		<script type="text/javascript">
			alert('로그인 후 이용하세요')
			location.href='login.jsp'
		</script>	
	<%} %>
	<%@ include file="header.jsp" %>
	<div align="center">
	<h1>나의 정보</h1>	
	
	<table border="1">
		<tr>
			<th>아이디</th><th><%=dto.getId() %></th>
		</tr>
		<tr>
			<th>비밀번호</th><th><%=dto.getPwd() %></th>
		</tr>
		<tr>
			<th>이름</th><th><%=dto.getName() %></th>
		</tr>
		<tr>
			<th>주소</th><th><%=dto.getAddr() %></th>
		</tr>
		<tr>
			<th>전화번호</th><th><%=dto.getTel() %></th>
		</tr>
	</table>	
	<button type="button" onclick="location.href='modifyInfo.jsp'">수정</button>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>