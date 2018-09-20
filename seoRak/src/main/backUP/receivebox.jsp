<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
h2 {
	margin-left: 100px;
}

#me {
	width: 100%;
	margin-left: 100px;
}

#del {
	margin-left: 69.4%;
	margin-top: 1%;
}

<!--
------------------------------------
-recivebox 이줄 아래부터-------------------->body {
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
<!--
-------------------------------------
-recive
 
끝--------------------
>
</style>
</head>
<body>
	<h2>받은 쪽지함</h2>
	<hr>
	<div>
		<table id="me">
			<tr id="m1">
				<td>받은 쪽지함 목록조회 :</td>
				<td id="m2">받은 날짜 : <input type="date" id="udate" name="udate"
					value=""></td>

				<td><select name="area" id="s1">
						<option value="1">쪽지제목</option>
						<option value="2">쪽지내용</option>
						<option value="3">보낸사람</option>
						<option value="4">닉네임</option>
						<option value="5" selected>--선택하세요--</option>
				</select> <input type="text" name="sn" id="t1">
					<button type="button">조회</button></td>

			</tr>
		</table>
	</div>
	<hr>

	<div class="table">

		<div class="row header green">
			<div class="cell">보낸사람</div>
			<div class="cell">내용</div>
			<div class="cell">보낸날짜</div>
			<div class="cell">읽은시간</div>
			<div class="cell">삭제</div>
		</div>

		<div class="row">
			<div class="cell" data-title="Product">John</div>
			<div class="cell" data-title="Unit Price">탈주</div>
			<div class="cell" data-title="Quantity">2018-09-15</div>
			<div class="cell" data-title="Date Sold">2018-09-16</div>
			<div class="cell" data-title="Status">
				<input id="f1" type="checkbox" name="del" value="1" checked /> <label
					for="f1">삭제</label>
			</div>
		</div>

		<div class="row">
			<div class="cell" data-title="Product">임유신</div>
			<div class="cell" data-title="Unit Price">잠이나자자</div>
			<div class="cell" data-title="Quantity">2018-09-15</div>
			<div class="cell" data-title="Date Sold">2018-09-16</div>
			<div class="cell" data-title="Status">
				<input id="f1" type="checkbox" name="del" value="1" checked /> <label
					for="f1">삭제</label>
			</div>
		</div>

		<div class="row">
			<div class="cell" data-title="Product">정인용</div>
			<div class="cell" data-title="Unit Price">망함</div>
			<div class="cell" data-title="Quantity">2018-09-15</div>
			<div class="cell" data-title="Date Sold">2018-09-16</div>
			<div class="cell" data-title="Status">
				<input id="f1" type="checkbox" name="del" value="1" checked /> <label
					for="f1">삭제</label>
			</div>
		</div>

		<div class="row">
			<div class="cell" data-title="Product">신득수</div>
			<div class="cell" data-title="Unit Price">소식없음</div>
			<div class="cell" data-title="Quantity">2018-09-15</div>
			<div class="cell" data-title="Date Sold">2018-09-16</div>
			<div class="cell" data-title="Status">
				<input id="f1" type="checkbox" name="del" value="1" checked /> <label
					for="f1">삭제</label>
			</div>
		</div>

		<div class="row">
			<div class="cell" data-title="Product">John</div>
			<div class="cell" data-title="Unit Price">영업중</div>
			<div class="cell" data-title="Quantity">2018-09-15</div>
			<div class="cell" data-title="Date Sold">2018-09-16</div>
			<div class="cell" data-title="Status">
				<input id="f1" type="checkbox" name="del" value="1" checked /> <label
					for="f1">삭제</label>
			</div>
		</div>

		<div class="row">
			<div class="cell" data-title="Product">방진웅</div>
			<div class="cell" data-title="Unit Price">kil</div>
			<div class="cell" data-title="Quantity">2018-09-15</div>
			<div class="cell" data-title="Date Sold">2018-09-16</div>
			<div class="cell" data-title="Status">
				<input id="f1" type="checkbox" name="del" value="1" checked /> <label
					for="f1">삭제</label>
			</div>
		</div>
	</div>

	<button type="button" id="del">삭제</button>
	<button type="button" id="sav">보관</button>

</body>
</html>