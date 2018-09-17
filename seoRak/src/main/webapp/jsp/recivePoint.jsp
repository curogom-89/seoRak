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

 <div class="container">
        <h1>SeoRak Point Ranking Top 20</h1>
        <hr>
        <div class="wrapper">
            <table>
                <thead>
                    <tr>
                        <th>Rank</th>
                        <th>Idiation</th>
                        <th>Points</th>
                        <th>+/-</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
            <td class="rank">1</td>
            <td class="team">Spain</td>
            <td class="points">1460</td>
            <td class="up-down">0</td>
          </tr>
                  <tr>
            <td class="rank">2</td>
            <td class="team">Germany</td>
            <td class="points">1340</td>
            <td class="up-down">0</td>
          </tr>
            <tr>
            <td class="rank">3</td>
            <td class="team">Portugal</td>
            <td class="points">1245</td>
            <td class="up-down">0</td>
          </tr>
            <tr>
            <td class="rank">4</td>
            <td class="team">Brazil</td>
            <td class="points">1210</td>
            <td class="up-down">+2</td>
          </tr>
            <tr>
            <td class="rank">5</td>
            <td class="team">Colombia</td>
            <td class="points">1186</td>
            <td class="up-down">-1</td>
          </tr>
            <tr>
            <td class="rank">6</td>
            <td class="team">Uruguay</td>
            <td class="points">1181</td>
            <td class="up-down">-1</td>
          </tr>
            <tr>
            <td class="rank">7</td>
            <td class="team">Argentina</td>
            <td class="points">1178</td>
            <td class="up-down">-1</td>
          </tr>
            <tr>
            <td class="rank">8</td>
            <td class="team">Switzerland</td>
            <td class="points">1161</td>
            <td class="up-down">0</td>
          </tr>
            <tr>
            <td class="rank">9</td>
            <td class="team">Italy</td>
            <td class="points">1115</td>
            <td class="up-down">0</td>
          </tr>
                    <tr>
            <td class="rank">10</td>
            <td class="team">Greece</td>
            <td class="points">1082</td>
            <td class="up-down">0</td>
          </tr>
                  <tr>
            <td class="rank">11</td>
            <td class="team">England</td>
            <td class="points">1043</td>
            <td class="up-down">0</td>
          </tr>
            <tr>
            <td class="rank">12</td>
            <td class="team">Belgium</td>
            <td class="points">1039</td>
            <td class="up-down">0</td>
          </tr>
            <tr>
            <td class="rank">13</td>
            <td class="team">Chile</td>
            <td class="points">1037</td>
            <td class="up-down">+1</td>
          </tr>
            <tr>
            <td class="rank">14</td>
            <td class="team">USA</td>
            <td class="points">1015</td>
            <td class="up-down">-1</td>
          </tr>
            <tr>
            <td class="rank">15</td>
            <td class="team">Netherlands</td>
            <td class="points">967</td>
            <td class="up-down">0</td>
          </tr>
            <tr>
            <td class="rank">16</td>
            <td class="team">France</td>
            <td class="points">935</td>
            <td class="up-down">0</td>
          </tr>
            <tr>
            <td class="rank">17</td>
            <td class="team">Ukraine</td>
            <td class="points">913</td>
            <td class="up-down">0</td>
          </tr>
            <tr>
            <td class="rank">18</td>
            <td class="team">Russia</td>
            <td class="points">903</td>
            <td class="up-down">0</td>
          </tr>
            <tr>
            <td class="rank">19</td>
            <td class="team">Mexico</td>
            <td class="points">877</td>
            <td class="up-down">0</td>
          </tr>
            <tr>
            <td class="rank">20</td>
            <td class="team">Croatia</td>
            <td class="points">871</td>
            <td class="up-down">0</td>
          </tr>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>