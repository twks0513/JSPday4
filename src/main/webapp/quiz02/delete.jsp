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
<%
		MembersDAO dao = new MembersDAO();
		MembersDTO dto = dao.getUser((String)session.getAttribute("id"));
		
		dao.delete((String)session.getAttribute("id"));
		session.invalidate();
		%>
		<script type="text/javascript">
		alert('삭제되었습니다')
		location.href='login.jsp'
		</script>
</body>
</html>