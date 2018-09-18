<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<style>
* {
	box-sizing: border-box
}

*:before, *:after {
	box-sizing: inherit
}

/* Basic styles */
html {
	font-size: 62.5%;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	font-family: @ font-family-base;
}

body {
	  font-family: 'Do Hyeon', sans-serif;
	font-size: 16px;
	line-height: 1.42857143;
	/* color: #555;
    background-color: #f7f7f7; */
}

a {
	text-decoration: none
}

ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

main {
	margin-top: 7rem; 
	text-align: center;
}
/* Header styles */
header {
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	background-color: #fff;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row;
	height: 7rem;
	padding: 0 15px;
	position: fixed;
	-webkit-justify-content: space-between;
	-ms-flex-pack: justify;
	justify-content: space-between;
	top: 0;
	width: 100%;
	z-index: 8;
}

.site-logo {
	transition: color 200ms cubic-bezier(.55, 0, .1, 1);
	color: #30acff;
	font-size: 3rem;
}

.ok-header__logo:hover {
	color: #546edb
}

/* okayNav styles */
body.okayNav-loaded {
	overflow-x: hidden;
}

.okayNav:not (.loaded ) {
	visibility: hidden;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.okayNav ul {
	/* We want two navigations - one hidden and one visible */
	float: left;
}

.okayNav a {
	/* Links general styling */
	color: #2e2e33;
	font-size: 1.4rem;
	font-weight: bold;
	position: relative;
	z-index: 1;
}

.okayNav__nav--visible {
	overflow: hidden;
	white-space: nowrap;
}

.okayNav__nav--visible li {
	display: inline-block;
}

.okayNav__nav--visible a {
	/* Link styling for the visible part of the nav */
	display: block;
	transition: color 200ms cubic-bezier(0.55, 0, 0.1, 1);
	padding: 15px 15px;
}

.okayNav__nav--visible a:hover {
	color: #546edb;
}
/* Link styling for the off-screen part of the nav */
.okayNav__nav--invisible {
	position: fixed;
	top: 70px;
	bottom: 0;
	overflow-y: scroll;
	-webkit-overflow-scrolling: touch;
	background: #fff;
}

.okayNav__nav--invisible a {
	background: #fff;
	width: 240px;
	display: block;
	padding: 15px;
}

.okayNav__nav--invisible.nav-left {
	left: 0;
	-webkit-transform: translateX(-100%);
	transform: translateX(-100%);
}

.okayNav__nav--invisible.nav-right {
	right: 0;
	-webkit-transform: translateX(100%);
	transform: translateX(100%);
}

.okayNav__nav--invisible.transition-enabled {
	transition: -webkit-transform 400ms cubic-bezier(0.55, 0, 0.1, 1);
	transition: transform 400ms cubic-bezier(0.55, 0, 0.1, 1);
	transition: transform 400ms cubic-bezier(0.55, 0, 0.1, 1),
		-webkit-transform 400ms cubic-bezier(0.55, 0, 0.1, 1);
}

.okayNav__nav--invisible.nav-open {
	-webkit-transform: translateX(0);
	transform: translateX(0);
}
/* Kebab icon */
.okayNav__menu-toggle {
	position: relative;
	transition: -webkit-transform 400ms cubic-bezier(0.55, 0, 0.1, 1);
	transition: transform 400ms cubic-bezier(0.55, 0, 0.1, 1);
	transition: transform 400ms cubic-bezier(0.55, 0, 0.1, 1),
		-webkit-transform 400ms cubic-bezier(0.55, 0, 0.1, 1);
	cursor: pointer;
	width: 40px;
	height: 20px;
	float: left;
	z-index: 1;
	top: 15px;
}

.okayNav__menu-toggle.okay-invisible {
	position: absolute;
	opacity: 0;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	pointer-events: none;
}

.okayNav__menu-toggle span {
	display: block;
	position: absolute;
	margin: auto;
	height: 4px;
	width: 4px;
	background: #2e2e33;
	border-radius: 50%;
	left: 0;
	right: 0;
	pointer-events: none;
}

.okayNav__menu-toggle span:nth-child(1) {
	top: 0;
}

.okayNav__menu-toggle span:nth-child(2) {
	top: 50%;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%);
}

.okayNav__menu-toggle span:nth-child(3) {
	bottom: 0;
}

.okayNav__menu-toggle.icon--active {
	/* Kebab icon when off-screen nav is open */
	-webkit-transform: rotate(90deg);
	transform: rotate(90deg);
}

.okayNav__menu-toggle.icon--active span {
	background: #546edb;
}

* {
	box-sizing: border-box;
}

@font-face {
	font-family: 'PT Sans';
	font-style: normal;
	font-weight: 400;
	src: local('PT Sans'), local('PTSans-Regular'),
		url(https://fonts.gstatic.com/s/ptsans/v9/jizaRExUiTo99u79D0KEwA.ttf)
		format('truetype');
}

html, body {
	margin: 0;
	padding: 0;
}

body {
  font-family: 'Do Hyeon', sans-serif;
	  background-color: rgb(195, 210, 180);
}

h1 {
	text-align: center;
	font-size: 48px;
	text-transform: uppercase;
	letter-spacing: 3px;
	color: #222;
}

.menu {
	list-style: none;
	margin: 0;
	padding: 0;
	width: 100%;
	height: 50px;
	margin: auto;
	position: relative;
	background-color: #2c3e50;
	z-index: 7;
}

.menu li {
	float: left;
	width: 20%;
	height: 100%;
	margin: 0;
	padding: 0;
}

.menu a {
	display: flex;
	width: 100%;
	height: 100%;
	justify-content: center;
	align-items: center;
	color: #fff;
	text-decoration: none;
	position: relative;
	font-size: 18px;
	z-index: 9;
}

a.active {
	background-color: #e74c3c;
	pointer-events: none;
}

li.slider {
	width: 20%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	background-color: #e74c3c;
	z-index: 8;
	transition: left 0.4s, background-color 0.4s;
}

.menu li:nth-child(1):hover ~ .slider, .menu li:nth-child(1):focus ~
	.slider, .menu li:nth-child(1):active ~ .slider {
	left: 0;
	background-color: #3498db;
}

.menu li:nth-child(2):hover ~ .slider, .menu li:nth-child(2):focus ~
	.slider, .menu li:nth-child(2):active ~ .slider {
	left: 20%;
	background-color: #9b59b6;
}

.menu li:nth-child(3):hover ~ .slider, .menu li:nth-child(3):focus ~
	.slider, .menu li:nth-child(3):active ~ .slider {
	left: 40%;
	background-color: #e67e22;
}

.menu li:nth-child(4):hover ~ .slider, .menu li:nth-child(4):focus ~
	.slider, .menu li:nth-child(4):active ~ .slider {
	left: 60%;
	background-color: #16a085;
}

.menu li:nth-child(5):hover ~ .slider, .menu li:nth-child(5):focus ~
	.slider, .menu li:nth-child(5):active ~ .slider {
	left: 80%;
	background-color: #16a085;
}
#searchIcon {
	width: 15px;
	height: 15px;
	margin-right: 10px;
}
#searchBar {
	width: 200px;
	height: 30px;
}
</style>
</head>
<body>
	<header id="header"> <a class="site-logo" href="#"> SeoRak
	</a> <nav role="navigation" id="nav-main" class="okayNav">
	<ul>

		<li><a href="#">home</a></li>
		<li><a href="#">로그인</a></li>
		<li><a href="#">로그아웃</a></li>
		<li><a href="#">회원가입</a></li>
	</ul>
	</nav> </header>
	<!-- /header -->

	<main> </main>


	<ul class="menu">
		<li><a href="#" class="active">Home</a></li>
		<li><a href="#">마이페이지</a></li>
		<li><a href="#">게시판</a></li>
		<li><a href="#">랭킹</a></li>
		<li><a href="#"><img src="../img/searchIcon.png" id="searchIcon"><input id="searchBar" type="text" placeholder="도서검색"/></a></li>
		<li class="slider"></li>
	</ul>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script
		src="https://cdn.rawgit.com/VPenkov/okayNav/master/app/js/jquery.okayNav.js"></script>
	<script>
    var navigation = $('#nav-main').okayNav();
	</script>
</body>
</html>