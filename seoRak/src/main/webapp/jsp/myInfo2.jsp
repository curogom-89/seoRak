<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>Insert title here</title>
	<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	<style>
		/* my info */
* {
  box-sizing: border-box;
  transition: 1s ease-in-out;
}

html, body {
  background-color: rgba(45, 49, 255, 0.7);
  height: 100%;

}
html h1, body h1 {
  font-size: 25px;
  font-weight: 200;
  color: white;
  line-height: 30px;
  margin-bottom: 10px;
}
html h2, body h2 {
  font-size: 15px;
  color: rgb(0, 3, 172);
}

#wrapper {
  opacity: 0;
  /* display: table; */
  height: 100%;
  width: 50%;
}

#wrapper.loaded {
  opacity: 1;
  transition: 1s ease-in-out;
}
#wrapper #content {
  display: table-cell;
  vertical-align: middle;
}

#myBook {
    height: 500px;
    width: 800px;
    /* margin: 0 auto; */
    position: relative;
    z-index: 1;
    perspective: 600px;
    left:20px;
    
}
#myBook #front {
    border-radius: 10px;
    height: 100%;
    width: 100%;
    position: absolute;
    left: 40px;
    top: 40px;
    transform-style: preserve-3d;
    backface-visibility: hidden;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    background: black;
    opacity: 0.3;
    
}

#bookRank {
    height: 500px;
    width: 450px;
    /* margin: 0 auto; */
    position: relative;
    z-index: 1;
    perspective: 600px;
    left:-00px;
}
#bookRank #front {
    border-radius: 10px;
    height: 100%;
    width: 100%;
    position: absolute;
    left: 70px;
    top: 40px;
    transform-style: preserve-3d;
    backface-visibility: hidden;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    background: black;
    opacity: 0.3;
}

#boardList {
    height: 500px;
    width: 800px;
    /* margin: 0 auto; */
    position: relative;
    z-index: 1;
    perspective: 600px;
    left:270px;
}
#boardList #front {
    border-radius: 10px;
    height: 100%;
    width: 100%;
    position: absolute;
    left: 40px;
    top: 40px;
    transform-style: preserve-3d;
    backface-visibility: hidden;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    background: black;
    opacity: 0.3;
}
#newBookList {
    height: 500px;
    width: 450px;
    /* margin: 0 auto; */
    position: relative;
    z-index: 1;
    perspective: 600px;
    left:250px;
}
#newBookList #front {
    border-radius: 10px;
    height: 100%;
    width: 100%;
    position: absolute;
    left: 70px;
    top: 40px;
    transform-style: preserve-3d;
    backface-visibility: hidden;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    background: black;
    opacity: 0.3;
}

#card {
  height: 500px;
  width: 250px;
  /* margin: 0 auto; */
  position: relative;
  z-index: 1;
  perspective: 600px;
  
}
#card #front, #card #back {
  border-radius: 10px;
  height: 100%;
  width: 100%;
  position: absolute;
  left: 40px;
  top: 40px;
  transform-style: preserve-3d;
  backface-visibility: hidden;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}
#card #front {
  transform: rotateY(0deg);
  overflow: hidden;
  z-index: 1;
}
#card #front #arrow {
  position: absolute;
  height: 50px;
  line-height: 50px;
  font-size: 20px;
  z-index: 10;
  bottom: 0;
  right: 10px;
  color: rgba(255, 255, 255, 0.5);
  animation: arrowWiggle 1s ease-in-out infinite;
}
#card #front #top-pic {
  height: 0%;
  width: 100%;
  background-image: url(https://unsplash.imgix.net/45/ZLSw0SXxThSrkXRIiCdT_DSC_0345.jpg?q=75&w=1080&h=1080&fit=max&fm=jpg&auto=format&s=857f07b76abac23a7fb7161cc7b12a46);
  background-size: cover;
}
#card #front #avatar {
  width: 130px;
  height: 130px;
  top: 30%;
  left: 50%;
  margin: -77px 0 0 -57px;
  border-radius: 100%;
  box-shadow: 0 0 0 3px rgba(255, 255, 255, 0.8), 0 4px 5px rgba(107, 5, 0, 0.6), 0 0 50px 50px rgba(255, 255, 255, 0.25);
  background-image: url(http://0.gravatar.com/avatar/fa4df8540bab3cb38f7dfa60c6e0522c?size=2000);
  background-size: contain;
  position: absolute;
  z-index: 1;
}
#card #front #info-box {
  height: 50%;
  width: 100%;
  position: absolute;
  display: table;
  left: 0;
  bottom: 0;
  background: rgba(45, 49, 255, 0.7);
  padding: 50px;
}
#card #front #social-bar {
  height: 50px;
  width: 100%;
  position: absolute;
  bottom: 0;
  left: 0;
  line-height: 50px;
  font-size: 18px;
  text-align: center;
}
#card #front #social-bar a {
  display: inline-block;
  color:rgb(0, 3, 172);
  text-decoration: none;
  padding: 5px;
  line-height: 18px;
  border-radius: 5px;
}
#card #front #social-bar a:hover {
  color: rgb(0, 3, 172);
  background: rgba(255, 255, 255, 0.3);
  transition: 1s ease-in-out;
}
#card #back {
  transform: rotateY(180deg);
  background-color: rgba(255, 255, 255, 0.6);
  display: table;
  z-index: 2;
  font-size: 13px;
  line-height: 20px;
  padding: 50px;
}
#card #back .back-info {
  text-align: justify;
  text-justify: inter-word;
}
#card #back #social-bar {
  height: 50px;
  width: 100%;
  position: absolute;
  bottom: 0;
  left: 0;
  line-height: 50px;
  font-size: 18px;
  text-align: center;
}
#card #back #social-bar a {
  display: inline-block;
  line-height: 18px;
  color: rgb(0, 3, 172);
  text-decoration: none;
  padding: 5px;
  border-radius: 5px;
}
#card #back #social-bar a:hover {
  color: #450300;
  background: rgba(223, 74, 66, 0.5);
  transition: 1s ease-in-out;
}
#card .info {
  display: table-cell;
  height: 100%;
  vertical-align: middle;
  text-align: center;
}
#card.flip #front {
  transform: rotateY(180deg);
}
#card.flip #back {
  transform: rotateY(360deg);
}

#background {
  position: fixed;
  background-color: black;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
}
#background #background-image {
  height: calc(100% + 60px);
  width: calc(100% + 60px);
  position: absolute;
  top: -30px;
  left: -30px;
  -webkit-filter: blur(10px);
  background-image: url(https://unsplash.imgix.net/45/ZLSw0SXxThSrkXRIiCdT_DSC_0345.jpg?q=75&w=1080&h=1080&fit=max&fm=jpg&auto=format&s=857f07b76abac23a7fb7161cc7b12a46);
  background-size: cover;
}

@keyframes arrowWiggle {
  0% {
    right: 50px;
  }
  50% {
    right: 35px;
  }
  100% {
    right: 50px;
  }
}
/* table */

#title_list  {
    position: absolute;
    color: white;
    font-size: 40px;
    left: 40px;
    top: 20px;
    font-weight: bold;
    opacity : 1.0;
    
}
#title_book_rank  {
    position: relative;
    color: white;
    font-size: 40px;
    left: 110px;
    top: 60px;
    font-weight: bold;
}
#title_new_board  {
    position: relative;
    color: white;
    font-size: 40px;
    left: 40px;
    top: 20px;
    font-weight: bold;
    float: left;
}
#title_hot_board {
    position: relative;
    color: white;
    font-size: 40px;
    left: 430px;
    top: -330px;
    font-weight: bold;
    float: left;
}

#title_new_book_list {
    position: relative;
    color: white;
    font-size: 40px;
    left: -140px;
    top: 20px;
    font-weight: bold;
    float: right;
}
#book_container {
  position: absolute;
  margin: 75px 40px;
  width: 730px;
  height: 80%;
  border: 1px solid white;
  overflow: scroll;
}
#book_img{
  position: relative;
  width: 300px;
  height: 100%;
  border: 1px solid white;  
  background: white;
  float: left;
  margin: 0px 20px 0px 0px;
}


table {
	position : relative;
	border-collapse: collapse;
	width: 400px;
	height:70%;
    left: 20px;
    top: 90px;
    color: white;
	}
  table[id=new_board]{
    position: relative;
    left : -240px;
    top : 100px;
    width: 350px;

  }
  table[id=hot_board]{
    float: right;
    left : -40px;
    width: 350px;
    top: -250px;
  }
  table[id=new_book_list]{
    float: right;
    left : -70px;
    width: 350px;
    top: 50px;
  }

	th {
	   /* background-color: #27ae60; */
	    white-space: nowrap;
        font-size: 20px;
        color:rgb(156, 156, 156);
	}
	td {
        font-size: 10px;
    }
	td, th {
	    text-align: center;
        /* color: white; */
  }
	tbody th {
		/* background-color: #2ea879; */
	}
	tbody tr:nth-child(2n-1) {
	    transition: all 1s ease-in-out;
	}
	tbody tr:hover {
	    background-color: rgba(50,98,149,.3);
	}
	
	td.rank {
		text-transform: capitalize;
	}
	#popoz{
	text-decoration: none;
	
	color:  rgb(0,0,170);
	}
	#popoz:hover{
	text-decoration: none;
	}
	
	button{
		position : absolute;
		right : 50px;
		top: 30px;
	}
	</style>
</head>

<body>
	<%@include file="topList.jsp" %>
	<!-- myInfo 1 -->
    <div id="wrapper">
        <div id="content">
          <div id="card">
            <div id="front">
              <div id="top-pic"></div>
              <div id="avatar"></div>
              <div id="arrow"><i class="fa fa-arrow-left"></i></div>
              <div id="info-box">
                <div class="info">
                  <h1>User ID</h1>
                  <h2>User NickName</h2>
                  <h2>저장 가능 서재 수량</h2>
                  <h2><a href="<c:url value='myPoint.jsp'/>" id="popoz">포인트</a></h2>
                </div>
              </div>
              <div id="social-bar">
              
                <a href="javascript:void" class="more-info">
                  <i class="fa fa-user"></i>
                </a>
              </div>
            </div>
            <div id="back">
              <div class="back-info">
                <p>My name is Jesse Couch, and I am an award winning, intensely creative, </p>
              </div>
              <div id="social-bar">
                <a href="javascript:void" class="more-info">
                  <i class="fa fa-undo"></i>
                </a>
              </div>
            </div>
          </div>
          <div id="background">
            <div id="background-image"></div>
          </div>
        </div>

    <!-- my List -->
    <div id="content">
    
        <div id="myBook">
        	
            <div id="front">
            	<form method="POST" action='<c:url value="list.do" />'>
            		<button>내 서재 바로가기</button>
            	</form>
    			<div id="title_list">My Book List</div>
              	<div id="book_container">
                <div id="book_img">
                  img1
                </div>
                <div id="book_img">
                  img2
                </div>
                <div id="book_img">
                  img3
                </div> 
                  
              </div>  
            </div>
        </div>
    </div>

    <!-- book Rank -->
    <div id="content">
        <div id="bookRank">
            <div id="title_book_rank">Book Rank</div>
            <div id="front">
                <div id="bookRank">
                        <table>
                            <thead>
                                <tr>
                                    <th>순위</th>
                                    <th>제목</th>
                                    <th>출판사</th>
                                    <th>+/-</th>
                                </tr>
                            </thead>
                            <tbody>
                           <tr>
                            <td class="rank">1</td>
                            <td class="team">Spain</td>
                            <td class="points">비트캠프</td>
                            <td class="up-down">0</td>
                          </tr>
                          <tr>
                            <td class="rank">2</td>
                            <td class="team">Germany</td>
                            <td class="points">비트캠프</td>
                            <td class="up-down">0</td>
                          </tr>
                          <tr>
                            <td class="rank">3</td>
                            <td class="team">Portugal</td>
                            <td class="points">비트캠프</td>
                            <td class="up-down">0</td>
                          </tr>
                          <tr>
                            <td class="rank">4</td>
                            <td class="team">Brazil</td>
                            <td class="points">비트캠프</td>
                            <td class="up-down">+2</td>
                          </tr>
                          <tr>
                            <td class="rank">5</td>
                            <td class="team">Brazil</td>
                            <td class="points">비트캠프</td>
                            <td class="up-down">+2</td>
                          </tr>
                            
                          </tbody>
                      </table>
                </div>      
            </div>
        </div>
    </div>
    
    <!-- board List -->
<p>
    <div id="content">
            <div id="boardList">
                <div id="front">
                    <div id="title_new_board">New Board List</div>
                    <table id="new_board">
                        <thead>
                            <tr>
                                <th>순위</th>
                                <th>제목</th>
                                <th>출판사</th>
                                <th>+/-</th>
                            </tr>
                        </thead>
                        <tbody>
                          <tr>
                          <td class="rank">1</td>
                          <td class="team">Spain</td>
                          <td class="points">비트캠프</td>
                          <td class="up-down">0</td>
                        </tr>
                        <tr>
                          <td class="rank">2</td>
                          <td class="team">Germany</td>
                          <td class="points">비트캠프</td>
                          <td class="up-down">0</td>
                        </tr>
                        <tr>
                          <td class="rank">3</td>
                          <td class="team">Portugal</td>
                          <td class="points">비트캠프</td>
                          <td class="up-down">0</td>
                        </tr>
                        <tr>
                          <td class="rank">4</td>
                          <td class="team">Brazil</td>
                          <td class="points">비트캠프</td>
                          <td class="up-down">+2</td>
                        </tr>
                        <tr>
                          <td class="rank">5</td>
                          <td class="team">Brazil</td>
                          <td class="points">비트캠프</td>
                          <td class="up-down">+2</td>
                        </tr>
                      </tbody>
                      </table>
                      <div id="title_hot_board">Hot Board List</div>
                    <table id="hot_board">
                        <thead>
                            <tr>
                                <th>순위</th>
                                <th>제목</th>
                                <th>출판사</th>
                                <th>+/-</th>
                            </tr>
                        </thead>
                        <tbody>
                          <tr>
                          <td class="rank">1</td>
                          <td class="team">Spain</td>
                          <td class="points">비트캠프</td>
                          <td class="up-down">0</td>
                        </tr>
                        <tr>
                          <td class="rank">2</td>
                          <td class="team">Germany</td>
                          <td class="points">비트캠프</td>
                          <td class="up-down">0</td>
                        </tr>
                        <tr>
                          <td class="rank">3</td>
                          <td class="team">Portugal</td>
                          <td class="points">비트캠프</td>
                          <td class="up-down">0</td>
                        </tr>
                        <tr>
                          <td class="rank">4</td>
                          <td class="team">Brazil</td>
                          <td class="points">비트캠프</td>
                          <td class="up-down">+2</td>
                        </tr>
                        <tr>
                          <td class="rank">5</td>
                          <td class="team">Brazil</td>
                          <td class="points">비트캠프</td>
                          <td class="up-down">+2</td>
                        </tr>
                      </tbody>
                      </table>
                </div>
            </div>
    </div>
    <div id="content">
            <div id="newBookList">
                <div id="front">
                    <div id="title_new_book_list">New Book List</div>
                    <table id="new_book_list">
                        <thead>
                            <tr>
                                <th>순위</th>
                                <th>제목</th>
                                <th>출판사</th>
                                <th>+/-</th>
                            </tr>
                        </thead>
                        <tbody>
                       <tr>
                        <td class="rank">1</td>
                        <td class="team">Spain</td>
                        <td class="points">비트캠프</td>
                        <td class="up-down">0</td>
                      </tr>
                      <tr>
                        <td class="rank">2</td>
                        <td class="team">Germany</td>
                        <td class="points">비트캠프</td>
                        <td class="up-down">0</td>
                      </tr>
                      <tr>
                        <td class="rank">3</td>
                        <td class="team">Portugal</td>
                        <td class="points">비트캠프</td>
                        <td class="up-down">0</td>
                      </tr>
                      <tr>
                        <td class="rank">4</td>
                        <td class="team">Brazil</td>
                        <td class="points">비트캠프</td>
                        <td class="up-down">+2</td>
                      </tr>
                      <tr>
                        <td class="rank">5</td>
                        <td class="team">Brazil</td>
                        <td class="points">비트캠프</td>
                        <td class="up-down">+2</td>
                      </tr>
                        
                      </tbody>
                  </table>
                </div>
            </div>
    </div>
    
</p>
      
    </div>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
      <script>
        $(window).load(function(){
             $('#wrapper').addClass('loaded');
        })

        $('.more-info').click(function(){
            $("#card").toggleClass('flip');
            $('#arrow').remove();
        });
        $('#background').click(function(){
            $('#card').removeClass('flip');
        })
      </script>
</body>
</html>