package kr.co.seoRak.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.seoRak.common.db.MyAppSqlConfig;
import kr.co.seoRak.repository.domain.Board;
import kr.co.seoRak.repository.domain.BoardBook;
import kr.co.seoRak.repository.mapper.BoardBookMapper;
import kr.co.seoRak.repository.mapper.BoardMapper;

@WebServlet("/boardupdate.do")
public class BoardUpdateController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("1");
		request.setCharacterEncoding("utf-8");
		
		BoardMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardMapper.class);
		BoardBookMapper bookmapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardBookMapper.class);
		
		Board board = new Board();
//		System.out.println("2");
//		System.out.println("boardNo : " + request.getParameter("boardNo"));
//		System.out.println("boardTitle : " + request.getParameter("title"));
//		System.out.println("boardCategory : " + request.getParameter("category"));
//		System.out.println("boardContent : " + request.getParameter("content"));
//		board.setBoardNo(Integer.parseInt(request.getParameter("boardNo")));
		board.setBoardTitle(request.getParameter("title"));
		board.setBoardCategory(request.getParameter("category"));
		board.setBoardContent(request.getParameter("content"));
//		System.out.println("3");
		
		BoardBook book = new BoardBook();
		System.out.println("2");
		System.out.println("title: " + request.getParameter("title"));
		book.setBoardBookTitle(request.getParameter("title"));
		book.setBoardBookPublisher(request.getParameter("bookpublisher"));
		book.setBoardBookAuthor(request.getParameter("bookauthor"));
		book.setBoardBookCover(request.getParameter("cover"));
		book.setIsbn(request.getParameter("isbn"));
		
		mapper.updateBoard(board);
		bookmapper.insertBoardBook(book);
		response.sendRedirect("/boardlist.do");
		
		
		
	}
}
