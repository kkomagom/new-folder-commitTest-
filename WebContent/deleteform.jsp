<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("b_id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>삭제하기</h2>
	<a href="list.jsp">게시글 목록</a>
	<form action="deleteOk.jsp" method="post">
		<input type="hidden" name="b_id" value="${param.b_id}"/>
		비밀번호 : <input type="password" name="b_pwd"/>
		<input type="submit" value="삭제"/>
	</form>
</body>
</html>