package kr.co.seoRak.controller;

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

@WebServlet("/board/detail.do")
public class BoardDetailController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardMapper.class);
		int no = Integer.parseInt(request.getParameter("no"));
		Board board = mapper.selectOneBoard(no);
		request.setAttribute("board", board);
		
		RequestDispatcher rd = request.getRequestDispatcher(
					"/jsp/boardDetail.jsp"
				);
		rd.forward(request, response);
	}
}
