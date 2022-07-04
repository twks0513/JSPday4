<%@page import="quiz02.MembersDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="quiz02.MembersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
td {text-align: center;}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<% 
		request.setCharacterEncoding("UTF-8");
		MembersDAO dao = new MembersDAO();
		ArrayList<MembersDTO> list = dao.getmembers();
		
		
		if(session.getAttribute("id")!=null){%>
		<div align="center">
			<h1>회원만 접속할수있는 페이지입니다</h1>	
		</div>		
		<% }else{
			response.sendRedirect("login.jsp");
		}
		%>
		
<div align="center">
	<table border="1">
		<tr>
			<th>아이디</th><th>비밀번호</th><th>이름</th><th>주소</th><th>전화번호</th>
		</tr>
		<%for(MembersDTO dto : list){%>			
		<tr>
			<td><%=dto.getId() %></td><td><%=dto.getPwd() %></td><td><%=dto.getName() %></td><td><%=dto.getAddr()%></td><td><%=dto.getTel() %></td>
		</tr>	
		<%} %>
	</table><br>
	</div>
<%@ include file="footer.jsp" %>
</body>
</html>