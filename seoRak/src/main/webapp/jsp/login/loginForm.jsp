<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
[class*="fontawesome-"]:before {
	font-family: 'FontAwesome', sans-serif;
}

body {
	background: rgb(195, 210, 180);
	font-family: 'Raleway', sans-serif;
}

form#login-form {
	background: #fff;
	width: 35em;
	margin: auto;
	margin-top: 10%;
	overflow: hidden;
	position: relative;
	-moz-border-radius: 0.3em;
	-webkit-border-radius: 0.3em;
	border-radius: 0.3em;
	-moz-box-shadow: 0 0 0.2em #000;
	-webkit-box-shadow: 0 0 0.2em #000;
	box-shadow: 0 0 0.2em #000;
}

form#login-form div.heading {
	background: rgb(170, 200, 150);;
	color: #fff;
	text-align: center;
	text-transform: uppercase;
	font-weight: bold;
	padding: 1.5em;
}

form#login-form div.left {
	width: 50%;
	float: left;
	padding: 1.7em 1.5em 2.5em 1.5em;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

form#login-form div.right {
	width: 50%;
	float: right;
	padding: 1.7em 1.5em 2.5em 1.5em;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

form#login-form:before {
	content: 'or';
	color: gray;
	position: absolute;
	top: 0;
	right: 0;
	left: 0;
	bottom: 0;
	margin: auto;
	height: 0.5em;
	width: 0.5em;
	left: -1.5em;
	top: 1.2em;
	z-index: 900;
}

form#login-form:after {
	content: '';
	position: absolute;
	background: rgba(128, 128, 128, 0.3);
	top: 0;
	right: 0;
	left: 0;
	bottom: 0;
	margin: auto;
	height: 7.25em;
	width: 0.1em;
	left: -0.85em;
	top: -6.8em;
	-moz-box-shadow: 0 8.8em 0 0 rgba(128, 128, 128, 0.3);
	-webkit-box-shadow: 0 8.8em 0 0 rgba(128, 128, 128, 0.3);
	box-shadow: 0 8.8em 0 0 rgba(128, 128, 128, 0.3);
}

div.left label {
	display: inline-block;
	color: gray;
	font-size: 1.1em;
	margin-top: 0.6em;
}

div.left input[type="email"], div.left input[type="password"] {
	border: 0.1em solid #dfdfdf;
	padding: 1em;
	margin: 0.6em 0;
	-moz-border-radius: 0.2em;
	-webkit-border-radius: 0.2em;
	border-radius: 0.2em;
	-moz-box-shadow: 0 0 0.2em rgba(223, 223, 223, 0.2);
	-webkit-box-shadow: 0 0 0.2em rgba(223, 223, 223, 0.2);
	box-shadow: 0 0 0.2em rgba(223, 223, 223, 0.2);
	-moz-transition: all 0.15s ease-in-out;
	-o-transition: all 0.15s ease-in-out;
	-webkit-transition: all 0.15s ease-in-out;
	transition: all 0.15s ease-in-out;
}

div.left input[type="email"]:focus, div.left input[type="password"]:focus
	{
	outline: none;
	border: 0.1em solid #bdbdbd;
}

div.left input[type="submit"], #signIn {
	background: rgb(180, 180, 235);
	color: rgb(80, 80, 80);
	outline: none;
	text-transform: uppercase;
	padding: 1.2em;
	overflow: hidden;
	border: none;
	letter-spacing: 0.1em;
	margin: 0.5em 0;
	font-weight: bold;
	-moz-border-radius: 0.4em;
	-webkit-border-radius: 0.4em;
	border-radius: 0.4em;
	-moz-transition: all 0.15s ease-in-out;
	-o-transition: all 0.15s ease-in-out;
	-webkit-transition: all 0.15s ease-in-out;
	transition: all 0.15s ease-in-out;
	
}

div.left input[type="submit"]:hover {
	background: rgb(220, 220, 24 5);
}

div.right div.connect {
	color: #30acff;
	font-size: 1.5em;
	text-align: center;
	font: bold;
}

div.right a {
	display: inline-block;
	font-size: 1.5em;
	text-decoration: none;
	color: white;
	width: 9em;
	padding: 0.55em 0.3em;
	clear: both;
	text-align: center;
	margin: 0.5em 0.1em;
	-moz-border-radius: 0.3em;
	-webkit-border-radius: 0.3em;
	border-radius: 0.3em;
}

div.right a.facebook {
	background: yellow;
	color: black;
	margin-top: 0.8em;
	-moz-transition: all 0.15s ease-in-out;
	-o-transition: all 0.15s ease-in-out;
	-webkit-transition: all 0.15s ease-in-out;
	transition: all 0.15s ease-in-out;
}

div.right a.facebook:hover {
	background: rgb(247, 247, 102, 0.8);
}

#naver:hover {
	opacity: 80%;
}

.bg-bubbles {
  position: absolute;
  top: 0;
  left: 0;
  width: 95%;
  height: 95%;
  z-index: -1;
  overflow: hidden
}
.bg-bubbles li {
  position: absolute;
  list-style: none;
  display: block;
  width: 40px;
  height: 40px;
  background-color: rgba(255, 255, 255, 0.15);
  bottom: -160px;
  -webkit-animation: square 25s infinite;
  animation: square 25s infinite;
  transition-timing-function: linear;
}
.bg-bubbles li:nth-child(1) {
  left: 10%;
}
.bg-bubbles li:nth-child(2) {
  left: 20%;
  width: 80px;
  height: 80px;
  -webkit-animation-delay: 2s;
          animation-delay: 2s;
  -webkit-animation-duration: 17s;
          animation-duration: 17s;
}
.bg-bubbles li:nth-child(3) {
  left: 25%;
  -webkit-animation-delay: 4s;
          animation-delay: 4s;
}
.bg-bubbles li:nth-child(4) {
  left: 40%;
  width: 60px;
  height: 60px;
  -webkit-animation-duration: 22s;
          animation-duration: 22s;
  background-color: rgba(255, 255, 255, 0.25);
}
.bg-bubbles li:nth-child(5) {
  left: 70%;
}
.bg-bubbles li:nth-child(6) {
  left: 80%;
  width: 120px;
  height: 120px;
  -webkit-animation-delay: 3s;
          animation-delay: 3s;
  background-color: rgba(255, 255, 255, 0.2);
}
.bg-bubbles li:nth-child(7) {
  left: 32%;
  width: 160px;
  height: 160px;
  -webkit-animation-delay: 7s;
          animation-delay: 7s;
}
.bg-bubbles li:nth-child(8) {
  left: 55%;
  width: 20px;
  height: 20px;
  -webkit-animation-delay: 15s;
          animation-delay: 15s;
  -webkit-animation-duration: 40s;
          animation-duration: 40s;
}
.bg-bubbles li:nth-child(9) {
  left: 25%;
  width: 10px;
  height: 10px;
  -webkit-animation-delay: 2s;
          animation-delay: 2s;
  -webkit-animation-duration: 40s;
          animation-duration: 40s;
  background-color: rgba(255, 255, 255, 0.3);
}
.bg-bubbles li:nth-child(10) {
  left: 90%;
  width: 160px;
  height: 160px;
  -webkit-animation-delay: 11s;
          animation-delay: 11s;
}
@-webkit-keyframes square {
  0% {
    -webkit-transform: translateY(0);
            transform: translateY(0);
  }
  100% {
    -webkit-transform: translateY(-1000px) rotate(600deg);
            transform: translateY(-1000px) rotate(600deg);
  }
}
@keyframes square {
  0% {
    -webkit-transform: translateY(0);
            transform: translateY(0);
  }
  100% {
    -webkit-transform: translateY(-1000px) rotate(600deg);
            transform: translateY(-1000px) rotate(600deg);
  }
}
#signIn{
	a
}



</style>
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>

</head>
<body>
	<c:if test="${unmatch}">
		<script type="text/javascript">
			alert("아이디 혹은 비밀번호가 일치하지 않습니다.")
		</script>
	</c:if>
  <form action="<c:url value='/login/login.do'/>" id="login-form" style="z-index: 5" method="post">
    <div class="heading">Login to seRock</div>
    <div class="left">
      <label for="email">Email</label> <br />
      <input type="email" name="email" id="email" /> <br />
      <label for="pass">Password</label> <br />
      <input type="password" name="password" id="pass" /> <br />
  	  <input type="submit"  value="Login" />
      <a href="<c:url value="login/signUp.jsp"/>"><input id="signIn" type="button"  value="Sign-In" /></a>
    </div>
    <div class="right">
      <div class="connect">seoRak Project</div>
 <!--      <a href="" class="facebook">
        <span class="fontawesome-facebook">카카오로 로그인</span>
        <i class="fa fa-facebook" aria-hidden="true"></i>
      </a> <br />
      <a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=YjI86DNmOfwfD8Ah_H_c&redirect_uri=http://127.0.0.1:8000/seoRak/login/naver.do&state=ohrFfajrB1JNKDzT" class="naver"> -->
        <img id="naver" src="<c:url value='/img/kakao.JPG'/>" style="width: 220px; ">
        <!-- <i class="fa fa-twitter" aria-hidden="true">네이버로 로그인</i> -->
      </a>
      <!-- <br />
      <a href="" class="google-plus">
        <span class="fontawesome-google-plus"></span>
        <i class="fa fa-google-plus" aria-hidden="true">google</i>
      </a> -->
    </div>

  </form>  
  <dir id="bubble">
      <ul class="bg-bubbles" style="z-index: 1">
        <li><img src="<c:url value='/img/myBookList_a1.PNG'/>"></li>
        <li><img src="<c:url value='/img/11.jpg'/>"></li>
        <li><img src="<c:url value='/img/22.JPG'/>"></li>
        <li><img src="<c:url value='/img/33.JPG'/>"></li>
        <li><img src="<c:url value='/img/44.jpg'/>"></li>
        <li><img src="<c:url value='/img/pasbook.JPG'/>"></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
      </ul>
     </dir>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<!-- 
	<script>
		function check () {
			$.ajax({
				type: "POST",
				url: "/seoRak/login/login.do",
				data : "id="+$("#email").val()+"&pass=" + $("#pass").val(),
				success: function(data) {
					if(data == 1) {
						alert("이메일 혹은 비밀번호가 잘못되었습니다.")
						return false;
					} else {
						window.location.replace("/seoRak/main.do")
						
						return true;
						
					}
				}
			});
		}
	</script>
	 -->
</body>
</html>