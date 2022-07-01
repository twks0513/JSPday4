
<%@page import="quiz01.Quiz01DTO"%>
<%@page import="quiz01.Quiz01DAO"%>
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
		Quiz01DAO dao = new Quiz01DAO();
		Quiz01DTO dto = dao.getUser(request.getParameter("id"));		
		
	%>
	<div style="border: 1px solid red; width: 200px;">
	<H2>인적 사항</H2>
	<h3>학번 : <%=dto.getId() %></h3><p></p>
	<h3>이름 : <%=dto.getName() %></h3><p></p>
	<h3>국,영,수 : <%=dto.getKor() %>,<%=dto.getEng() %>,<%=dto.getMath() %></h3>
	<button onclick="location.href='index.jsp'">뒤로</button>
	</div>
</body>
</html>