package kr.co.seoRak.myList.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.seoRak.common.db.MyAppSqlConfig;
import kr.co.seoRak.repository.domain.MyBookList;
import kr.co.seoRak.repository.mapper.MyBookListMapper;

@WebServlet("/jsp/myList/Write.do")
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
		System.out.println(title);
		System.out.println(publisher);
		System.out.println(author);
		System.out.println(img);
		System.out.println(link);
		System.out.println(isbn);
		
		MyBookList mbl = new MyBookList();
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
		response.sendRedirect(request.getContextPath() + "/jsp/myList.jsp");

	}

	
}
