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
		request.setCharacterEncoding("utf-8");
		MembersDAO dao = new MembersDAO(); 
		
		int m = dao.modify(request.getParameter("pwd"),request.getParameter("name"),request.getParameter("addr"),request.getParameter("tel"),(String)session.getAttribute("id"));
		
		if(m==1){%>
			<script type="text/javascript">
				alert('수정이 완료되었습니다') 
				location.href='main.jsp'
			</script>
		<%}else if(m == 0){%>
			<script type="text/javascript">
				alert('수정에 실패했습니다') 
				location.href='modifyInfo.jsp'
			</script>
		<%}
		
	%>
</body>
</html>