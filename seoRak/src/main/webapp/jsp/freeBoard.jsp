<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<body>
<%@include file="topList.jsp" %>
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
			<div class="cell">별점</div>
			<div class="cell">추천수</div>
			<div class="cell">조회수</div>
			<div class="cell">작성일</div>
		</div>

		<div class="row">
			<div class="cell" data-title="Username">1</div>
			<div class="cell" data-title="Email">추천</div>
			<div class="cell" data-title="Password">오늘 점심</div>
			<div class="cell" data-title="Active">신득수</div>
			<div class="cell" data-title="Active">오늘만 산다</div>
			<div class="cell" data-title="Active">3</div>
			<div class="cell" data-title="Active">22</div>
			<div class="cell" data-title="Active">50</div>
			<div class="cell" data-title="Active">2018-09-13</div>
		</div>

		<div class="row">
			<div class="cell" data-title="Username">2</div>
			<div class="cell" data-title="Email">자유</div>
			<div class="cell" data-title="Password">내일아침</div>
			<div class="cell" data-title="Active">방진웅</div>
			<div class="cell" data-title="Active">이것이 자바다</div>
			<div class="cell" data-title="Active">5</div>
			<div class="cell" data-title="Active">50</div>
			<div class="cell" data-title="Active">50</div>
			<div class="cell" data-title="Active">2018-09-13</div>
		</div>

		<div class="row">
			<div class="cell" data-title="Username">3</div>
			<div class="cell" data-title="Email">비평</div>
			<div class="cell" data-title="Password">내일 저녁</div>
			<div class="cell" data-title="Active">최창유</div>
			<div class="cell" data-title="Active">자바의 정석</div>
			<div class="cell" data-title="Active">5</div>
			<div class="cell" data-title="Active">80</div>
			<div class="cell" data-title="Active">200</div>
			<div class="cell" data-title="Active">2018-09-13</div>
		</div>
	</div>
	<button type="button" id="write">글쓰기</button>
	<button type="button" id="re">수정</button>

</body>
</html>