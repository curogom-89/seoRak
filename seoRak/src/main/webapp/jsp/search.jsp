<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

.list li {
  background: url("https://bradfrost.github.com/this-is-responsive/patterns/images/icon_arrow_right.png") no-repeat 97% 50%;
  border-bottom: 1px solid #ccc;
  display: table;
  border-collapse: collapse;
  width: 100%;
}
.inner {
  display: table-row;
  overflow: hidden;
}
.li-img {
  display: table-cell;
  vertical-align: middle;
  width: 30%;
  padding-right: 1em;
}
.li-img img {
  display: block;
  width: 100%;
  height: auto;
}
.li-text {
  display: table-cell;
  vertical-align: middle;
  width: 70%;
  font-size: 16px;
  color:  rgb(80, 80, 80)
}
.li-head {
  margin: 0;
}
.li-sub {
  margin: 0;
}

@media all and (min-width: 45em) {
  .list li {
    float: left;
    width: 50%;
  }
}

@media all and (min-width: 75em) {
  .list li {
    width: 33.33333%;
  }
}


   </style>
   

</head>
<body>
	<%@include file="topList.jsp" %>
<h2>도서 검색</h2>
 <div id="pattern" class="pattern">
    <ul class="list img-list">
          <li>
              <a href="#" class="inner">
                  <div class="li-img">
                  <img src="../img/myBookList_a1.PNG">
                  </div>
                  <div class="li-text">
                      <h4 class="li-head">Title of Content</h4>
                      <p class="li-sub">Summary of content</p>
                  </div>
              </a>
          </li>
          <li>
              <a href="#" class="inner">
                  <div class="li-img">
                  	 <img src="<c:url value='/img/myBookList_a1.PNG'/>"/>
                  </div>
                  <div class="li-text">
                      <h4 class="li-head">Title of More Content</h4>
                      <p class="li-sub">Summary of more content</p>
                  </div>
              </a>
          </li>
          <li>
              <a href="#" class="inner">
                  <div class="li-img">
                	 <img src="<c:url value='/img/myBookList_a1.PNG'/>"/>                  </div>
                  <div class="li-text">
                      <h4 class="li-head">Title of Even More Content</h4>
                      <p class="li-sub">Summary of even more content</p>
                  </div>
              </a>
          </li>
          <li>
              <a href="#" class="inner">
                  <div class="li-img">
                	 <img src="<c:url value='/img/myBookList_a1.PNG'/>"/>           </div>
                  <div class="li-text">
                      <h4 class="li-head">Title of Content</h4>
                      <p class="li-sub">Summary of content</p>
                  </div>
              </a>
          </li>
          <li>
              <a href="#" class="inner">
                  <div class="li-img">
                 	 <img src="<c:url value='/img/myBookList_a1.PNG'/>"/>
                  </div>
                  <div class="li-text">
                      <h4 class="li-head">Title of More Content</h4>
                      <p class="li-sub">Summary of more content</p>
                  </div>
              </a>
          </li>
          <li>
              <a href="#" class="inner">
                  <div class="li-img">
              	 <img src="<c:url value='/img/myBookList_a1.PNG'/>"/>
                  </div>
                  <div class="li-text">
                      <h4 class="li-head">Title of Even More Content</h4>
                      <p class="li-sub">Summary of even more content</p>
                  </div>
              </a>
          </li>
          <li>
              <a href="#" class="inner">
                  <div class="li-img">
                 	 <img src="<c:url value='/img/myBookList_a1.PNG'/>"/>
                  </div>
                  <div class="li-text">
                      <h4 class="li-head">Title of Content</h4>
                      <p class="li-sub">Summary of content</p>
                  </div>
              </a>
          </li>
          <li>
              <a href="#" class="inner">
                  <div class="li-img">
                	 <img src="<c:url value='/img/myBookList_a1.PNG'/>"/>
                  </div>
                  <div class="li-text">
                      <h4 class="li-head">Title of More Content</h4>
                      <p class="li-sub">Summary of more content</p>
                  </div>
              </a>
          </li>
          <li>
              <a href="#" class="inner">
                  <div class="li-img">
                 		 <img src="<c:url value='/img/myBookList_a1.PNG'/>"/>
                  </div>
                  <div class="li-text">
                      <h4 class="li-head">Title of Even More Content</h4>
                      <p class="li-sub">Summary of even more content</p>
                  </div>
              </a>
          </li>
          <li>
              <a href="#" class="inner">
                  <div class="li-img">
                 <img src="../img/myBookList_a1.PNG">
                  </div>
                  <div class="li-text">
                      <h4 class="li-head">Title of Content</h4>
                      <p class="li-sub">Summary of content</p>
                  </div>
              </a>
          </li>
          <li>
              <a href="#" class="inner">
                  <div class="li-img">
                  	 <img src="<c:url value='/img/myBookList_a1.PNG'/>"/>     </div>
                  <div class="li-text">
                      <h4 class="li-head">Title of More Content</h4>
                      <p class="li-sub">Summary of more content</p>
                  </div>
              </a>
          </li>
          <li>
              <a href="#" class="inner">
                  <div class="li-img">
              	 <img src="<c:url value='/img/myBookList_a1.PNG'/>"/>           </div>
                  <div class="li-text">
                      <h4 class="li-head">Title of Even More Content</h4>
                      <p class="li-sub">Summary of even more content</p>
                  </div>
              </a>
          </li>
      </ul>
  </div>

</body>
</html>