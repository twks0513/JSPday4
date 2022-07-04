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
	<%MembersDAO dao = new MembersDAO();		
		String id= request.getParameter("id");
		String pw = request.getParameter("pwd");	
		int num = dao.loginCheck(id,pw);
		if(num ==1){	
			MembersDTO dto = dao.getName(request.getParameter("id"));			
			session.setAttribute("id",dto.getId());
			session.setAttribute("name",dto.getName());
			out.print("<script>alert('"+dto.getName()+"님 환영합니다'); location.href='main.jsp';</script>");
			
			%>							
		<%}else if(num ==-1){%>
			<script type="text/javascript">
			alert('비밀번호가 틀렸습니다');	
			location.href="login.jsp";
			</script>
		<%}else if(num ==-2){%>
			<script type="text/javascript">
			alert('등록되지 않은 아이디입니다');
			location.href="login.jsp";
			</script>
		<%} %>

</body>
</html>