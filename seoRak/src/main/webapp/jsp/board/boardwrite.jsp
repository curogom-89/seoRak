<%@page import="kr.co.seoRak.repository.domain.Book"%>
<%@page import="kr.co.seoRak.repository.domain.BoardBook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String title = request.getParameter("title");
	String publisher = request.getParameter("publisher");
	String author = request.getParameter("author");
	String img = request.getParameter("img");
	String link = request.getParameter("link");
	String isbn = request.getParameter("isbn");
	String memberId = request.getParameter("memberId");
	String cover = request.getParameter("cover");
	String booktitle = request.getParameter("booktitle");
	String bookpublisher = request.getParameter("bookpublisher");
	String bookauthor = request.getParameter("bookauthor");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table, td, tr {
	border: 1px solid black;
	border-collapse: collapse;
	margin: auto;
	border: 1px solid black;
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
	<%@include file="../includeBar/topList.jsp" %>
	<h1>글쓰기</h1>

	<hr>
	<div>
		<form
			action="/seoRak/boardwriter.do?cover=<%=img%>&link=<%=link%>&isbn=<%=isbn%>"
			method="post" id="writeForm">
			<table>
				<tr>
					<td><select name="category" id="category">
							<option value="0">선택</option>
							<option value="추천">추천</option>
							<option value="비평">비평</option>
							<option value="자유">자유</option>
					</select></td>
					<td><input type="text" name="title" id="title" size="100"
						placeholder="제목을 입력하세요"></td>
					<td rowspan="6">
						<button type="button" name="search" id="search">
							<a href='<c:url value="boardBookSearch.jsp"/>'>도서검색</a>
						</button>
					</td>
				</tr>
				<tr>
					<td rowspan="5"><img name="cover" id="cover" src="<%=img%>">
					</td>
				</tr>
				<tr>
					<td><input type="text" name="booktitle" id="book" size="100"
						placeholder="책 제목" value="<%=title%>"></td>
				</tr>
				<tr>
					<td><input type="text" name="bookpublisher" id="publisher"
						size="100" placeholder="출판사" value="<%=publisher%>"></td>
				</tr>
				<tr>
					<td><input type="text" name="bookauthor" id="author"
						size="100" placeholder="저자" value="<%=author%>"></td>
				</tr>
				<tr>
					<td><input type="text" name="memberId" id="author" size="100"
						placeholder="저자" value="${user.memberNickname}"></td>
				</tr>
				<tr>
					<td colspan="3"><textarea name="content" id="content"
							cols="110" rows="10"></textarea></td>
				</tr>
			</table>
			<hr>
			<input type="file" name="attach" id="file" />
			<hr>
			<!-- file : <input type="file" name="attach" /> -->
			<button name="btn1" type="button" id="btn1">
				<a href="http://localhost:8000/seoRak/boardlist.do">목록으로</a>
			</button>
			<button name="btn2" type="button" id="btn2">
				<a href="#">작성</a>
			</button>
			<button name="btn3" type="button" id="btn3">초기화</button>
		</form>
	</div>

	<script type="text/javascript">
		$("#btn2").click(function() {
			$("#writeForm").submit()
		})
	</script>

</body>
</html>