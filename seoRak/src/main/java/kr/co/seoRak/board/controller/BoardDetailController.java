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

import org.omg.PortableServer.RequestProcessingPolicy;

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
		System.out.println(no);
		
		BoardBook book = bookmapper.selectOneBoardBook(no);
		request.setAttribute("book", book);
//		// 좀있다 다시하기
//		HttpSession session = request.getSession();
//		Member member = (Member)session.getAttribute("user");
//		System.out.println("1");
//		String memberId = member.getMemberId();
//		String memberNickname = member.getMemberNickname();
////		String booktitle = request.getParameter("booktitle");
//		String bookpublisher = request.getParameter("bookpublisher");
//		String bookauthor = request.getParameter("bookauthor");
//		String cover = request.getParameter("cover");
//		String isbn = request.getParameter("isbn");
//		String booktitle = request.getParameter("booktitle");
//		
////		BoardBook book = new BoardBook();
//		System.out.println(memberId);
//		System.out.println(booktitle);
//		System.out.println(bookpublisher);
//		System.out.println(bookauthor);
//		System.out.println(cover);
//		System.out.println(isbn);
////		book.setMemberId(memberNickname);
//		book.setBoardBookTitle(booktitle);
//		book.setBoardBookPublisher(bookpublisher);
//		book.setBoardBookAuthor(bookauthor);
//		book.setBoardBookCover(cover);
//		book.setIsbn(isbn);
//		book.setBoardBookTitle(booktitle);
//		(BoardBook) request.getAttribute("boardbook");
//		request.setAttribute("memberId", memberId);
		
//		List<Comment> commentList = commentMapper.selectComment(no);
//		request.setAttribute("commentList", commentList);
		
		
//		String cover = request.getParameter("cover");
//		String booktitle = request.getParameter("booktitle");
//		String bookpublisher = request.getParameter("bookpublisher");
//		String bookauthor = request.getParameter("bookauthor");
//		
//		BoardBook book = new BoardBook();
//		System.out.println("memberIdtest");
//		book.setBoardBookTitle(booktitle);
//		book.setBoardBookPublisher(bookpublisher);
//		book.setBoardBookAuthor(bookauthor);
//		book.setBoardBookCover(cover);
//		book.setMemberId(memberId);
//		System.out.println(cover);
//		System.out.println(booktitle);
//		System.out.println(bookpublisher);
//		System.out.println(bookauthor);
//		System.out.println(memberId);
//		
//		bookmapper.selectOneBoardBook(no);
//		bookmapper.insertBoardBook(book);
		
//		try {
//				request.setAttribute(
//							"commentNo", Integer.parseInt(request.getParameter("commentNo"))
//						);
//		} catch (NumberFormatException e) { }
//				
		
		RequestDispatcher rd = request.getRequestDispatcher(
					"/jsp/board/boardDetail.jsp"
				);
		System.out.println(book);
		rd.forward(request, response);
	}
}
