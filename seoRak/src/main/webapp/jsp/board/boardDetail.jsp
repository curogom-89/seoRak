<%@page import="kr.co.seoRak.repository.domain.Board"%>
<%@page import="kr.co.seoRak.repository.mapper.BoardMapper"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.co.seoRak.common.db.MyAppSqlConfig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	Board board = (Board) request.getAttribute("board");
	request.setAttribute("boardNo", board.getBoardNo());
	String title = request.getParameter("title"); 
	String publisher = request.getParameter("publisher");
	String author = request.getParameter("author");
	String img = request.getParameter("img");
	String link = request.getParameter("link");
	String isbn = request.getParameter("isbn");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table, td, tr {
	border: 1px solid black;
	border-collapse: collapse;
	margin: auto;
	border: 1px solid black;
}

#commin {
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
</style>
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
</head>
<body>

	<%@include file="../includeBar/topList.jsp"%>


	<h1>상세보기</h1>
	<hr>
	<div>
		<form action="/seoRak/jsp/board/boardDetail.do" method="post">
			<table>
				<tr>
					<td><input type="hidden" size="0" value="${board.boardNo}">
						<input type="text" size="2"
						placeholder="<%=board.getBoardCategory()%>"></td>
					<td><input type="text" name="title" id="title" size="100"
						placeholder="<%=board.getBoardTitle()%>"></td>
					<td rowspan="6">
						<button type="button" name="search" id="search">도서검색</button>
					</td>
				</tr>
				<tr>
					<td rowspan="5">
						<img src="<%= img %>" /></td>
				</tr>
				<tr>
					<td><input type="text" name="booktitle" id="book" size="100"
						placeholder="책 제목" value="<%= title%>"></td>
				</tr>
				<tr>
					<td><input type="text" name="bookpublisher" id="publisher"
						size="100" placeholder="출판사" value="<%= publisher %>"></td>
				</tr>
				<tr>
					<td><input type="text" name="bookauthor" id="author" size="100"
						placeholder="저자" value="<%= author%>"></td>
				</tr>
				<tr>
					<td><input type="text" name="memberId" id="memberid" size="100"
						placeholder="<%=board.getBoardWriter()%>"></td>
				</tr>
				<tr>
					<td colspan="3"><textarea name="" id="" cols="110" rows="10"><%=board.getBoardContent()%></textarea>
					</td>
				</tr>
			</table>





			<hr>
			<button name="btn1" type="button" id="list">
				<a href="<c:url value='boardlist.do'/>">목록으로 
			</button>
			<button name="btn2" type="button" id="update">
				<a href="boardupdateForm.do?no=${board.boardNo}">수정</a>
			</button>
			<button name="btn3" type="button" id="delete">
				<a href="/seoRak/boarddelete.do?no=${board.boardNo}">삭제</a>
			</button>
			<input type="file" name="attach" id="file" />
			<!--  
			<a href="<c:url value='delete.do?no=${b.boardNo}'/>">
			-->
	</div>
	</form>
	<hr>

	<button type="submit" name="recom" id="recom">추천</button>
	<button type="submit" name="fal" id="fal">비추천</button>
	<!-- <button type="submit" name="del" id="del">삭제</button>
        <button type="submit" name="up" id="up">수정</button>
        <button type="submit" name="list" id="list">목록</button> -->
	</div>
	<!--  <hr>
       <h2 id="comm">comment</h2>
       <hr width="200px" size="3" color="black" id="lo">
       <textarea name="contents" rows="8" cols="70" id="cow"></textarea>
       <div>
       <button type="button" name="in" id="in">입력</button>
       
        </div>
        <hr>
                <button type="button" id="comname">수정</button>
                <button type="button">삭제</button>-->
	<!--  <script type="text/javascript">
		$("#delete").click(function () {
			window.location.replace("/seoRak/jsp/boardDelete.jsp?no")
		})
	</script>-->
	<div>
		<hr>
		<h3>댓글</h3>
		<div id="comment">
		<form method="post" action="/seoRak/comment-write.do">
			<input type="hidden" name="no" value="${board.boardNo}" />	
			<table width="70%">
			<tr id="commin">
				<td><input type="text" name="writer" /></td>
				<td><input type="text" name="content" /></td>
				<td><input type="submit" value="등록" /></td>
			</tr>	
			</table>
		</form>
		</div>
	</div>
	
	<form action="/seoRak/comment-update.do" method="post">
		<input type="hidden" name="no" value="${board.boardNo}" />
		<input type="hidden" name="commentNo" value="${commentNo}" />
	<div id="commentList">
		
	  <table width='80%' border='1'>
	  <tr>
		<c:forEach var="comment" items="${commentList}">
		<c:choose>
	  		<c:when test="${commentNo eq comment.commentNo}">	
				<tr>
				  <td><c:out value="${comment.commentWriter}" /></td>
				  <td>
				  	<input type="text" name="content" /><c:out value="${comment.commentContent}" />
				  </td>
				  <td colspan="2">
				  	  <input type="submit" value="수정" />	
				  	  <a href="boardDetail.do?no=${board.boardNo}">취소</a>	
				  </td>
				 </tr>
		 	</c:when>
		 	<c:otherwise>
				<tr>
				  <td><c:out value="${comment.commentWriter}" /></td>
				  <td>
				  		<c:out value="${comment.commentContent}" /></td>
				  <td><fmt:formatDate var="regDate" value="${comment.commentDate}" 
				                      pattern="yyyy-MM-dd HH:mm:ss" />
				      <c:out value="${commentDate}" />
				  </td>
				  <td>
				  	  <a href="/seoRak/comment-delete.do?commentNo=${comment.commentNo}&no=${comment.boardNo}">삭제</a>	
				  	  <a href="/seoRak/boardDetail.do?commentNo=${comment.commentNo}&no=${comment.boardNo}">수정</a>	
				  </td>
				 </tr>
		 	</c:otherwise>
		 </c:choose>	
		 </c:forEach>
		 <c:if test="${empty commentList}">
		 <tr>
		    <td colspan='4'>댓글이 존재하지 않습니다.</td>
		 </tr>
	 	</c:if>
	 </table>
	</div>
	</form>	
		<%@include file="../includeBar/bottom.jsp"%>
</body>
</html>