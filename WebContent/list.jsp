<%@page import="kosta.model.Board"%>
<%@page import="java.util.List"%>
<%@page import="kosta.model.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");

	BoardService service = BoardService.getInstance();
	List<Board> list = service.listBoardService();
	request.setAttribute("list", list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>게시글 목록</h2>
	<a href="insertform.jsp">글쓰기</a>
	<table border="1" cellpadding="0" cellspacing="0">
		<tr height="30" align="center">
				<td width="50">번호</td>
				<td width="150">글 제목</td>
				<td width="100">작성자</td>
				<td width="100">조회수</td>
				<td width="150">작성일</td>
		</tr>
		<c:forEach var="board" items="${list}">
			<tr height="30" align="center">
				<td width="50" align="center">${board.b_id}</td>
				<td width="150"><a href="detail.jsp?b_id=${board.b_id}">${board.b_title}</a></td>
				<td width="100" align="center">${board.b_name}</td>
				<td width="100" align="center">${board.b_hit}</td>
				<td width="150" align="center">
					<fmt:formatDate value="${board.b_date}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br><br>
	
	<form action="list.jsp" method="post">
		<input type="checkbox" name="area" value="b_title">글제목</input>
		<input type="checkbox" name="area" value="b_name">작성자</input>
		<input type="text" name="searchKey" size="20"/>
		<input type="submit" value="검색"/>
	</form>
	

</body>
</html>