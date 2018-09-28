package kr.co.seoRak.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.seoRak.common.db.MyAppSqlConfig;
import kr.co.seoRak.repository.domain.Board;
import kr.co.seoRak.repository.mapper.BoardMapper;

@WebServlet ("/board/writer.do")
public class BoardWriterController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		BoardMapper boardMapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardMapper.class);
		
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		String category = request.getParameter("category");
		
		Board board = new Board();
		
		System.out.printf("%s, %s, %s, %s", title, writer, content, category);
				
		board.setBoardTitle(title);
		board.setBoardWriter(writer);
		board.setBoardContent(content);
		board.setBoardCategory(category);
		
		boardMapper.insertBoard(board);
		
		response.sendRedirect(request.getContextPath() + "/board/list.do");
	}
	
}
