<%@page import="kosta.model.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="board" class="kosta.model.Board"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
	BoardService service = BoardService.getInstance();
	int re = service.insertBoardService(board);
	if(re > 0) {
		response.sendRedirect("list.jsp");
	} else {
		out.println("<script type='text/javascript'>alert('입력 실패');history.go(-1);</script>");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>