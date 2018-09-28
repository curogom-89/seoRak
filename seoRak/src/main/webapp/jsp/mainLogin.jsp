<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<style>
	body{
	 font-family: 'Do Hyeon', sans-serif;
	 font-size: 16px;
     background-color: rgb(195, 210, 180);
     padding-top: 15px;
	
	}

#mama{ 
	height: 350px; 
	white: 300px;
	margin-left: 440px;
	margin-bottom: 30px;
	opacity: 0.8;

	}
	#loging{
	height: 100px; 
	max-width: 800px;
	background:rgba(250, 240, 240, 0.4);
	margin-left: 350px;
	}
	.button{
	font-size: 16px;
	}
	.button:link{
	text-decoration: none; 
	color: rgb(255,255,255);
	}
	.button:hover{
	color: black;
	}
	span{
		width: 60px; 
		height: 50px;
        margin: 20px;
        text-align: center;
	}
	.log{
	display: inline-block;
	background:rgb(180, 180, 235);
	line-height: 50px;
	}
	.sig{
	display: inline-block;
	background:rgb(180, 180, 235);
	line-height: 50px;
	}
	
	h2{
	transition: color 200ms cubic-bezier(.55, 0, .1, 1);
	color: #30acff;
	font-size: 4rem;
	text-align: center;
	margin-right: auto;
	margin-left: auto;
	}
</style>

<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>

</head>
<body>
<h2>seoRak</h2>
</div>
<div id="out">
<img src="<c:url value='/img/bookbook.JPG'/>" id="mama"/>
</div><br>
<div id="loging">
	<form action="<c:url value="/login/login.do"/>" id="login" method="post">
	<span><a>E-mail: <input type="text" name="email"></a></span>
	<span><a>Password: <input type="password" name="password"></a></span> 
	<span class="log"><a class="button" id="submit" href="#" /> 로그인 </a></span>
	<span class="sig"><a class="button" href="<c:url value=" signUp.jsp"/>"> 회원가입</a></span>
	</form>
</div>
    <script>
    	$("#submit").click(function() {
    		$("#login").submit()
    	});
    </script>
</body>
</html>