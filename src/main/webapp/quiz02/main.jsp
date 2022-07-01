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
</head>
<body>
	<% 
		MembersDAO dao = new MembersDAO();
		ArrayList<MembersDTO> list = dao.getmembers();
		if(session.getAttribute("id")!=null){%>
			<h1>회원만 접속할수있는페이지입니다</h1>			
		<% }else{
			response.sendRedirect("login.jsp");
		}
		%>
	<table border="1">
		<tr>
			<th>아이디</th><th>비밀번호</th><th>이름</th><th>주소</th><th>전화번호</th>
		</tr>
		<%for(MembersDTO dto : list){%>			
		<tr>
			<td><%=dto.getId() %></td><td><%=dto.getPwd() %></td><td><%=dto.getName() %></td><td><%=dto.getAddr()%></td><td><%=dto.getTel() %></td>
		</tr>
	
	
		<%} %>
	</table>		
	<button onclick="location.href='login.jsp'">login.jsp로 이동</button>
	<button onclick="location.href='logout.jsp'">로그아웃</button>

</body>
</html>