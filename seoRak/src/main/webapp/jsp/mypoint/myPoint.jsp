<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Point - SeoRak</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Montserrat');
body,html {
  background: rgb(195, 210, 180);
}

h1{
  text-align:center;
  color:#393939;
  font-size:3em;
  font-weight:100;
  margin-top:100px;
}
.chart {
  border-radius:20px;
  position:relative;
  min-height: 400px; 
  margin: 50px auto;
  display: block;
  border:1px solid #ccc;
  border-bottom:2px solid #8B96A3;
  background: rgba(255, 255, 255, 9);
  
}

.chart .skills {
  position:absolute;
  display: flex;
  flex-direction: column; 
  height: 100%;
  padding: 0;
  margin: 0;
}
.chart .skills li{
  text-align:right;
  font-size:15px;
  margin:5px 0px;
  color:#333;
}
.chart li{
  list-style: none;
  flex: 1;
  position:relative;
  padding:10px 0px;
}
.chart .bars {
  display: flex;
  flex-direction: column;
  position:absolute;
  padding: 0;
  margin: 0;
  height:100%;
  overflow:hidden;
}
.chart .bars .bar{
  width: 0px;
  background:#47EAD4;
  padding:10px 0px;
  float:left;
  color:#333;
  overflow:hidden;
  text-align:center;
}
.chart .bars .bar:nth-child(odd),#personal {
    background:#223138;
    color:#fff;
}

.chart .bars .bar:nth-child(odd):hover{
   background:#0F1E26;
}
.chart .bars .bar:nth-child(even):hover{
   background:#40CFBC;
}
#profession{
  background:#47EAD4;
  color:#333;
}
#profession,#personal{
  padding:10px;
  display:inline-block;
  text-align:center;
}
.header{
  position:fixed;
  left:0px;
  top:0px;
  width:100%;
  background:#f9f9f9;
  border-bottom:1px solid #DEDEDE;
  box-shadow: 0 0px 6px 0px #858585;
}

.footer{
  position:absolute;
  bottom:-10%; 
  right:20px;
  color:#333;
}

@media only screen and (max-width: 800px) {
	.chart{
   width:100%;
 } 
  .skills{ 
    width:20%;
  }
  .bars{
    width: 75%;
    left:25%;
  }
  
}

@media only screen and (min-width: 800px) {
  	.chart{
     width:90%;
   } 
    .skills{
      width: 13%;
  }
  .bars{
    width: 85%;
    left:15%;
  }
}

@media only screen and (min-width: 1300px) {
  .chart{
   width:70%;
    max-width:700px;
 } 
  .skills{
    width: 13%;
  }
  .bars{
    width:85%;
    left:15%;
  }
}

@media only screen and (max-width: 500px) {
 .chart{
   width:100%;
 } 
  .skills{
    width:30%;
  }
  .bars{
    width: 65%;
    left:35%;
  }
}

p{
  width:90%;
  margin:40px auto;
  text-align:center;
}
</style>
</head>
<body>
	<script>
		function unMatch(){
			if(`${unmatch}`){
				alert("보내는사람 또는 받는사람 id가 일치하지 않습니다.")		
			}
		}
	</script>
	<%@include file="../includeBar/topList.jsp" %>
	<div>
		<h1>My Point</h1>
		<hr>
	</div>
	<center>
		<p id="button">
			<form id="sForm">
				<input name="refresh" type='button' value='Refresh' />
				<input type='button' onclick="openSendPop()" value='포인트 보내기' />
				<input name="checkSendPoint" type='button' value='보낸 포인트 확인하기' />
				<input name="pointRanking" type='button' value='포인트 랭킹' />
			</form>
		</p>
	</center>
	<div class="chart">
		<div class="skills"></div>
		<div class="bars"></div>
		<div class='footer'>Point (p)</div>
	</div>

	<script>
	/* 받은 포인트함 가기 */
	var checkSendPoint = document.querySelector("input[name=checkSendPoint]");
	checkSendPoint.onclick = function checkPoint(){
		location.replace("/seoRak/jsp/sendPointBox.do");
	}
	/* 포인트 보내기 */
	function openSendPop(){
		window.open(
			/* http://localhost:8000/seoRak/jsp/sendPoint.jsp */
			"http://localhost:8000/seoRak/sendPointForm.do", "포인트 보내기", "width=700px,height=500px"	
		)
	}

	/* 포인트 랭킹 */
	var pointRanking = document.querySelector("input[name=pointRanking]");
	pointRanking.onclick = function pointRank(){
		location.replace("/seoRak/jsp/pointRank.do");
	}
	
	/* 메뉴 상단 바*/    
	var navigation = $('#nav-main').okayNav();

	/* my point */    
	$(function() {
	  //list of skills
	  var skills = {
			  		/*
		                "보낸 포인트" 	---------- 1
		                "받은 포인트" 	---------- 2
		                "게시글 포인트"	---------- 3
		                "출석 포인트"	---------- 4
			  		*/
	                "총 포인트":{work:`${totalPoint}`,personal:0},
	                "보낸 포인트":{work:`${sendPoint}`,personal:0},
	                "받은 포인트":{work:`${receivePoint}`,personal:0},
	                "게시글 포인트" :{work:`${boardPoint}`,personal:0},
	                "출석 포인트":{work:`${attendPoint}`,personal:0}
	               };
	  displayData(skills);
	  animate();
	  
	  //add new skill
	   /* $('input:button').click(function(){
	    var name = $('#txtSkill').val(),
	        perc = $('#txtPerc').val();
	    
	    if(name && perc){
	      skills[name] = {work:perc};
	      displayData(skills);
	      animate();
	
	      var newheight = $('.chart').outerHeight() + 50;
	      $('.chart').css('height',newheight);
	    }else{
	      animate();
	    }
	    $('input:text').val('');
	  }); */
	});
	
	//Functions
	//display data
	function displayData(skills){
	  $('.bars').html('');
	  $('.skills').html('');
	  for (var key in skills){
	    var personal = skills[key].personal,
	        work = skills[key].work;
	    
	    $('.skills').append("<li><span>"+key+"</span></li>");
	    $('.bars').append("<li><div data-percentage='"+skills[key].personal+"' class='bar'>"+personal+"</div><div data-percentage='"+skills[key].work+"' class='bar'>"+work+"</div></li>"); 
	  };
	}
	
	
	//animate the data
	function animate(){
	  $('.bar').css('width','0px');
	  $(".bars .bar").delay(1000).each(function(i){
	    var percentage = $(this).data('percentage');
	    
	    $(this).delay(i+"00").animate({'width': percentage + 'px'}, 700);
	   
	  });
	}
</script>
</body>
</html>