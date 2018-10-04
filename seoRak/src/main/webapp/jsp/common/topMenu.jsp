<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
	<header id="header"> <a class="site-logo" href="/seoRak/myInfo.do"> SeoRak
	</a> <nav role="navigation" id="nav-main" class="okayNav">
	<ul>

		<li><a href="<c:url value='myInfo.do'/>">home</a></li>
		<c:choose>
			<c:when test="${empty user}">
				<li><a href="<c:url value='/jsp/login/loginForm.jsp'/>">로그인</a></li>
				<li><a href="<c:url value='signUp.jsp'/>">회원가입</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="<c:url value='/jsp/mypoint/myPoint.jsp'/>">포인트</a></li>
				<li><a href="<c:url value='/jsp/massage/receivebox.jsp'/>">쪽지함</a></li>
				<li><a href="<c:url value='myInfo.do'/>">${user.memberNickname }</a></li>	
				<%-- <li><a href="<c:url value='/jsp/login/loginForm.jsp'/>">로그아웃</a></li> --%>
				<li><a href="<c:url value='/jsp/login/loginForm.jsp'/>">로그아웃</a></li>
				<c:if test="${user.memberGrade=='admin'}">
					<li><a href="<c:url value='/jsp/admin/admin.jsp'/>">관리자</a></li>
				</c:if>
			</c:otherwise>
		</c:choose>
	</ul>
	</nav> </header>
	<!-- /header -->

	<main> </main>

<form class="totobar" name="mForm" action='<c:url value="/topsearch.do"/>'>
	<ul class="menu">
		<li><a href="#" class="active">Home</a></li>
		<li><a href="<c:url value='myInfo.do'/>">마이페이지</a></li>
		<li><a href="<c:url value='boardlist.do'/>">게시판</a></li>
		<li><a href="<c:url value='/jsp/booksRanking/BestSeller.jsp'/>">랭킹</a></li>
		<li>
			<a href="#">
				<!-- <img src="<c:url value='/img/searchIcon.png'/>" onclick="javascript:location.href='<c:url value="/jsp/myList/Search2.do?"/>'" id="searchIcon">  -->
				<img src="<c:url value='/img/searchIcon.png'/>" onclick="doSearch()" id="searchIcon">
				<input id="searchBar" name="content" type="text" placeholder="도서검색"/>
			</a>
		</li>
		<li class="slider"></li>
	</ul>
</form>

	
	<script>
    var navigation = $('#nav-main').okayNav();
    function doSearch(){
    	var f = document.mForm 
    	f.submit()
    }
    
	</script>