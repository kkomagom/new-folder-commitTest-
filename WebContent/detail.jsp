<%@page import="kosta.model.Board"%>
<%@page import="kosta.model.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("b_id");
	BoardService service = BoardService.getInstance();
	int b_id = 0;
	if(id != null) {
		b_id = Integer.parseInt(id);
		service.updateHitService(b_id);
	}
	Board board = service.selectBoardService(b_id);
	request.setAttribute("board", board);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_update() {
		location.href="updateform.jsp?b_id=${board.b_id}";
	}
	function fn_delete() {
		location.href="deleteform.jsp?b_id=${board.b_id}";
	}
	function fn_reBoard() {
		location.href="insertform.jsp?b_id=${board.b_id}";
	}
</script>
</head>
<body>

	<h2>글 세부 보기</h2>
	<a href="list.jsp">게시글 목록</a>
	<table border="1" cellpadding="0" cellspacing="0">
		<tr height="30" align="center">
			<td width="100">번호</td>
			<td width="100">${board.b_id}</td>
			<td width="100">작성자</td>
			<td width="100">${board.b_name}</td>
			<td width="100">조회수</td>
			<td width="100">${board.b_hit}</td>
		</tr>
		<tr height="30">
			<td align="center">제목</td>
			<td colspan="2" align="left">${board.b_title}</td>
			<td align="center">작성일</td>
			<td colspan="2" align="center">
				<fmt:formatDate value="${board.b_date}" pattern="yyyy.MM.dd hh:mm"/>
			</td>
		</tr>
		<tr height="50">
			<td colspan="6">${board.b_content}</td>
		</tr>
		<tr height="30" align="center">
			<td colspan="6">
				<input type="button" value="수정" onclick="fn_update()"/>
				<input type="button" value="삭제" onclick="fn_delete()"/>
				<input type="button" value="답변글작성" onclick="fn_reBoard()"/>
			</td>
		</tr>
	</table>

</body>
</html>