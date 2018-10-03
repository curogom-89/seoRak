package kr.co.seoRak.point.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.seoRak.common.db.MyAppSqlConfig;
import kr.co.seoRak.repository.domain.Point;
import kr.co.seoRak.repository.mapper.PointMapper;

@WebServlet("/jsp/sendPoint.do")
public class SendPointController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
//		http://localhost:8000/seoRak/jsp/sendPoint.do?sender=dlopo123%40gmail.com&receiver=&currendPoint=0&sendPoint=
		String sender = request.getParameter("sender");
		String receiver = request.getParameter("receiver");
		String currentPoint = request.getParameter("currentPoint");
		String receivePoint = request.getParameter("sendPoint");
		String sendPoint = "-"+receivePoint;

		Point pointSend = new Point();
		pointSend.setMemberId(sender);
		pointSend.setPointExchangeId(receiver);
		pointSend.setPointUpDown(Integer.parseInt(sendPoint));
		pointSend.setPointReason(1);
		
		Point pointReceive = new Point();
		pointReceive.setMemberId(receiver);
		pointReceive.setPointExchangeId(sender);
		pointReceive.setPointUpDown(Integer.parseInt(receivePoint));
		pointReceive.setPointReason(2);

		PointMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(PointMapper.class);
		mapper.insertPoint(pointSend);
		mapper.insertPoint(pointReceive);
		
		response.sendRedirect("/seoRak/jsp/myPoint.do");
		
	}
	
	

}
