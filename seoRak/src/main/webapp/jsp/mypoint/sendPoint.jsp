<%@page import="kr.co.seoRak.common.db.MyAppSqlConfig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.seoRak.repository.domain.Member" %>
<%@ page import="kr.co.seoRak.repository.mapper.LoginMapper" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	HttpSession sessionMember = request.getSession();
	Member member = (Member)sessionMember.getAttribute("user");
	String memberId = member.getMemberId();
	int memberPoint = member.getMemberTotalPoint();
	LoginMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(LoginMapper.class);
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#pointBody {
  padding: 60px 0;
  background-color: rgba(178,209,229,0.7);
  margin: 0 auto;	
  width: 100%;
  height : 100%;
}
.body-text {
  padding: 0 20px 15px 10px;
  font-family: "Roboto";
  font-size: 3em;
  color: #333;
  text-align: left;
  line-height: 1.0em;
}
.form-container {
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.card-wrapper {
  background-color: #6FB7E9;
  width: 100%;
  display: flex;

}
.personal-information {
  background-color: #3C8DC5;
  color: #fff;
  padding: 1px 0;
  text-align: center;
  margin-bottom: 10px;
  width: 
}
#sendTitle {
	display: block;
  font-size: 2em;
  font-family: "Roboto";
}
input {
  margin: 2px 0;
  padding-left: 3%;
  font-size: 14px;
}
input[type="text"]{
  display: block;
  height: 50px;
  width: 97%;
  border: none;
}
input[name="content"]{
  display: block;
  margin-top : 1px; 
  height: 300px;
  width: 97%;
  border: none;
}
button[type="submit"]{
  display: block;
  height: 50px;
  width: 50%;
  border: none;
  background-color: #3C8DC5;
  color: #fff;
  margin-top: 2px;
  curson: pointer;
  font-size: 0.9em;
  text-transform: uppercase;
  font-weight: bold;
  cursor: pointer;
}
button[type="submit"]:hover{
  background-color: #6FB7E9;
  transition: 0.3s ease;
  
}
#column-left {
  width: 46.8%;
  float: left;
  margin-bottom: 2px;
}
#column-right {
  width: 46.8%;
  float: right;
}

@media only screen and (max-width: 480px){
  body {
    width: 100%;
    margin: 0 auto;
  }
  .form-container {
    margin: 0 2%;
  }
  input {
    font-size: 1em;
  }
  #input-button {
    width: 100%;
  }
  #input-field {
    width: 96.5%;
  }
  #sendTitle {
    font-size: 4em;
  }
  button {
    margin: 2px 0;
  }
  button[type="submit"]{
    height: 50px;
  }
  #column-left {
    width: 96.5%;
    display: block;
    float: none;
  }
  #column-right {
    width: 96.5%;
    display: block;
    float: none;
  }
}

</style>

</head>
<body>
<div id="pointBody">
<div class="body-text">My Point</div>
        <hr>
     
        <form method="GET" name="sForm"  action='<c:url value="/jsp/sendPoint.do"/>' onsubmit="return doAction()">
          <div class="form-container">
            <div class="personal-information">
              <span id="sendTitle">포인트 보내기</span>
            </div> <!-- end of personal-information -->
                 
                <input id="column-left" type="text" name="sender" placeholder="보내는 사람" value="<%=memberId %>" />
                <input id="column-right" type="text" name="receiver" placeholder="받는 사람"/>
                <input id="column-left" type="text" name="currentPoint" placeholder="현재 보유 포인트                                        <%=memberPoint %>" />
                <input id="column-right" type="text" name="sendPoint" placeholder="보낼 포인트"/>
              	
                <input id="column-left" type="hidden" name="currentPoint_hidden" value="<%=memberPoint %>" />

                <div class="card-wrapper"></div>
            
                <!-- <input id="input-field" type="text" name="streetaddress" required="required" autocomplete="on" maxlength="45" placeholder="Streed Address"/>
                <input id="column-left" type="text" name="city" required="required" autocomplete="on" maxlength="20" placeholder="City"/>
                <input id="column-right" type="text" name="zipcode" required="required" autocomplete="on" pattern="[0-9]*" maxlength="5" placeholder="ZIP code"/>
                <input id="input-field" type="email" name="email" required="required" autocomplete="on" maxlength="40" placeholder="Email"/> -->
                <hr>
                <button id="column-left" name="Success" type="submit" value="Success">Submit</button>
                <button id="column-right" name="Cancle" type="submit" value="Cancle">Cancle</button>

                <!-- <input id="input-button" type="submit" value="Cancle"/> -->   
          </form>
        </div>      
</div>

	<c:choose>
		<c:when test="${check=='before'}">
	        <script>   	
	        	var cancle = document.querySelector("button[name=Cancle]");
	       		
	        	cancle.onclick = function doCancle(){
	           		alert("취소");
	           		self.close();
	           	}
	        	
	        	function doAction(){
	        		var s = document.sForm
	        		var sender = s.sender.value
	
	       			if(s.currentPoint_hidden.value < s.sendPoint.value || s.sendPoint.value <= 0){
	        			alert("포인트 전송 실패");
	        			s.sendPoint.focus();
	        			return false;
	        		}else{
		        		return true;
	        		}
	        	}
	        </script>
		</c:when>
		<c:when test="${check =='unmatch'}">
			<script type="text/javascript">
				alert("보내는사람 혹은 받는사람 아이디가 일치하지 않습니다.");
			</script>
		</c:when>
		<c:when test="${check =='success'}">
			<script type="text/javascript">
				alert("포인트 전송 완료");
				self.close();
			</script>
		</c:when>
	</c:choose>


</body>
</html>