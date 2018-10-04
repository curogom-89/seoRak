package kr.co.seoRak.myList.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.seoRak.common.db.MyAppSqlConfig;
import kr.co.seoRak.repository.domain.Member;
import kr.co.seoRak.repository.domain.MyBookList;
import kr.co.seoRak.repository.mapper.MyBookListMapper;

@WebServlet("/jsp/delete.do")
public class MyListDeleteController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("호출 성공");
		request.setCharacterEncoding("utf-8");
		int no = Integer.parseInt(request.getParameter("no"));
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("user");
		String id = loginMember.getMemberId();
		
		System.out.println(no);
		System.out.println(id);
		
		MyBookList mbl = new MyBookList();
		mbl.setMemberId(id);
		mbl.setMyBookListNo(no);
		
		MyBookListMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(MyBookListMapper.class);
		mapper.deleteMyBookList(mbl);
		
		response.sendRedirect("/seoRak/list.do");
	}

	
	
}
