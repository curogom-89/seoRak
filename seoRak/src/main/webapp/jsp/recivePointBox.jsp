<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>body {
	font-family: 'Lato', Arial, sans-serif;
	color: #555353;
}

.container > header {
	margin: 0 auto;
	padding: 1em;
	text-align: center;
}

.container > header h1 {
  font-weight: 600;
	font-size: 3em;
	margin: 0;
}

.wrapper {
	line-height: 1.5em;
	margin: 0 auto;
	padding: 2em 0 3em;
	width: 60%;
	max-width: 2000px;
	overflow: hidden;
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
tbody tr:nth-child(2n-1) {
    background-color: #f5f5f5;
    transition: all .125s ease-in-out;
}
tbody tr:hover {
    background-color: rgba(50,98,149,.3);
}

td.rank {
	text-transform: capitalize;
}

p{
  width:90%;
  margin:40px auto;
  text-align:center;
}

</style>

<body>
<%@include file="topList.jsp" %>

  <!-- 포인트 랭킹  -->
 <div class="container">
        <h1>받은 포인트 함</h1>
        <hr>
        <p id="button">
            <input type = 'button' value='Refresh'/>
            <input type = 'button' value='포인트 보내기'/>
            <input type = 'button' value='받은 포인트 확인하기'/>
            <input type = 'button' value='포인트 랭킹'/>
        </p>
        <div class="wrapper">
            <table>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>보낸사람</th>
                        <th>Points</th>
                        <th>날짜</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
            <td class="rank">1</td>
            <td class="team">Spain</td>
            <td class="points">1460</td>
            <td class="up-down">2018.09.13</td>
          </tr>
                  <tr>
            <td class="rank">2</td>
            <td class="team">Germany</td>
            <td class="points">1340</td>
            <td class="up-down">2018.09.13</td>
          </tr>
            <tr>
            <td class="rank">3</td>
            <td class="team">Portugal</td>
            <td class="points">1245</td>
            <td class="up-down">2018.09.13</td>
          </tr>
            <tr>
            <td class="rank">4</td>
            <td class="team">Brazil</td>
            <td class="points">1210</td>
            <td class="up-down">2018.09.13</td>
          </tr>
            <tr>
            <td class="rank">5</td>
            <td class="team">Colombia</td>
            <td class="points">1186</td>
            <td class="up-down">2018.09.13</td>
          </tr>
            <tr>
            <td class="rank">6</td>
            <td class="team">Uruguay</td>
            <td class="points">1181</td>
            <td class="up-down">2018.09.13</td>
          </tr>
            
                </tbody>
            </table>
        </div>
    </div>


</body>
</html>