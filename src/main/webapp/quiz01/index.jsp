<%@page import="quiz01.Quiz01DTO"%>
<%@page import="java.util.ArrayList"%>
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
ArrayList<Quiz01DTO> list = dao.getStudents(); 
%>
<table border="1">
	<tr>
		<th>학번</th><th>이름</th><th>국어</th><th>영어</th><th>수학</th>
	</tr>
	<%
		for(Quiz01DTO dto : list){
	%>				
	<tr>
		<td><%=dto.getId() %></td><td><a href="info.jsp?id=<%=dto.getId() %>"><%=dto.getName() %></a></td><td><%=dto.getKor() %></td><td><%=dto.getEng()%></td><td><%=dto.getMath() %></td>
	</tr>
	<%
		}
	%>
	</table>	

</body>
</html>