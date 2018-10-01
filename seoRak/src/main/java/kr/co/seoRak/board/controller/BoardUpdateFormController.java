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
import kr.co.seoRak.repository.mapper.BoardMapper;

@WebServlet("/board/updateForm.do")
public class BoardUpdateFormController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardMapper.class);
		Board board = mapper.selectOneBoard(Integer.parseInt(request.getParameter("no")));
		request.setAttribute("board", board);
		
		RequestDispatcher rd = request.getRequestDispatcher(
				"/jsp/boardUpdateForm.jsp"
				);
		rd.forward(request, response);
	}
}
