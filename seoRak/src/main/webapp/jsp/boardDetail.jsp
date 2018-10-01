<%@page import="kr.co.seoRak.repository.domain.Board"%>
<%@page import="kr.co.seoRak.repository.mapper.BoardMapper"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.co.seoRak.common.db.MyAppSqlConfig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	Board board = (Board)request.getAttribute("board");
	request.setAttribute("boardNo", board.getBoardNo());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table {
	border: 1px solid black;
	border-collapse: collapse;
	margin: auto;
}

#search {
	height: 100px;
}

#file {
	margin-left: 65%;
}

#btn2 {
	margin-left: 800px;
}

#comm {
	margin-left: 500px;
}

#lo {
	margin-right: 820px;
}

#cow {
	margin-left: 500px;
}

#in {
	margin-left: 61%;
}

#comname {
	margin-left: 60%;
}

ul {
	list-style: none;
	margin-left: 40%;
}

#recom {
	margin-left: 25%;
}
7
</style>
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
</head>
<body>

	<%@include file="topList.jsp"%>

	<h2>상세보기</h2>
	<hr>
	<div>
		<form>
			<table>
				<tr>
					<td><input type="hidden" size="0" value="${board.boardNo}">
						<input type="text" size="2"
						placeholder="<%= board.getBoardCategory()%>"></td>
					<td><input type="text" name="title" id="title" size="100"
						placeholder="<%= board.getBoardTitle()%>"></td>
					<td rowspan="5">
						<button type="submit" name="search" id="search">도서검색</button>
					</td>
				</tr>
				<tr>
					<td rowspan="4">책표지</td>
				</tr>
				<tr>
					<td><input type="text" name="book" id="book" size="100"
						placeholder="책 제목"></td>
				</tr>
				<tr>
					<td><input type="text" name="publisher" id="publisher"
						size="100" placeholder="출판사"></td>
				</tr>
				<tr>
					<td><input type="text" name="author" id="author" size="100"
						placeholder="저자"></td>
				</tr>
				<tr>
					<td><input type="text" name="author" id="author" size="100"
						placeholder="<%= board.getBoardWriter()%>"></td>
				</tr>
				<tr>
					<td colspan="3"><textarea name="" id="" cols="110" rows="10"><%= board.getBoardContent() %></textarea>
					</td>
				</tr>
			</table>





			<hr>
			<button name="btn1" type="button" id="list">
				<a href="<c:url value='list.do'/>">목록으로
			</button>
			<button name="btn2" type="button" id="update">
				<a href="updateForm.do?no=${board.boardNo}">수정</a>
			</button>
			<button name="btn3" type="button" id="delete">
				<a href="delete.do?no=${board.boardNo}">삭제</a>
			</button>
			<input type="file" name="attach" id="file" />
			<!--  
			<a href="<c:url value='delete.do?no=${b.boardNo}'/>">
			-->
	</div>
	<!--  <script type="text/javascript">
		$("#delete").click(function () {
			window.location.replace("/seoRak/jsp/boardDelete.jsp?no")
		})
	</script>-->



</body>
</html>