package kr.co.seoRak.myList.controller;

import java.io.IOException;
import java.util.Date;

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

@WebServlet("/Write.do")
public class MyListWriteController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("호출 성공");
		
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String publisher = request.getParameter("publisher");
		String author = request.getParameter("author");
		String img = request.getParameter("img");
		String link = request.getParameter("link");
		String isbn = request.getParameter("isbn");
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("user");
		String memberId = member.getMemberId();
		System.out.println(memberId);
		System.out.println(publisher);
		System.out.println(author);
		System.out.println(img);
		System.out.println(link);
		System.out.println(isbn);
		
		MyBookList mbl = new MyBookList();
		mbl.setMemberId(memberId);
		mbl.setIsbn(isbn);
		mbl.setMyBookListImgUrl(img);
		mbl.setMyBookListUrl(link);
		mbl.setMyBookListPublisher(publisher);
		mbl.setMyBookListTitle(title);
		mbl.setMyBookListAuthor(author);
		Date date = new Date();
		mbl.setRegDate(date);
		
		MyBookListMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(MyBookListMapper.class);
		System.out.println("------------1");
		mapper.insertMyBookList(mbl);
		System.out.println(request.getContextPath());
		response.sendRedirect(request.getContextPath() + "/list.do");
		//http://localhost:8000/seoRak/jsp/myList.do
//		http://localhost:8000/seoRak/jsp/list.do

	}

	
}
