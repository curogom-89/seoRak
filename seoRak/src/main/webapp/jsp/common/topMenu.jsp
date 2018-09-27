<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
	<header id="header"> <a class="site-logo" href="#"> SeoRak
	</a> <nav role="navigation" id="nav-main" class="okayNav">
	<ul>

		<li><a href="jsp/myInfo.jsp">home</a></li>
		<li><a href="jsp/myPoint.jsp">포인트</a></li>
		<li><a href="jsp/message.jsp">쪽지함</a></li>
		<li><a href="jsp/loginForm.jsp">로그인</a></li>
		<li><a href="#">로그아웃</a></li>
		<li><a href="jsp/myInfo.jsp">회원님</a></li>
		<li><a href="jsp/admin.jsp">관리자</a></li>
		<li><a href="jsp/signUp.jsp">회원가입</a></li>
	</ul>
	</nav> </header>
	<!-- /header -->

	<main> </main>


	<ul class="menu">
		<li><a href="#" class="active">Home</a></li>
		<li><a href="myInfo.jsp">마이페이지</a></li>
		<li><a href="freeBoard.jsp">게시판</a></li>
		<li><a href="BestSeller.jsp">랭킹</a></li>
		<li><a href="#"><img src="../img/searchIcon.png" onclick="javascript:location.href='search.jsp'" id="searchIcon"><input id="searchBar" type="text" placeholder="도서검색"/></a></li>
		<li class="slider"></li>
	</ul>

	
	<script>
    var navigation = $('#nav-main').okayNav();
	</script>