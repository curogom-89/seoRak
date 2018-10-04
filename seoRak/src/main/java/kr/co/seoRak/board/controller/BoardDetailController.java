package kr.co.seoRak.board.controller;

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
import kr.co.seoRak.repository.domain.Board;
import kr.co.seoRak.repository.domain.BoardBook;
import kr.co.seoRak.repository.domain.Comment;
import kr.co.seoRak.repository.domain.Member;
import kr.co.seoRak.repository.mapper.BoardBookMapper;
import kr.co.seoRak.repository.mapper.BoardMapper;
import kr.co.seoRak.repository.mapper.CommentMapper;

@WebServlet("/boardDetail.do")
public class BoardDetailController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentMapper commentMapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(CommentMapper.class);
		BoardBookMapper bookmapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardBookMapper.class);
		BoardMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardMapper.class);
		int no = Integer.parseInt(request.getParameter("no"));
		Board board = mapper.selectOneBoard(no);
		request.setAttribute("board", board);
		
		List<Comment> commentList = commentMapper.selectComment(no);
		request.setAttribute("commentList", commentList);
		
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("user");
		System.out.println("1");
		String memberId = member.getMemberId();
		String bookcover = request.getParameter("bookcover");
		String booktitle = request.getParameter("booktitle");
		String bookpublisher = request.getParameter("bookpublisher");
		String bookauthor = request.getParameter("bookauthor");
		
		BoardBook book = new BoardBook();
//		System.out.println("memberIdtest");
//		book.setBoardBookTitle(booktitle);
//		book.setBoardBookPublisher(bookpublisher);
//		book.setBoardBookAuthor(bookauthor);
//		book.setBoardBookCover(bookcover);
//		book.setMemberId(memberId);
//		System.out.println(bookcover);
//		System.out.println(booktitle);
//		System.out.println(bookpublisher);
//		System.out.println(bookauthor);
//		System.out.println(memberId);
//		
//		bookmapper.insertBoardBook(book);
		
		try {
				request.setAttribute(
							"commentNo", Integer.parseInt(request.getParameter("commentNo"))
						);
		} catch (NumberFormatException e) { }
				
		
		RequestDispatcher rd = request.getRequestDispatcher(
					"/jsp/board/boardDetail.jsp"
				);
		rd.forward(request, response);
	}
}
