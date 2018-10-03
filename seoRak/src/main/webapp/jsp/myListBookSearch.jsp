<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="kr.co.seoRak.repository.domain.Book" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<% 
	List<Book> list = (List<Book>)request.getAttribute("list");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.js"
       	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
       	crossorigin="anonymous"></script>
       	
<title>Insert title here</title>
	<style>
 /*-------------------- BODY --------------------*/
 /* 원본 주소 : https://codepen.io/supah/pen/XdKMJK */
		*,
		*::before,
		*::after {
		  box-sizing: border-box;
		}
		
		body {
		  height: 100vh;
		  margin: 0;
		  background: #DEDEDE;
		  color: #5a6674;
		  font-size: 13px;
		  font-family: 'Roboto', sans-serif;
		  overflow: scroll;
		} 
		
		/*-------------------- App --------------------*/
		.search-form {
		  position: relative;
		  top: 5%;
		  left: 50%;
		  width: 350px;
		  height: 40px;
		  border-radius: 40px;
		  box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
		  -webkit-transform: translate(-50%, -50%);
		          transform: translate(-50%, -50%);
		  background: #fff;
		  transition: all 0.3s ease;
		}
		.search-form.focus {
		  box-shadow: 0 3px 4px rgba(0, 0, 0, 0.15);
		}
		
		.search-input {
		  position: absolute;
		  top: 10px;
		  left: 38px;
		  font-size: 14px;
		  background: none;
		  color: #5a6674;
		  width: 195px;
		  height: 20px;
		  border: none;
		  -webkit-appearance: none;
		     -moz-appearance: none;
		          appearance: none;
		  outline: none;
		}
		.search-input::-webkit-search-cancel-button {
		  -webkit-appearance: none;
		          appearance: none;
		}
		
		.search-button {
		  position: absolute;
		  top: 10px;
		  left: 15px;
		  height: 20px;
		  width: 20px;
		  padding: 0;
		  margin: 0;
		  border: none;
		  background: none;
		  outline: none !important;
		  cursor: pointer;
		}
		.search-button svg {
		  width: 20px;
		  height: 20px;
		  fill: #5a6674;
		}
		.search-select {
			position : relative;
			left : -90px;
			top : 5px;
			width : 70px;
			height : 40px;
		}
		
		/* table */
		table {
			position : relative;
			border-collapse: collapse;
			width: 800px;
			height:70%;
		    left: 0%;
		    top: 0px;
		    color: rgb(156, 156, 156);
		}
		th {
		   /* background-color: #27ae60; */
		    white-space: nowrap;
	        font-size: 30px;
	        color:rgb(156, 156, 156);
	        border-bottom: 1px solid rgb(156, 156, 156);
		}
		td {
	        font-size: 10px;
	    }
		td, th {
		    text-align: center;
	  	}
		tbody th {
			/* background-color: #2ea879; */
		}
		tbody tr:nth-child(2n-1) {
		    transition: all .125s ease-in-out;
		}
		tbody tr:hover {
		    background-color: rgba(50,98,149,.3);
		}
		
		td.rank {
			text-transform: capitalize;
		}
	</style>
</head>
<body>
	<center>
		<div>
			<h1>도서 검색</h1>
		</div>
	</center>
	<hr>
	<!--"/seoRak/jsp/myList/Search.do"  -->
	<form class="search-form" action='<c:url value="/jsp/myList/Search.do"/>'>
		<select class="search-select" name="detail">
			<option value="1">제목</option>
			<option value="2">출판사</option>
			<option value="3">작가</option>
		</select>
	  	<input type="search" value="" placeholder="Search" class="search-input" name="content">
		<button type="submit" class="search-button" >
		    <svg class="submit-button">
		      <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#search"></use>
		    </svg>
	  	</button>
	</form>
	
	<svg xmlns="http://www.w3.org/2000/svg" width="0" height="0" display="none">
	  <symbol id="search" viewBox="0 0 32 32">
	    <path d="M 19.5 3 C 14.26514 3 10 7.2651394 10 12.5 C 10 14.749977 10.810825 16.807458 12.125 18.4375 L 3.28125 27.28125 L 4.71875 28.71875 L 13.5625 19.875 C 15.192542 21.189175 17.250023 22 19.5 22 C 24.73486 22 29 17.73486 29 12.5 C 29 7.2651394 24.73486 3 19.5 3 z M 19.5 5 C 23.65398 5 27 8.3460198 27 12.5 C 27 16.65398 23.65398 20 19.5 20 C 15.34602 20 12 16.65398 12 12.5 C 12 8.3460198 15.34602 5 19.5 5 z" />
	  </symbol>
	</svg>

	<script>
		$('.search-input').focus(function(){
			  $(this).parent().addClass('focus');
			}).blur(function(){
			  $(this).parent().removeClass('focus');
			})
	</script>	
	<p>
	</p>
	<center>
	<table id="new_book_list">
                 <thead>
                      <tr>
                          <th>번호</th>
                          <th>이미지</th>
                          <th>제목</th>
                          <th>출판사</th>
                          <th>작가</th>
                      </tr>
                 </thead>
                 <tbody>
                 	<%
                 	if(list != null){
                 		for(Book b : list){
							int no = list.indexOf(b);
	                 	    String img = b.getImage();
                 	%>
                 	  <tr>
                 	  	<td> <%= no+1 %> </td>
                        <td><img src="<%= img %>"/></td>
                        <td id="title">
                        <!-- http://localhost:8000/seoRak/jsp/myListWrite.jsp -->
                        	<a href="/seoRak/jsp/myListWrite.jsp?title=<%= b.getTitle() %>&publisher=<%= b.getPublisher() %>&author=<%= b.getAuthor() %>&img=<%= b.getImage() %>&link=<%= b.getLink() %>&isbn=<%= b.getIsbn() %> ">
                        		<%= b.getTitle() %>
                        	</a>
                        </td>
                        <td> <%= b.getPublisher() %> </td>
                        <td> <%= b.getAuthor() %> </td>
                      </tr>
                 	<%		
		                	}
		                }
                 	%>
	         	</tbody>
	         </table>
         </center>
         <script>
         	/* $("#title").click(function(){
         		$.ajax({
         			type : "POST",
         			url : "/jsp/myList/Write.do",
         			data : ""
         		})
         		
         	}) */
         </script>
</body>
</html>