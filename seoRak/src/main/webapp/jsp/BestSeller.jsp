<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="kr.co.seoRak.common.db.MyAppSqlConfig" %>
<%@ page import ="kr.co.seoRak.repository.mapper.RankingMapper" %>
<%@ page import ="kr.co.seoRak.repository.domain.RankingBookInfo" %>
<%@ page import ="kr.co.seoRak.repository.domain.RankingRankingInfo" %>
<%@ page import ="kr.co.seoRak.repository.mapper.LoginMapper" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%! 
RankingMapper mapper =MyAppSqlConfig.getSqlSessionInstance().getMapper(RankingMapper.class);
RankingBookInfo bookinfo = new RankingBookInfo();
 
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	box-sizing: border-box
}

table {
	border-collapse: collapse;
	width: 100%;
	background: #fff;
}

th {
	background-color: #326295;
	font-weight: bold;
	color: #fff;
	white-space: nowrap;
}

td, th {
	padding: 1em 1.5em;
	text-align: left;
}

tbody th {
	background-color: #2ea879;
}

tbody th {
	background-color: #2ea879;
}

tbody tr:nth-child(2n-1) {
	background-color: #f5f5f5;
	transition: all .125s ease-in-out;
}

tbody tr:hover {
	background-color: rgba(50, 98, 149, .3);
}

#BestSeller {
	align-content:center;
	width: 1020px;
	font-family: fantasy;
	float: left;
	padding-left: 30px;
	margin-left: 20%;
	padding-right: 0px;
	margin-right: 10px;
	font-size: 11px;
}

#weeksBestSeller {
align-content:center;
	width: 1000px;
	margin-left: 20px;
	font-family: fantasy;
	padding-left: 35px;
	margin-left: 23%;
	height: 1000px;
	padding-left: 10px;
	font-size: 11px;
}

tr, td {
	border: solid thin;;
	margin: auto;
}

.time {
	margin: auto;
	text-align: center;
}

.selectBookmarket {
	margin-left: 181px;
}

.selectDate {
	margin-left: 0%;
}

.selectbutton {
	margin-left: 181px;
}

.selectDate {
	margin-left: 181px;
}

#BestSeller #title, #BestSeller #timeMonth, #weeksBestSeller #timeDetail,
	#weeksBestSeller #weekTitle {
	margin-left: auto;
	font-style: italic;
	font-weight: bold;
	font-size: 15px;
	color: #326295;
}

#BestSeller  #table1 {
	width: 429.6;
	height: 1569.6px;
}

#BestSeller  #table2 {
	width: 429.6;
	height: 1569.6px;
}
</style>

</head>
<body>


	<%@include file="topList.jsp"%>

	<div class="time">
		<h1>베스트셀러</h1>
	</div>



	<!-- <div class="selectDate">
		<input type="week" name="mydata" value="2018-09-15" />
	</div>



	<div class="selectbutton">
		<button>선택</button>
	</div> -->

	<br>
	<br>

	<div id="BestSeller">
		<span id="title" style="font-size: 15px; float: center">월간베스트셀러</span>
		<span id="timeMonth" style="float: right;">2018년 9월</span>
		<table id="table1">
			<thead>
				<tr>
					<th>순위</th>
					<th>표지</th>
					<th>책이름</th>
					<th>출판사</th>
					<th>저자</th>
					<th>발간일</th>
					<th style="font-size: 3px;">별점</th>

				</tr>
			</thead>
			<tbody>
				<%for(int i =1 ; i<=5 ; i++){ %>
				<tr>
					<td><%= mapper.RankingselectByIsbn(i) %></td>
					<td><img src="<%=mapper.selecbookimg(mapper.IsbnselectByranking(i))%>"/></td>
					<td><%= mapper.selectTitle1(mapper.IsbnselectByranking(i)) %></td>
					<td><%= mapper.selecPublisher(mapper.IsbnselectByranking(i)) %></td>
					<td><%= mapper.Author(mapper.IsbnselectByranking(i)) %></td>
					<td><%= mapper.selecpubdate(mapper.IsbnselectByranking(i)) %></td>
				</tr>
				<%}%>
			</tbody>
		</table>
	</div>

	<div id="weeksBestSeller">
		<span id="weekTitle">주간베스트셀러</span> <span id="timeDetail"
			style="float: right;">2018년 9월 3째주</span>
		<table style="margin: auto;">
			<thead>
				<tr>
					<th>순위</th>
					<th>그림</th>
					<th>책이름</th>
					<th>출판사</th>
					<th>발간일</th>
					<th>그림</th>
					<th>순위변동</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td><img
						src="<c:url value='https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914'/>" /></td>
					<td>돌이킬 수 없는 약속</td>
					<td>출판사</td>
					<td>야쿠마루 가쿠 저</td>
					<td>2017.02.02</td>
					<td>3계단 상승</td>
				</tr>
				<tr>
					<td>2</td>
					<td><img
						src="<c:url value='https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914'/>" /></td>
					<td>돌이킬 수 없는 약속</td>
					<td>출판사</td>
					<td>야쿠마루 가쿠 저</td>
					<td>2017.02.02</td>
					<td>new</td>
				</tr>
				<tr>
					<td>3</td>
					<td><img
						src="<c:url value='https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914'/>" /></td>
					<td>돌이킬 수 없는 약속</td>
					<td>출판사</td>
					<td>야쿠마루 가쿠 저</td>
					<td>2017.02.02</td>
					<td>new</td>
				</tr>
				<tr>
					<td>4</td>
					<td><img
						src="<c:url value='https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914'/>" /></td>
					<td>돌이킬 수 없는 약속</td>
					<td>출판사</td>
					<td>야쿠마루 가쿠 저</td>
					<td>2017.02.02</td>
					<td>new</td>
				</tr>
				<tr>
					<td>5</td>
					<td><img
						src="<c:url value='https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914'/>" /></td>
					<td>돌이킬 수 없는 약속</td>
					<td>출판사</td>
					<td>야쿠마루 가쿠 저</td>
					<td>2017.02.02</td>
					<td>3계단 하락</td>
				</tr>
				<tr>
					<td>6</td>
					<td><img
						src="<c:url value='https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914'/>" /></td>
					<td>돌이킬 수 없는 약속</td>
					<td>출판사</td>
					<td>야쿠마루 가쿠 저</td>
					<td>2017.02.02</td>
					<td>new</td>
				</tr>
				<tr>
					<td>6</td>
					<td><img
						src="<c:url value='https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914'/>" /></td>
					<td>돌이킬 수 없는 약속</td>
					<td>출판사</td>
					<td>야쿠마루 가쿠 저</td>
					<td>2017.02.02</td>
					<td>new</td>
				</tr>
				<tr>
					<td>7</td>
					<td><img
						src="<c:url value='https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914'/>" /></td>
					<td>돌이킬 수 없는 약속</td>
					<td>출판사</td>
					<td>야쿠마루 가쿠 저</td>
					<td>2017.02.02</td>
					<td>new</td>
				</tr>
				<tr>
					<td>8</td>
					<td><img
						src="<c:url value='https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914'/>" /></td>
					<td>돌이킬 수 없는 약속</td>
					<td>출판사</td>
					<td>야쿠마루 가쿠 저</td>
					<td>2017.02.02</td>
					<td>new</td>
				</tr>
				<tr>
					<td>9</td>
					<td><img
						src="<c:url value='https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914'/>" /></td>
					<td>돌이킬 수 없는 약속</td>
					<td>출판사</td>
					<td>야쿠마루 가쿠 저</td>
					<td>2017.02.02</td>
					<td>new</td>
				</tr>
				<tr>
					<td>10</td>
					<td><img
						src="<c:url value='https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914'/>" /></td>
					<td>돌이킬 수 없는 약속</td>
					<td>출판사</td>
					<td>야쿠마루 가쿠 저</td>
					<td>2017.02.02</td>
					<td>new</td>
				</tr>
			</tbody>
		</table>

	</div>


</body>
</html>