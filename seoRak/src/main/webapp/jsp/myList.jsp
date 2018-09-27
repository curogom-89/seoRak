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
   
}
#searchbox{
	width: 80%;
    padding-top:10px; 
    
    margin-top: 10px;
 	margin-left: 450px;
;
	
}
#boardSearch{
	margin: auto auto;
}

</style>
</head>
<body>
	<%@include file="topList.jsp" %>
	
    <div>

    <h2>My List</h2>
    <hr>
 
    <table>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>장르</th>
            <th>출판사</th>
            <th>작가</th>
            <th>평점</th>
            <th>작성일</th>
            <th></th>
        </tr>
        
        <tr>
            <td>1</td>
            <td>연탄길</td>
            <td>소설</td>
            <td>잘하자 출판사</td>
            <td>방진웅</td>
            <td>5.0</td>
            <td>2018.09.13</td>
            <td>
            	<input type="checkbox" name="delete" id="delete_1"></button>
            	<label for="delete_1">delete</label>
            </td>
        </tr>
        <tr>
            <td>2</td>
            <td>연탄길</td>
            <td>소설</td>
            <td>잘하자 출판사</td>
            <td>방진웅</td>
            <td>5.0</td>
            <td>2018.09.13</td>
            <td>
            	<input type="checkbox" name="delete" id="delete_2"></button>
            	<label for="delete_2">delete</label>
            </td>
        </tr>
        <tr>
            <td>3</td>
            <td>연탄길</td>
            <td>소설</td>
            <td>잘하자 출판사</td>
            <td>방진웅</td>
            <td>5.0</td>
            <td>2018.09.13</td>
            <td>
            	<input type="checkbox" name="delete" id="delete_3"></button>
            	<label for="delete_3">delete</label>
            </td>
        </tr>
    </table>
        
    </div>
    <div id="searchbox">
    	<input id="boardSearch" type="text">
        <button class="searchBotton">검색</button>
        <button class="searchBotton">선택삭제</button>
        <button class="searchBotton"><a href="myListWrite.jsp">책 추가</a></button>
    </div>
    
</body>
</html>