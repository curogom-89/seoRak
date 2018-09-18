<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
h2{
  transform: translate(20%)
}
table{
        margin: 0;
        padding: 0;
        width: 60%;
        height: 60px;
        margin: auto;
        position: relative;
        background-color: #a4cef8;
        z-index: 7;
        border:1px solid tomato
}
tr{
    text-align : center
}
tr:nth-child(1){
        font-size: 16px;
        font-weight :bold
}
td{
    font-size: 14px;
}
#boardSearch{
        width: 500px;
        transform: translate(600px)
}
button{
    width: 80px;
    transform: translate(600px)
}
p{
    margin: 0;
    padding: 0;
    width: 100%;
    margin: auto;
    position: relative;
    border:1px solid tomato
}
</style>
</head>
<body>
	<%@include file="topList.jsp" %>
	
    <div>

    <h2>My List</h2>
 
    <table>
        <tr>
            <th>번호</th>
            <th>카테고리</th>
            <th>제목</th>
            <th>작성자</th>
            <th>추천서적</th>
            <th>별점</th>
            <th>추천수</th>
            <th>조회수</th>
            <th>작성일</th>
        </tr>
        <tr>
            <td>1</td>
            <td><추천></td>
            <td>이 책을 추천합니다</td>
            <td>방진웅</td>
            <td>자바의 정석</td>
            <td>5.0</td>
            <td>64</td>
            <td>120</td>
            <td>2018.09.13</td>
        </tr>
        <tr>
            <td>2</td>
            <td><자유></td>
            <td>오늘 점심 드셨나요?</td>
            <td>신득수</td>
            <td>-</td>
            <td>-</td>
            <td>240</td>
            <td>900</td>
            <td>2018.09.13</td>
        </tr>
        <tr>
            <td>3</td>
            <td><비평></td>
            <td>오래된 책들을 다시...</td>
            <td>유병욱</td>
            <td>연탄길</td>
            <td>4.5</td>
            <td>50</td>
            <td>20</td>
            <td>2018.09.13</td>
        </tr>
    </table>
        
    </div>
    <p>
        <input id="boardSearch" type="text">
        <button>검색</button>
        <button>글쓰기</button>
    </p>
    
</body>
</html>