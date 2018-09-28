<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.co.seoRak.repository.domain.Member"%>
<%@page import="kr.co.seoRak.common.db.MyAppSqlConfig"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.seoRak.repository.mapper.AdminMapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지</title>
<style>
    * {
      color: rgb(80, 80, 80)
    }
    body {
      background: rgb(195, 210, 180);
    }
    table, th, td {
      border-collapse: collapse;
      border: 2px solid white;
    }
    table {
      width: 80%;
      text-align: center;
      border: 3px rgb(180, 180, 235) solid;
    }
    th {
      background: rgb(170, 200, 150);
      height: 40px;
      color: rgb(80, 80, 80)
    }
    td {
      height: 30px;
      color: rgb(80, 80, 80)
    }

    tr:nth-child(2n-1) {
      background: rgb(190, 190, 235);
    }
    tr:nth-child(2n) {
      background: rgb(200, 200, 255); 
    }

    tr:hover {
      background: rgb(130, 130, 200); 
      color: rgb(220, 220, 220)
    }

  </style>
<% 
	AdminMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(AdminMapper.class); 
	List<Member> list = mapper.memberAll();
%>
</head>
<body>
	<%@include file="topList.jsp"   %>
  <h1>관리자 페이지</h1>
  <hr>
  <dir>
    <h2>신고내역</h2>
    <table style="margin-left: auto; margin-right: auto; text-align: center">
      <thead>
        <tr>
          <th>
            번호
          </th>
          <th>
            신고자
          </th>
          <th>
            대상자
          </th>
          <th>
            사유
          </th>
          <th>
            신고대상자 누적 경고 수
          </th>
          <th>
            경고부여
          </th>
          <th>
            신고삭제
          </th>
        </tr>
        <td>
          1
        </td>
        <td>
          신고자1  
        </td>
        <td>
          나쁜놈1
        </td>
        <td>
          스팸 게시물 (게시판 : 10)
        </td>
        <td>
          2
        </td>
        <td>
          <button>경고부여</button>
        </td>
        <td>
          <button>신고삭제</button>
        </td>
      </thead>
    </table>
  </dir>
  <hr>
  <dir>
    <h2>회원 목록</h2>
    <div>
    <table style="margin-left: auto; margin-right: auto; margin-bottom: 20px">
        <thead>
          <tr>
            <th>번호</th><th>ID</th><th>닉네임</th><th>등급</th><th>포인트</th><th>누적 경고</th><th>최근 로그인 시간</th>
          </tr>
        </thead>
        <tbody>
        <%for (Member m : list) {%>
		<tr>
			<td><%=m.getMemberNo()%></td>
			<td><%=m.getMemberId()%></td>
			<td><%=m.getMemberNickname()%></td>
			<td><%=m.getMemberGrade()%></td>
			<td><%=m.getMemberTotalPoint()%></td>
			<td><%=m.getMemberWarining()%></td>
			<%
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String loginDate = sdf.format(m.getMemberLoginDate());	
			%>
			<td><%=loginDate%></td>
		</tr>
		<%} %>
        	
        </tbody>
      </table>
      <from style="text-align: center">
        <div>
          <select name="type" id="type">
            <option>선택</option>
            <option value="name">이름</option>
            <option value="id"">ID</option>
            <option value="grade">등급</option>
            <option value="point">포인트</option>
            <option value="joinDate">가입일</option>
          </select>
          <input type="text" id="search" />
          <button>검색</button>
        </div>
      </from>
    </div>
  </dir>

</body>
</html>