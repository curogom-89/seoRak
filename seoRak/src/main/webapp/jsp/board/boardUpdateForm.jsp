<%@page import="kr.co.seoRak.repository.domain.Board"%>
<%@page import="kr.co.seoRak.common.db.MyAppSqlConfig"%>
<%@page import="kr.co.seoRak.repository.mapper.BoardMapper"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%  String title = request.getParameter("title"); 
	String publisher = request.getParameter("publisher");
	String author = request.getParameter("author");
	String img = request.getParameter("img");
	String link = request.getParameter("link");
	String isbn = request.getParameter("isbn");
	String member = request.getParameter("memberId");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table,td,tr {
	border: 1px solid black;
	border-collapse: collapse;
	margin: auto;
	border : 1px solid black;
}

#search {
	height: 100px;
}

#btn1 {
	margin-left: 65%;
}

#file {
	margin-left: 65%;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="../includeBar/topList.jsp"%>
	<h1>수정하기</h1>
	<hr>
	<div>
		<form action="/seoRak/boardupdate.do?cover=<%= img%>&link=<%= link%>&isbn=<%= isbn%>" id="boardupdateForm" method="post">
			<table>
				<tr>
					<input type='hidden' name="boardNo" value='${board.boardNo}' />
					<td><select name="category" id="category">
							<option value="0">선택</option>
							<option value="추천">추천</option>
							<option value="비평">비평</option>
							<option value="자유">자유</option>
					</select></td>
					<td><input type="text" name="title" id="title" size="100"
						placeholder="${board.boardTitle }"></td>
					<td rowspan="5">
						<button type="button" name="search" id="search"><a href='<c:url value="/jsp/board/boardBookSearchUpdate.jsp"/>'>도서검색</a></button>
					</td>
				</tr>
				<tr>
					<td rowspan="4"><img name="boardBookCover" src="<%= img%>"></td>
				</tr>
				<tr>
					<td><input type="text" name="boardBookPublisher" id="book" size="100"
						placeholder="책 제목" value="<%= title%>"></td>
				</tr>
				<tr>
					<td><input type="text" name="publisher" id="publisher"
						size="100" placeholder="출판사" value="<%= publisher %>"></td>
				</tr>
				<tr>
					<td><input type="text" name="author" id="author" size="100"
						placeholder="작성자" value="<%= author%>"></td>
				</tr>
				<tr>
					<td colspan="3"><textarea name="content" id="content" cols="110" rows="10">${board.boardContent}</textarea>
					</td>
				</tr>
			</table>
			<hr>
			<input type="file" name="attach" id="file" />
			<hr>
			<!-- file : <input type="file" name="attach" /> -->
			<button name="btn1" type="button" id="btn1"><a href="boardlist.do">목록으로</a></button>
			<button name="btn2" type="submit" id="update">수정</button>
			
		</form>
	</div>
	
	 <!--<script type="text/javascript">
		$("#update").click(function () {
			$("#update").submit()
		})  
	</script>-->
	<!-- <script type="text/javascript">
		$("#update").click(function () {
			window.location.replace("/seoRak/board/list.do")
		})
	</script>-->
			<%@include file="../includeBar/bottom.jsp"%>
</body>
</html>