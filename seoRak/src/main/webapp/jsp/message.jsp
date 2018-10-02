<%@page import="kr.co.seoRak.common.db.MyAppSqlConfig"%>
<%@page import="kr.co.seoRak.repository.mapper.MessageMapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
  body {
  padding-top:25px;
  margin-left:10px;
  margin-right:10px;
}
.container {
  max-width:500px;
  margin:0 auto;
  text-align:center;
  -webkit-border-radius:6px;
  -moz-border-radius:6px;
  border-radius:6px;
  background-color:#FAFAFA;
}
.head {
  -webkit-border-radius:6px 6px 0px 0px;
  -moz-border-radius:6px 6px 0px 0px;
  border-radius:6px 6px 0px 0px;
  background-color:#2ABCA7;
  color:#FAFAFA;
}
h2 {
  text-align:center;
  padding:18px 0 18px 0;
  font-size: 1.4em;
}
input {
  margin-bottom:10px;
}
textarea {
  height:100px;
  margin-bottom:10px;
}
input:first-of-type
{
  margin-top:35px;
}
#meo1, #title, textarea {
  font-size: 1em;
  padding: 15px 10px 10px;
  font-family: 'Source Sans Pro',arial,sans-serif;
  border: 1px solid #cecece;
  background: #d7d7d7;
  color:#FAFAFA;
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 5px;
  -moz-background-clip: padding;
  -webkit-background-clip: padding-box;
  background-clip: padding-box;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  width: 80%;
  max-width: 600px;
}

#meo2 {
  font-size: 1em;
  padding: 15px 10px 10px;
  font-family: 'Source Sans Pro',arial,sans-serif;
  border: 1px solid #cecece;
  background: #d7d7d7;
  color:#FAFAFA;
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 5px;
  -moz-background-clip: padding;
  -webkit-background-clip: padding-box;
  background-clip: padding-box;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  width: 60%;
  max-width: 600px;
}

::-webkit-input-placeholder{
   color: #FAFAFA;
}
:-moz-placeholder {
   color: #FAFAFA;  
}
::-moz-placeholder {
   color: #FAFAFA; 
}
:-ms-input-placeholder {  
   color: #FAFAFA;  
}
.submit-button  {
  margin-top:15px;
  margin-bottom:25px;
  background-color:#2ABCA7;
  padding: 12px 45px;
  -ms-border-radius: 5px;
  -o-border-radius: 5px;
  border-radius: 5px;
  border: 1px solid #2ABCA7;
  -webkit-transition: .5s;
  transition: .5s;
  display: inline-block;
  cursor: pointer;
  width:30%;
  color:#fff;
}
.submit-button:hover, .confim-button:hover {
  background:#19a08c;
}
label.error {
    font-family:'Source Sans Pro',arial,sans-serif;
    font-size:1em;
    display:block;
    padding-top:10px;
    padding-bottom:10px;
    background-color:#d89c9c;
    width: 80%;
    margin:auto;
    color: #FAFAFA;
    -webkit-border-radius:6px;
    -moz-border-radius:6px;
    border-radius:6px;
}
/* media queries */
@media (max-width: 700px) {
  label.error {
    width: 90%;
  }
input, textarea{
    width: 50%;
  }
  button {
    width:90%;
  }
  body {
  padding-top:10px;
  }  
}
.message {
    font-family:'Source Sans Pro',arial,sans-serif;
    font-size:1.1em;
    display:none;
    padding-top:10px;
    padding-bottom:10px;
    background-color:#2ABCA7;
    width: 80%;
    margin:auto;
    color: #FAFAFA;
    -webkit-border-radius:6px;
    -moz-border-radius:6px;
    border-radius:6px;
}

#bin {
    margin-bottom: 30px;
}

.confim-button {
  background-color:#2ABCA7;
  padding: 15px 10px 10px;
  -ms-border-radius: 5px;
  -o-border-radius: 5px;
  border-radius: 5px;
  border: 1px solid #2ABCA7;
  -webkit-transition: .5s;
  transition: .5s;
  display: inline-block;
  cursor: pointer;
  width:19%;
  color:#fff;
}

#receiver-comfim {
  font-size: 1em;
  padding: 15px 10px 10px;
  font-family: 'Source Sans Pro',arial,sans-serif;
  border: 1px solid #cecece;
  background: #d7d7d7;
  color:#FAFAFA;
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 5px;
  -moz-background-clip: padding;
  -webkit-background-clip: padding-box;
  background-clip: padding-box;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  width: 80%;
  max-width: 600px;
  margin: auto;
  margin-bottom:10px;

}
</style>

<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>

</head>
<body>
<form id="contact" action="<c:url value='/message/send.do'/>" method="post" onsubmit="return submitcheck()">
    <div class="container">
      <div class="head">
        <h2>쪽지쓰기</h2>
      </div>
      
      <input type="text" name="sender" id="meo1" placeholder="보낸사람" value='${user.memberNickname}' readonly="readonly"/><br />
      <input  type="text" name="receiver"  id="meo2" placeholder="받는사람" />
      <button type="button" class="confim-button" id="check">확인</button><br />
      <div id="receiver-comfim"></div>
      <input  type="text" name="title" id="title" placeholder="제목" /><br />
      <textarea type="text" name="content" id="content" placeholder="내용"></textarea><br />
      <div class="message">Message Sent</div>
      <button class="submit-button" id="submit" type="submit">보내기</button>
      <button class="submit-button" id="cancel" type="button">취소</button>
    </div>
  </form>
  <script>
 	var findReceiver = false;
 	$("#check").click (function() {
		$.ajax({
			url: "/seoRak/message/receiver.do",
			data : "nickname="+$("#meo2").val(),
			success: function(data) {
					if (data == 1) {
						$("#receiver-comfim").html("수신자를 찾았습니다.")
						findReceiver = true;
						$("#meo2").attr("readonly", true);
					} else {
						$("#receiver-comfim").html("해당하는 회원이 존재하지 않습니다.")
					}
				}
			})
	  	})
	  	
	function submitcheck() {
 		if(!$("#title").val()) {
 			alert("제목이 입력되지 않았습니다.")
 			return false;
 		}
 		
 		if(!$("#content").val()) {
 			alert("내용이 입력되지 않았습니다.")
 			return false;
 		}
 		
 		if (!findReceiver) {
 			alert("받는 사람이 확인 되지 않았습니다.")
 			return false;
 		} 
 		
 		return true;
 	}
  </script>

</body>
</html>