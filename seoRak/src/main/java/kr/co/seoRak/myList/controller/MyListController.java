package kr.co.seoRak.myList.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
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

@WebServlet("/list.do")
public class MyListController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("user");
		System.out.println(loginMember.getMemberId());
		
		MyBookListMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(MyBookListMapper.class);
//		List<MyBookList> list = mapper.selectById("seorakbooks@gmail.com");
		System.out.println("1----------------");
		List<MyBookList> list = mapper.selectById(loginMember.getMemberId());
		System.out.println("2----------------");
		request.setAttribute("list", list);
//		http://localhost:8000/seoRak/jsp/myList.jsp
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/mylist/myList.jsp");
		System.out.println("3----------------");
		rd.forward(request, response);
	}
	
	

}
