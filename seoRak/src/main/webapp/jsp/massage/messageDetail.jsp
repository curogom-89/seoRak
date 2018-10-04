<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table, td {
	border: 1px solid black;
	border-collapse: collapse;
	margin: auto;
	border: 1px solid black
}

.title {
	width: 100px;
}

tb {
	text-align: left;
}

</style>
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
</head>

<body>
<%@include file="../includeBar/topList.jsp" %>
	<h2>글쓰기</h2>
	<hr>
	<div>
		<form action="#" method="post" id="massageDetail">
			<table>
				<tr>
				
					<td class="title">보낸 사람 : </td>
					<td>${sender }</td>
				</tr>

				<tr>
					<td class="title">보낸 시간 : </td>
					<td>${sendtime }</td>
				</tr>
				<tr>
					<td class="title">받은 시간 : </td>
					<td>${readtime }</td>
				</tr>
				<tr>
					<td class="title">쪽지 제목 : </td>
					<td>${title }</td>
				</tr>
				<tr>
					<td colspan="2">${content }</td>
				</tr>
			</table>
		
		</form>
		<button id="mamage"><a href="http://localhost:8000/seoRak/jsp/massage/receivebox.jsp">쪽지함으로 이동</a></button>
	</div>
	
	<%@include file="../includeBar/bottom.jsp"%>
</body>
</html>