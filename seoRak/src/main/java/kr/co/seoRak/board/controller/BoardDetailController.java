package kr.co.seoRak.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.seoRak.common.db.MyAppSqlConfig;
import kr.co.seoRak.repository.domain.Board;
import kr.co.seoRak.repository.domain.Comment;
import kr.co.seoRak.repository.mapper.BoardMapper;
import kr.co.seoRak.repository.mapper.CommentMapper;

@WebServlet("/jsp/boardDetail.do")
public class BoardDetailController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentMapper commentMapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(CommentMapper.class);
		BoardMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardMapper.class);
		int no = Integer.parseInt(request.getParameter("no"));
		Board board = mapper.selectOneBoard(no);
		request.setAttribute("board", board);
		
		List<Comment> commentList = commentMapper.selectComment(no);
		request.setAttribute("commentList", commentList);
		
		try {
				request.setAttribute(
							"commentNo", Integer.parseInt(request.getParameter("commentNo"))
						);
		} catch (NumberFormatException e) { }
				
		
		RequestDispatcher rd = request.getRequestDispatcher(
					"/jsp/boardDetail.jsp"
				);
		rd.forward(request, response);
	}
}
