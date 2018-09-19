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
</head>
<body>
	<h2>상세보기</h2>
	<hr>
	<div>
		<form>
			<table>
				<tr>
					<td><select name="cho" id="cho">
							<option value="">선택</option>
							<option value="">추천</option>
							<option value="">비평</option>
							<option value="">자유</option>
					</select></td>
					<td><input type="text" name="title" id="title" size="100"
						placeholder="제목을 입력하세요"></td>
					<td rowspan="5"></td>
				</tr>
				<tr>
					<td rowspan="4">책표지</td>
				</tr>
				<tr>
					<td><input type="text" name="book" id="book" size="100"
						placeholder="책 제목"></td>
				</tr>
				<tr>
					<td><input type="text" name="publisher" id="publisher"
						size="100" placeholder="출판사"></td>
				</tr>
				<tr>
					<td><input type="text" name="author" id="author" size="100"
						placeholder="저자"></td>
				</tr>
				<tr>
					<td colspan="3"><textarea name="" id="" cols="110" rows="10"></textarea>
					</td>
				</tr>
			</table>
			<hr>

			<button type="submit" name="recom" id="recom">추천</button>
			<button type="submit" name="fal" id="fal">비추천</button>
			<button type="submit" name="del" id="del">삭제</button>
			<button type="submit" name="up" id="up">수정</button>
			<button type="submit" name="list" id="list">목록</button>
			<input type="file" name="attach" id="file" />
	</div>
	<hr>
	<h2 id="comm">comment</h2>
	<hr width="200px" size="3" color="black" id="lo">
	<textarea name="contents" rows="8" cols="70" id="cow"></textarea>
	<div>
		<button type="button" name="in" id="in">입력</button>

	</div>
	<hr>
	<button type="button" id="comname">수정</button>
	<button type="button">삭제</button>

</body>
</html>