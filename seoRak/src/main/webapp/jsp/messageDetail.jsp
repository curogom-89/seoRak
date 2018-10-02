<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border: 1px solid black;
	border-collapse: collapse;
	margin: auto;
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
<%@include file="topList.jsp" %>
	<h2>글쓰기</h2>
	<hr>
	<div>
		<form action="#" method="post" id="massageDetail">
			<table>
				<tr>
				
					<td>보낸 사람 : <input type="text" name="title" id="title" size="30px;"
						placeholder="보낸 사람"></td>
				</tr>

				<tr>
					<td>보낸 시간 : <input type="text" name="book" id="book" size="30px;"
						placeholder="보낸 시간"></td>
				</tr>
				<tr>
					<td>받은 시간 : <input type="text" name="publisher" id="publisher"
						size="30px;" placeholder="받은 시간"></td>
				</tr>
				<tr>
					<td colspan="3"><textarea name="content" id="content" cols="80" rows="5"></textarea>
					</td>
				</tr>
			</table>
		
		</form>
	</div>
	
	
</body>
</html>