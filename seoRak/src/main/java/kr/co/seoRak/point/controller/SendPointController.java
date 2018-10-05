package kr.co.seoRak.point.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.seoRak.common.db.MyAppSqlConfig;
import kr.co.seoRak.repository.domain.Member;
import kr.co.seoRak.repository.domain.Point;
import kr.co.seoRak.repository.mapper.LoginMapper;
import kr.co.seoRak.repository.mapper.PointMapper;

@WebServlet("/sendPoint.do")
public class SendPointController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
		
		LoginMapper mapperLogin = MyAppSqlConfig.getSqlSessionInstance().getMapper(LoginMapper.class);
		Member memberSend = mapperLogin.idCheck(sender);
		Member memberReceive = mapperLogin.idCheck(receiver);

		if(memberSend == null || memberReceive== null) {
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/mypoint/sendPoint.jsp");
			request.setAttribute("unmatch", true);
			rd.forward(request, response);
		} else {
			PointMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(PointMapper.class);
			int senderPoint = mapper.selectPointTotalById(sender);
			int receiverPoint = mapper.selectPointTotalById(receiver);
			
			Member memberSender = new Member();
			memberSender.setMemberId(sender);
			memberSender.setMemberTotalPoint(senderPoint);
			
			Member memberReceiver = new Member();
			memberReceiver.setMemberId(receiver);
			memberReceiver.setMemberTotalPoint(receiverPoint);
			
			mapper.insertPoint(pointSend);
			mapper.insertPoint(pointReceive);
			mapper.updateMemberPoint(memberSender);
			mapper.updateMemberPoint(memberReceiver);
			request.setAttribute("check", "success");
			System.out.println("1==============================");
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/mypoint/sendPoint.jsp");
			rd.forward(request, response);
			System.out.println("2==============================");
			
//			PointMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(PointMapper.class);
//			int senderPoint = mapper.selectPointTotalById(sender);
//			int receiverPoint = mapper.selectPointTotalById(receiver);
//			
//			Member memberSender = new Member();
//			memberSender.setMemberId(sender);
//			memberSender.setMemberTotalPoint(senderPoint);
//			
//			Member memberReceiver = new Member();
//			memberReceiver.setMemberId(receiver);
//			memberReceiver.setMemberTotalPoint(receiverPoint);
//			
//			mapper.insertPoint(pointSend);
//			mapper.insertPoint(pointReceive);
//			mapper.updateMemberPoint(memberSender);
//			mapper.updateMemberPoint(memberReceiver);
//			response.sendRedirect("/seoRak/myPoint.do");
		}
	}
	
	

}
