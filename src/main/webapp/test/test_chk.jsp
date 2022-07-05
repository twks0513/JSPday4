<%@page import="test.TestDAO"%>
<%@page import="test.TestDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>test_chk.jsp<br>
<%-- 	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		TestDTO dto = new TestDTO();
		dto.setId(id); dto.setPwd(pwd);
		
		TestDAO dao = new TestDAO();
		dao.test(dto);
	%> --%>
	
	<jsp:useBean id="dao" class="test.TestDAO"/> <%--JSP태그로 객체생성 --%>
	<jsp:useBean id="dto" class="test.TestDTO"/>
	<jsp:setProperty property="*" name="dto"/> <!-- 변수에 채워주기 -->
	<%=dto.getId() %>
	<%=dto.getPwd() %>
	<%=dto.getName() %>
	<%=dto.getAddr() %>
	<%=dto.getTel() %>
</body>
</html>