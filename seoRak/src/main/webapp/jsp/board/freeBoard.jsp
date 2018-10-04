<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.co.seoRak.repository.domain.Board"%>
<%@page import="kr.co.seoRak.common.db.MyAppSqlConfig"%>
<%@page import="kr.co.seoRak.repository.mapper.BoardMapper"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
#write {
	margin-left: 68.5%;
	margin-top: 1%;
}

/*--------------------------------------------------------------------------------------------------------------------------*/
body {
	font-family: "Helvetica Neue", Helvetica, Arial;
	font-size: 14px;
	line-height: 20px;
	font-weight: 400;
	color: #3b3b3b;
	-webkit-font-smoothing: antialiased;
	font-smoothing: antialiased;
}

@media screen and (max-width: 580px) {
	body {
		font-size: 16px;
		line-height: 22px;
	}
}

.wrapper {
	margin: 0 auto;
	padding: 40px;
	max-width: 800px;
}

.table {
	margin: 0 0 40px 0;
	width: 50%;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
	display: table;
	margin: 0px auto;
}

@media screen and (max-width: 580px) {
	.table {
		display: block;
	}
}

.row {
	display: table-row;
	background: #f6f6f6;
}

.row:nth-of-type(odd) {
	background: #e9e9e9;
}

.row.header {
	font-weight: 900;
	color: #ffffff;
	background: #ea6153;
}

.row.green {
	background: #27ae60;
}

.row.blue {
	background: #2980b9;
}

@media screen and (max-width: 580px) {
	.row {
		padding: 14px 0 7px;
		display: block;
	}
	.row.header {
		padding: 0;
		height: 6px;
	}
	.row.header .cell {
		display: none;
	}
	.row .cell {
		margin-bottom: 10px;
	}
	.row .cell:before {
		margin-bottom: 3px;
		content: attr(data-title);
		min-width: 98px;
		font-size: 10px;
		line-height: 10px;
		font-weight: bold;
		text-transform: uppercase;
		color: #969696;
		display: block;
	}
}

.cell {
	padding: 6px 12px;
	display: table-cell;
}

@media screen and (max-width: 580px) {
	.cell {
		padding: 2px 16px;
		display: block;
	}
}

/*--------------------------------------------------top bar----------------------------------------------------------------------------*/
</style>
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>

</head>
<body>

	<%@include file="../includeBar/topList.jsp"%>
	<!-------------------------------------------------- top bar------------------------------------------------------------->
	<br>
	<h1>자유게시판</h1>
	<hr>

	<div class="table">

		<div class="row header blue">
			<div class="cell">번호</div>
			<div class="cell">카테고리</div>
			<div class="cell">제목</div>
			<div class="cell">작성자</div>
			<div class="cell">추천서적</div>
			<div class="cell">추천수</div>
			<div class="cell">조회수</div>
			<div class="cell">작성일</div>
		</div>

		<c:forEach var="b" items="${list}">

		<div class="row">
			<div class="cell">${b.boardNo}</div>
			<div class="cell">${b.boardCategory}</div>
			<div class="cell"><a href="boardDetail.do?no=${b.boardNo}">${b.boardTitle}</a></div>
<%-- 			<div class="cell"><a href="<c:url value='detail.do?no=${b.boardNo}'/>">${b.boardTitle}</a></div> --%>
			<div class="cell">${b.boardWriter}</div>
			<div class="cell">추천서적</div>
			<div class="cell">추천수</div>
			<div class="cell">${b.boardView}</div>
			
			<div class="cell">${b.boardDate}</div>
		</div>

		</c:forEach>

	</div>
	<button type="button" id="write">글쓰기</button>
	

	<script type="text/javascript">
		$("#write").click(function() {
			window.location.replace("/seoRak/jsp/board/boardwrite.jsp");
			
		})
	</script>
		<%@include file="../includeBar/bottom.jsp"%>
</body>
</html>