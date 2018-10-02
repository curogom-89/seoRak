<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.co.seoRak.repository.domain.Member"%>
<%@page import="kr.co.seoRak.repository.domain.Message"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.seoRak.common.db.MyAppSqlConfig"%>
<%@page import="kr.co.seoRak.repository.mapper.MessageMapper"%>
<%@page import="org.apache.catalina.mapper.Mapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	margin-left: 64.5%;
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
form {
display: inline;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
	
<% 
	HttpSession see = request.getSession();
	Member member = (Member) see.getAttribute("user");
	MessageMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(MessageMapper.class);
	List<Message> list = mapper.receiveList(member.getMemberNickname());
%>
</head>
<body>
<%@include file="topList.jsp" %>
	<h2>받은 쪽지함</h2>
	<hr>
	<div>
		<table id="me">
			<tr id="m1">
				<td><a href="sendbox.jsp"><button type="button">보낸 쪽지함</button></a></td>
				
			</tr>
		</table>
	</div>
	<hr>
<form action="/seoRak/message/receiveDelete.do">
	<div class="table">

		<div class="row header green">
			<div class="cell">보낸사람</div>
			<div class="cell">쪽지제목</div>
			<div class="cell">보낸날짜</div>
			<div class="cell">읽은시간</div>
			<div class="cell">삭제</div>
		</div>
		<%for (Message message : list){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String recvTime = "읽지 않음";
			try {
				recvTime = sdf.format(message.getReadDate());
			} catch (Exception e) {
				;;
			}
			String sendTime = sdf.format(message.getSendDate());
		%>
			
		<div class="row">
			<div class="cell" data-title="Product"><%=message.getSendId() %></div>
			<div class="cell" data-title="Unit Price"><a href='<c:url value="/message/read.do"/>?no=<%=message.getMessageNo()%>'/><%=message.getMessageTitle() %></a></div>
			<div class="cell" data-title="Quantity"><%=sendTime %></div>
			<div class="cell" data-title="Date Sold"><%=recvTime %></div>
			<div class="cell" data-title="Status">
				<input id="f1" type="checkbox" name="delCheck" value="<%=message.getMessageNo() %>" /> 삭제
			</div>
		</div>
		<% }%>
	</div>
	<button id="del">삭제</button>
	<a href="message.jsp"><button type="button" id="writer">쪽지 쓰기</button></a>
</form>

</body>
</html>