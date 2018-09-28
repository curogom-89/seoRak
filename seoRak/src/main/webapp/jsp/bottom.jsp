<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

.site-logo {
	transition: color 200ms cubic-bezier(.55, 0, .1, 1);
	color: #30acff;
	font-size: 2rem;
}
    div{
/*   		  bottom: 100px;
        right: 100px; */
    }
    #bot{
    	border : 0px;
    	height : 1px;
        background: rgb(150, 145, 145);
		
    }
    #bottom{
     width : 100%;
     height: 130px;
     background: rgb(150, 145, 145);
     
    }
    #le{
        margin-left: 37%;
    }
    #cen{
        margin-left: 35%;
    }
    #cenimg{
		margin-left : 10px;
    	width: 70px;
    	height: 30px;
    }
#fixedfooter {
position:static;
left:0px;
bottom:0px;
width: 100%;

}

</style>
</head>
<body>

  <div id="fixedfooter">
  <hr id="bot">
    <div id="bottom">
    <a class="site-logo" href="#"> SeoRak</a> 
    <div id="cen">유병욱 , 최창유 , 방진웅 , 김세영 , 신득수 <span><img src="<c:url value='/img/pasbook.JPG'/>" id="cenimg"/></span></div> <br>
    <div id="le">Mini Project Library & Search</div>
  </div>
</div>
</body>
</html>