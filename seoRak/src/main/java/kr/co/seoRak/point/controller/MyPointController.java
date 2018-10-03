package kr.co.seoRak.point.controller;

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
import kr.co.seoRak.repository.domain.Member;
import kr.co.seoRak.repository.domain.Point;
import kr.co.seoRak.repository.mapper.LoginMapper;
import kr.co.seoRak.repository.mapper.PointMapper;

@WebServlet("/jsp/myPoint.do")
public class MyPointController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("user");
		
		PointMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(PointMapper.class);
		
		List<Point> list = mapper.selectPointById(member.getMemberId());
		
		int totalPoint = mapper.selectPointTotalById(member.getMemberId());
		int sendPoint = Math.abs(mapper.selectSendPointById(member.getMemberId()));
		int receivePoint = mapper.selectReceivePointById(member.getMemberId());
		int boardPoint = mapper.selectBoardPointById(member.getMemberId());
		int attendPoint = mapper.selectAttendPointById(member.getMemberId());

		request.setAttribute("list", list);
		request.setAttribute("totalPoint", totalPoint);
		request.setAttribute("sendPoint", sendPoint);
		request.setAttribute("receivePoint", receivePoint);
		request.setAttribute("boardPoint", boardPoint);
		request.setAttribute("attendPoint", attendPoint);
		
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/myPoint.jsp");
		rd.forward(request, response);
	}

	
	
}
