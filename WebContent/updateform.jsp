<%@page import="kosta.model.Board"%>
<%@page import="kosta.model.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("utf-8");
	
	BoardService service = BoardService.getInstance();
	String id = request.getParameter("b_id");
	int b_id = 0;
	if(id != null) {
		b_id = Integer.parseInt(id);
	}
	Board board = service.selectBoardService(b_id);
	request.setAttribute("board", board);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>수정하기</h2>
	<a href="list.jsp">게시글 목록</a>
	<form action="updateOk.jsp" method="post">
		<input type="hidden" name="b_id" value="${board.b_id}"/>
		<table border="1" cellpadding="0" cellspacing="0">
			<tr height="30" align="center">
				<td width="100">번호</td>
				<td width="100">${board.b_id}</td>
				<td width="100">작성자</td>
				<td width="100">${board.b_name}</td>
				<td width="100">비밀번호</td>
				<td width="100">
					<input type="password" name="b_pwd"/>
				</td>
			</tr>
			<tr height="30">
				<td width="100" align="center">글 제목</td>
				<td colspan="2" align="left">
					<input type="text" name="b_title" placeholder="${board.b_title}"/>
				</td>
				<td width="100" align="center">작성일</td>
				<td colspan="2" align="center">
					<fmt:formatDate value="${board.b_date}" pattern="yyyy.MM.dd hh:mm"/>
				</td>
			</tr>
			<tr height="30">
				<td colspan="6">
					<textarea rows="5" cols="50" name="b_content" placeholder="${board.b_content}"></textarea>
				</td>
			</tr>
			<tr height="30" align="center">
				<td colspan="6">
					<input type="submit" value="수정"/>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>