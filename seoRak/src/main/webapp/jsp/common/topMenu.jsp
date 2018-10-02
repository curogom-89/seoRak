<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
	<header id="header"> <a class="site-logo" href="#"> SeoRak
	</a> <nav role="navigation" id="nav-main" class="okayNav">
	<ul>

		<li><a href="<c:url value='myInfo.do'/>">home</a></li>
		<c:choose>
			<c:when test="${empty user}">
				<li><a href="<c:url value='loginForm.jsp'/>">로그인</a></li>
				<li><a href="<c:url value='signUp.jsp'/>">회원가입</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="<c:url value='myPoint.jsp'/>">포인트</a></li>
				<li><a href="<c:url value='receivebox.jsp'/>">쪽지함</a></li>
				<li><a href="<c:url value='myInfo.jsp'/>">${user.memberNickname }</a></li>	
				<li><a href="<c:url value='loginForm.jsp'/>">로그아웃</a></li>
				<c:if test="${user.memberGrade=='admin'}">
					<li><a href="<c:url value='admin.jsp'/>">관리자</a></li>
				</c:if>
			</c:otherwise>
		</c:choose>
	</ul>
	</nav> </header>
	<!-- /header -->

	<main> </main>


	<ul class="menu">
		<li><a href="#" class="active">Home</a></li>
		<li><a href="<c:url value='myInfo.do'/>">마이페이지</a></li>
		<li><a href="<c:url value='freeBoard.jsp'/>">게시판</a></li>
		<li><a href="<c:url value='BestSeller.jsp'/>">랭킹</a></li>
		<li><a href="#"><img src="<c:url value='/img/searchIcon.png'/>" onclick="javascript:location.href='search.jsp'" id="searchIcon"><input id="searchBar" type="text" placeholder="도서검색"/></a></li>
		<li class="slider"></li>
	</ul>

	
	<script>
    var navigation = $('#nav-main').okayNav();
	</script>