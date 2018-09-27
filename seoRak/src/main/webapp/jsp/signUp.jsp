<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<style>
*, *:before, *:after {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

body {
	background: rgb(195, 210, 180);
	font-family: 'Nunito', sans-serif;
}

form {
	border: 5px rgb(180, 180, 235) solid;
	width: 100%;
	max-width: 800px;
	margin: 10px auto;
	margin-top: 30px;
	padding: 10px 20px;
	background: rgb(170, 200, 150);
	border-radius: 20px;
}

h1 {
	margin: 0 0 30px 0;
	text-align: center;
}

input[type="text"], input[type="password"], input[type="date"], input[type="datetime"],
	input[type="email"], input[type="number"], input[type="search"], input[type="tel"],
	input[type="time"], input[type="url"], textarea, select {
	background: rgba(255, 255, 255, 1);
	font-size: 16px;
	height: 30px;
	margin: 0;
	outline: 0;
	padding: 15px;
	width: 100%;
	background-color: #fff;
	color: rgb(80, 80, 80);
	box-shadow: 0 1px 0 rgba(0, 0, 0, 0.03) inset;
	margin-bottom: 30px;
}

input[type="radio"], input[type="checkbox"] {
	margin: 0 4px 8px 0;
}

select {
	padding: 6px;
	height: 32px;
	border-radius: 2px;
}

#submit {
	padding: 19px 39px 18px 39px;
	color: rgb(80, 80, 80);
	background-color: rgb(180, 180, 235);
	font-size: 18px;
	text-align: center;
	font-style: normal;
	border-radius: 5px;
	width: 100%;
	border: 1px solid rgb(135, 135, 231);
	border-width: 1px 1px 3px;
	box-shadow: -3px -3px 3px rgb(99, 99, 126) inset;
	margin-bottom: 10px;
}

#submit:focus {
	box-shadow: 5px 5px 3px rgb(99, 99, 126) inset;
}

fieldset {
	margin-bottom: 30px;
	border: none;
}

legend {
	font-size: 1.4em;
	margin-bottom: 10px;
}

label {
	display: block;
	margin-bottom: 8px;
	color: rgb(80, 80, 80)
}

label.light {
	font-weight: 300;
	display: inline;
}

@media screen and (min-width: 480px) {
	form {
		max-width: 40%;
	}
}

h1 {
	height: 70px;
	line-height: 70px;
	border-radius: 8px;
	margin-top: 20px;
	margin-bottom: 20px;
	color: rgb(80, 80, 80)
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>

</head>
<body>
	<h1>회원가입</h1>
	<div id="title"></div>
	<form id="signIn" action="<c:url value="/login/signUp.do"/>"
		method="post" onsubmit="return check()">
		<fieldset>
			<label for="nickName">닉네임</label> 
			<input type="text" id="nickName" name="nickName" style="width: 85%" />
			<button id="nickcheck" type="button">중복체크</button>
			<label for="id">아이디(E-mail)</label> 
			<input type="email" id="id" name="id" style="width: 85%" />
			<button id="idcheck" type="button">중복체크</button>
			<label for="password">비밀번호</label> 
			<input type="password" id="pass" name="pass" /> 
			<label for="checkPassword">비밀번호 확인</label> 
			<input type="password" id="checkPassword" name="checkPassword" /> 
			<label for="checkHuman">Email 인증</label> 
			<input type="text" id="checkMail"  name="checkMail" style="width: 85%" /> 
			<button id="mailcheck" type="button">메일체크</button>
			
		</fieldset>
		<button id="submit" type="submit">회원가입</button>
	</form>
	<script type="text/javascript">
		var nickCheck = false;
		var idCheck = false;
		var mailCheck = false;
		var confirm;
		
		$("#nickcheck").click(function () {
			if(!$("#nickName").val()) {
				alert("닉네임이 입력되지 않았습니다.")
				return
			}
			var nickName = $("#nickName").val()
			$.ajax({
				type: "POST",
				url: "/seoRak/login/check.do",
				data : "type=nick&nickName=" + nickName,
				success: function(data) {
					if(data == 1) {
						alert("사용 가능한 닉네임입니다.")
						nickCheck = true;
					} else {
						alert("이미 사용중인 닉네임 입니다.")
						nickCheck = false;
					}
				}
			});
			
		})

		$("#idcheck").click(function () {
			if(!$("#id").val()) {
				alert("ID가 입력되지 않았습니다.")
			}
			
			var id = $("#id").val()
			$.ajax({
				type: "POST",
				url: "/seoRak/login/check.do",
				data : "type=id&id=" + id,
				success: function(data) {
					if(data == 1) {
						alert("사용 가능한 id입니다.")
						idCheck = true;
					} else {
						alert("이미 사용중인 id 입니다.")
						idCheck = false;
					}
				}
			});
		})

		$("#mailcheck").click(function () {
			if ($("#id").val().search("@") == -1) {
				alert("메일 주소가 잘못 입력되어있습니다.")
				return
			}
			
			var mail = $("#id").val()
			$.ajax({
				type: "POST",
				url: "/seoRak/login/mail.do",
				data : "mail=" + $("#id").val(),
				success: function(data) {
					confirm = data
				}
			});
			alert("메일이 발송 되었습니다.")
		})

		
		function check() {
			if (nickCheck != true || idCheck != true) {
				alert("중복검사를 실행 해 주세요.")
				return false;
			}
			
			if ($("#pass").val().length <= 5) {
				alert("비밀번호는 6자 이상으로 설정해주세요.")
				return false;
			}
			
			if ($("#pass").val() != $("#checkPassword").val()) {
				console.log($("#pass").val())
				console.log($("#checkPassword").val())
				
				alert("비밀번호가 일치하지 않습니다.")
				return false;
			}
			
			if ($("#checkMail").val() != confirm.trim()) {
				console.log($("#checkMail").val())
				console.log(confirm)
				
				alert("메일 인증 번호가 올바르지 않습니다.")
				return false;
			}
			return true;
		}
		
	</script>
</body>
</html>