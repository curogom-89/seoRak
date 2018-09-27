<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<body>
<%@include file="topList.jsp" %>
	<h2>글쓰기</h2>
	<hr>
	<div>
		<form action="myList/Write.do">
		<!--  http://localhost:8000/seoRak/myList/Write.do  -->
			<table>
				<tr>
					<td rowspan="5">책표지</td>
					<td>
						<input type="text" name="title" id="title" size="100" placeholder="제목을 입력하세요">
					</td>
					<td rowspan="5">
					<!-- http://localhost:8000/seoRak/jsp/search.jsp -->
						<a href="myListBookSearch.jsp">도서검색</a>
					</td>
				</tr>
				<tr>
					
				</tr>
				<tr>
					<td>
						<input type="text" name="book" id="book" size="100" placeholder="책 제목">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="publisher" id="publisher" size="100" placeholder="출판사"></td>
					</tr>
				<tr>
					<td>
						<input type="text" name="author" id="author" size="100" placeholder="저자">
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<textarea name="" id="" cols="110" rows="10"></textarea>
					</td>
				</tr>
			</table>
			<!-- file : <input type="file" name="attach" /> -->
			<button name="btn1" type="submit" id="btn1"><a href="myList.jsp">목록으로</a></button>
			<button name="btn2" type="submit" id="btn2">작성</button>
		</form>
	</div>

</body>
</html>