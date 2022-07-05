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
		request.setCharacterEncoding("utf-8");
		MembersDAO dao = new MembersDAO();		
		String id= request.getParameter("id");
		String pw = request.getParameter("pwd");	
		int num = dao.loginCheck(id,pw);
		if(request.getParameter("id_save")!=null){
			Cookie cookie = new Cookie("idsave",request.getParameter("id"));
			cookie.setMaxAge(600);
			response.addCookie(cookie);			
		}else if(request.getParameter("id_save")==null){
			Cookie cookie = new Cookie("idsave","saveid");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		if(num ==1){	
			MembersDTO dto = dao.getUser(request.getParameter("id"));
			session.setAttribute("name",dto.getName());
			if(request.getParameter("auto")!=null){ //체크박스 체크
				session.setAttribute("id",dto.getId()); //입력아이디 세션등록
				session.setAttribute("pwd",dto.getPwd()); //입력 비밀번호 세션등록
				Cookie idcookie = new Cookie("autoLoginid",request.getParameter("id")); //쿠키생성
				Cookie pwcookie = new Cookie("autoLoginpw",request.getParameter("pwd")); //쿠키생성
				idcookie.setMaxAge(120);				//2분유지
				pwcookie.setMaxAge(120);				//2분유지
				response.addCookie(idcookie);				//쿠키얻어옴
				response.addCookie(pwcookie);				//쿠키얻어옴
			}else if(request.getParameter("auto")==null){
				session.setAttribute("id",dto.getId());
				session.setAttribute("pwd",dto.getPwd());
				Cookie idcookie = new Cookie("autoLoginid",request.getParameter("id")); //쿠키생성
				Cookie pwcookie = new Cookie("autoLoginpw",request.getParameter("pwd")); //쿠키생성
				idcookie.setMaxAge(0);				//1분유지
				pwcookie.setMaxAge(0);				//1분유지
				response.addCookie(idcookie);				//쿠키얻어옴
				response.addCookie(pwcookie);	
			}
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