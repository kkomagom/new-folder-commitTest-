<%@page import="kosta.model.Board"%>
<%@page import="kosta.model.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("b_id");
	int b_ref = 0;
	int b_step = 0;
	int b_level = 0;
	int b_id = 0;
	
	Board board = null;
	if(id != null) {
		b_id = Integer.parseInt(id);
	}
	
	BoardService service = BoardService.getInstance();
	board = service.selectBoardService(b_id);
	if(board != null) {
		b_ref = board.getB_ref();
		b_step = board.getB_step();
		b_level = board.getB_level();
	}
	request.setAttribute("board", board);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv=X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scal=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<h1>글작성하기</h1>
	<form action="insertOk.jsp" method="post">
		<input type="hidden" name="b_fname" value="null"/>
		<input type="hidden" name="b_id" value="<%= b_id %>"/>
		<input type="hidden" name="b_ref" value="<%= b_ref %>"/>
		<input type="hidden" name="b_step" value="<%= b_step %>"/>
		<input type="hidden" name="b_level" value="<%= b_level %>"/>	
		<table border="1" cellpadding="0" cellspacing="0">
		<tr height="30">
			<td width="80">작성자</td>
			<td width="170">
				<input type="text" name="b_name" size="10">
			</td>
			<td width="80">비밀번호</td>
			<td width="170">
				<input type="password" name="b_pwd" size="10">
			</td>		
		</tr>
		<tr height="30">
			<td width="80">제목</td>
			<td align="left" colspan="3">
				<c:choose>
					<c:when test="${param.b_id != null}">
						<c:forEach begin="0" end="${board.b_level}">&nbsp;&nbsp;</c:forEach>
						<input type="text" name="b_title">[re]${board.b_title}</input>
					</c:when>
					<c:otherwise>
						<input type="text" name="b_title" size="50">		
					</c:otherwise>			
				</c:choose>
			</td>			
		</tr>		
		<tr height="30">			
			<td colspan="4">
				<textarea rows="10" cols="70" name="b_content"></textarea>
			</td>			
		</tr>
		<tr height="30">			
			<td colspan="4" align="center">
				<input type="submit" value="글쓰기">&nbsp;&nbsp;
				<input type="reset" value="취소">
			</td>			
		</tr>
	</table>
	</form>
	
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<ul class="nav">
					<li>menu 1</li>
					<li>menu 2</li>
				</ul>
			</div>
			<div class="col-md-10">
				<p>myamya</p>
			</div>
			
		</div>
		
	</div>
	
	
	
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
</body>
</html>










