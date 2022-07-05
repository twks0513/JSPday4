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

	<%Cookie[] carr = request.getCookies();
		MembersDAO dao = new MembersDAO();
		for(Cookie c : carr){
			if(c.getName().equals("autoLoginid")){ //자동로그인 쿠키가 있으면
				MembersDTO dto = dao.getUser(c.getValue()); //쿠키값을 불러온다
				session.setAttribute("id",dto.getId()); 
				session.setAttribute("pwd",dto.getPwd()); 
				session.setAttribute("name", dto.getName());
				response.sendRedirect("main.jsp");
			}else{%>
				<script type="text/javascript">
					location.href="login.jsp"
				</script>
				<%
			}
		}
	%>

</body>
</html>