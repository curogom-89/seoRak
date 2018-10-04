package kr.co.seoRak.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.seoRak.common.db.MyAppSqlConfig;
import kr.co.seoRak.repository.domain.Board;
import kr.co.seoRak.repository.domain.BoardBook;
import kr.co.seoRak.repository.domain.Member;
import kr.co.seoRak.repository.mapper.BoardBookMapper;
import kr.co.seoRak.repository.mapper.BoardMapper;

@WebServlet("/boardwriter.do")
public class BoardWriterController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		BoardMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardMapper.class);
		BoardBookMapper bookmapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardBookMapper.class);
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String category = request.getParameter("category");
		String writer = request.getParameter("writer");
		String bookcover = request.getParameter("bookcover");
		String booktitle = request.getParameter("booktitle");
		String bookpublisher = request.getParameter("bookpublisher");
		String bookauthor = request.getParameter("bookauthor");
		 
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("user");
		String memberId = member.getMemberId();
		String memberNickname = member.getMemberNickname();
		
//		HttpSession session = request.getSession();
		
//		// 사용자를 구분하기 위한 세션 아이디
//		String id = session.getId();
		
		Board board = new Board();
		System.out.println("1");
		board.setBoardTitle(title);
		board.setBoardWriter(memberNickname);
		board.setBoardContent(content);
		board.setBoardCategory(category);
		
		
		BoardBook book = new BoardBook();
		System.out.println("2");
		book.setBoardBookTitle(booktitle);
		book.setBoardBookPublisher(bookpublisher);
		book.setBoardBookAuthor(bookauthor);
		book.setBoardBookCover(bookcover);
		System.out.println("5");
		System.out.println(memberNickname);
		System.out.println(booktitle);
		System.out.println(bookpublisher);
		System.out.println(bookauthor);
		System.out.println(bookcover);
		
		mapper.insertBoard(board);
		bookmapper.insertBoardBook(book);
		
		response.sendRedirect(request.getContextPath() + "/boardlist.do");
	}
}
