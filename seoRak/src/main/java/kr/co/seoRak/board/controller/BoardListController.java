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
import kr.co.seoRak.repository.domain.Member;
import kr.co.seoRak.repository.mapper.BoardMapper;

@WebServlet("/boardlist.do")
public class BoardListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardMapper.class);
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("user");
		
		List<Board> list = mapper.selectAllBoard();
		
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher(
					"/jsp/freeBoard.jsp"
				);
		rd.forward(request, response);
	}
}
