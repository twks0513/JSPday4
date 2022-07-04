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
		request.setCharacterEncoding("UTF-8");
	
		MembersDAO dao = new MembersDAO();
		
		int chk = dao.joinCheck(request.getParameter("id"), request.getParameter("pwd"), request.getParameter("name"),
				request.getParameter("addr"), request.getParameter("tel"));
			
		
		if(chk==1){%>
			<script type="text/javascript">
				alert('회원가입이 완료되었습니다')
				location.href='login.jsp'
			</script>
		<%}else{%>
		<script type="text/javascript">
				alert('회원가입이 실패했습니다')
				location.href='login.jsp'
			</script>
		<%} %> 
</body>
</html>