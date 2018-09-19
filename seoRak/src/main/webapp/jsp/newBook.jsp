<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
* {
	box-sizing: border-box
}
table {
    border-collapse: collapse;
    width: 100%;
    background: #fff;
}

th {
    background-color: #326295;
    font-weight: bold;
    color: #fff;
    white-space: nowrap;
}

td, th {
    padding: 1em 1.5em;
    text-align: left;
}

tbody th {
	background-color: #2ea879;
}

tbody th {
	background-color: #2ea879;
}
tbody tr:nth-child(2n-1) {
    background-color: #f5f5f5;
    transition: all .125s ease-in-out;
}
tbody tr:hover {
    background-color: rgba(50,98,149,.3);
}






#newBook{
	width:611px;
	
    font-family: fantasy;
    float:left;
    padding-left :30px;
    margin-left: 10%;
    padding-right: 0px;
    margin-right:10px;
    font-size: 9.8px;
   
}


#recommendBook {
	width:611px;
	margin-left:20px;
    font-family: fantasy;
    
    float:left;
  	height:1920px;
  	padding-left:10px;
  	font-size:11px;
    
}
  tr,td{
 
  border:solid thin;;
  margin: auto;  
   }
  .time {
  	margin:auto;
  	
  	text-align: center;
  	
  }
 .selectBookmarket{
  margin-left: 181px;
 }
 .selectDate{
  margin-left: 0%;
 }
 .selectbutton{
  margin-left: 181px;
 }
 
 
#newBook #newTitle,#recommendBook #recommendTittle{

margin-left:auto;
font-style: italic;
font-weight: bold;
font-size:15px;
color:#326295;
}
#newBook  #table1{
	width:429.6;
	height:1569.6px;
}
#newBook  #table2{
 width:429.6;
	height:1569.6px;
}
 .selectBookmarket{
  margin-left: 181px;
 }
</style>
<body>

  <%@include file="topList.jsp"%>
  <div class="time"><h1>신간도서/추천도서</h1></div> 
   <div class="selectBookmarket">
   <select class="Bookmarket" >
                <option value="0">교보문고</option>    
                <option value="1">YES 24</option>    
                <option selected value="3">알라딘</option>
                <option selected value="4">인터파크 도서</option> 
                <option selected value="5">반디앤루니스</option> 
                <option selected value="6">도서 11번가</option>                              
   </select>
   <br><br>
    </div>
 
    <div id="newBook">
 		<span id="newTitle" style="font-size:15px;">신간서적</span><br>
 			
    
 		
        <table id="table1" style="margin:auto;">
        	
        	<thead>
        
            <tr>
               
                <th>저자</th>
                <th>책이름</th>
                <th>출판사</th>
                <th>저자</th>
                <th>발간일</th>
            	
            </tr>
            </thead>
            <tbody>
             <tr>
               
                <td><img src="https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914"/></td>
                <td>돌이킬 수 없는 약속</td>
                <td>출판사</td>
                <td>야쿠마루 가쿠 저</td>
                <td>2017.02.02</td>
               
            </tr>
             <tr>
               
                <td><img src="https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914"/></td>
                <td>돌이킬 수 없는 약속</td>
                <td>출판사</td>
                <td>야쿠마루 가쿠 저</td>
                <td>2017.02.02</td>
              	
            </tr>
             <tr>
                
                <td><img src="https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914"/></td>
                <td>돌이킬 수 없는 약속</td>
                <td>출판사</td>
                <td>야쿠마루 가쿠 저</td>
                <td>2017.02.02</td>
                
            </tr>
             <tr>
                
                <td><img src="https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914"/></td>
                <td>돌이킬 수 없는 약속</td>
                <td>출판사</td>
                <td>야쿠마루 가쿠 저</td>
                <td>2017.02.02</td>
               
            </tr>
            <tr>
                
                <td><img src="https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914"/></td>
                <td>돌이킬 수 없는 약속</td>
                <td>출판사</td>
                <td>야쿠마루 가쿠 저</td>
                <td>2017.02.02</td>
                
            </tr>
             <tr>
                
                <td><img src="https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914"/></td>
                <td>돌이킬 수 없는 약속</td>
                <td>출판사</td>
                <td>야쿠마루 가쿠 저</td>
                <td>2017.02.02</td>
               
            </tr>
             <tr>
               
                <td><img src="https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914"/></td>
                <td>돌이킬 수 없는 약속</td>
                <td>출판사</td>
                <td>야쿠마루 가쿠 저</td>
                <td>2017.02.02</td>
              
            </tr>
             <tr>
              
                <td><img src="https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914"/></td>
                <td>돌이킬 수 없는 약속</td>
                <td>출판사</td>
                <td>야쿠마루 가쿠 저</td>
                <td>2017.02.02</td>
                
            </tr>
             <tr>
                
                <td><img src="https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914"/></td>
                <td>돌이킬 수 없는 약속</td>
                <td>출판사</td>
                <td>야쿠마루 가쿠 저</td>
                <td>2017.02.02</td>
               
            </tr>
             <tr>
               
                <td><img src="https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914"/></td>
                <td>돌이킬 수 없는 약속</td>
                <td>출판사</td>
                <td>야쿠마루 가쿠 저</td>
                <td>2017.02.02</td>
               
            </tr>
             <tr>
              
                <td><img src="https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914"/></td>
                <td>돌이킬 수 없는 약속</td>
                <td>출판사</td>
                <td>야쿠마루 가쿠 저</td>
                <td>2017.02.02</td>
             
            </tr>
            </tbody>
        </table>
    </div>
 
    <div id="recommendBook">
    	<span id="recommendTittle">추천도서</span>
    	<span style="float:right;">
    	
	<input id="book1" type="radio" name="bookmenu" value="1" checked/>
            	<label for="book1">관련도순</label>
 			<input id="book2" type="radio" name="bookmenu" value="2" />
            	<label for="book2">출간일순</label>
            <input id="book3" type="radio" name="bookmenu" value="3"/>            
            	<label for="book3">추천순</label>
    	</span>
         <table id="table2" style="margin:auto">
         	 
         	
        	<thead>
            <tr>
                <th>순위</th>
                <th>그림</th>
                <th>책이름</th>
                <th>출판사</th>
                <th>발간일</th>
                <th>그림</th>
               
            </tr>
            </thead>
            <tbody>
             <tr>
                <td>1</td>
                <td><img src="https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914"/></td>
                <td>돌이킬 수 없는 약속</td>
                <td>출판사</td>
                <td>야쿠마루 가쿠 저</td>
                <td>2017.02.02</td>
                
            </tr>
             <tr>
                <td>2</td>
                <td><img src="https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914"/></td>
                <td>돌이킬 수 없는 약속</td>
                <td>출판사</td>
                <td>야쿠마루 가쿠 저</td>
                <td>2017.02.02</td>
                
            </tr>
             <tr>
                <td>3</td>
                <td><img src="https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914"/></td>
                <td>돌이킬 수 없는 약속</td>
                <td>출판사</td>
                <td>야쿠마루 가쿠 저</td>
                <td>2017.02.02</td>
          
            </tr>
             <tr>
                <td>4</td>
                <td><img src="https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914"/></td>
                <td>돌이킬 수 없는 약속</td>
                <td>출판사</td>
                <td>야쿠마루 가쿠 저</td>
                <td>2017.02.02</td>
            
            </tr>
            <tr>
                <td>5</td>
                <td><img src="https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914"/></td>
                <td>돌이킬 수 없는 약속</td>
                <td>출판사</td>
                <td>야쿠마루 가쿠 저</td>
                <td>2017.02.02</td>
              
            </tr>
             <tr>
                <td>6</td>
                <td><img src="https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914"/></td>
                <td>돌이킬 수 없는 약속</td>
                <td>출판사</td>
                <td>야쿠마루 가쿠 저</td>
                <td>2017.02.02</td>
            
            </tr>
             <tr>
                <td>6</td>
                <td><img src="https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914"/></td>
                <td>돌이킬 수 없는 약속</td>
                <td>출판사</td>
                <td>야쿠마루 가쿠 저</td>
                <td>2017.02.02</td>
                
            </tr>
             <tr>
                <td>7</td>
                <td><img src="https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914"/></td>
                <td>돌이킬 수 없는 약속</td>
                <td>출판사</td>
                <td>야쿠마루 가쿠 저</td>
                <td>2017.02.02</td>
           
            </tr>
             <tr>
                <td>8</td>
                <td><img src="https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914"/></td>
                <td>돌이킬 수 없는 약속</td>
                <td>출판사</td>
                <td>야쿠마루 가쿠 저</td>
                <td>2017.02.02</td>
       
            </tr>
             <tr>
                <td>9</td>
                <td><img src="https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914"/></td>
                <td>돌이킬 수 없는 약속</td>
                <td>출판사</td>
                <td>야쿠마루 가쿠 저</td>
                <td>2017.02.02</td>
              
            </tr>
             <tr>
                <td>10</td>
                <td><img src="https://bookthumb-phinf.pstatic.net/cover/116/111/11611116.jpg?type=m1&udate=20180914"/></td>
                <td>돌이킬 수 없는 약속</td>
                <td>출판사</td>
                <td>야쿠마루 가쿠 저</td>
                <td>2017.02.02</td>
             
            </tr>
            </tbody>
            
        </table>  
       
    </div>
  
</body>
</html>