package kr.co.seoRak.point.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.seoRak.common.db.MyAppSqlConfig;
import kr.co.seoRak.repository.domain.Member;
import kr.co.seoRak.repository.mapper.PointMapper;

@WebServlet("/sendPointForm.do")
public class SendPointFormController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sessionMember = request.getSession();
		Member member = (Member)sessionMember.getAttribute("user");

		PointMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(PointMapper.class);
		int memberTotalPoint = mapper.selectPointTotalById(member.getMemberId());
		member.setMemberTotalPoint(memberTotalPoint);
		
		request.setAttribute("check", "before");	
		request.setAttribute("member", member);
		
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/mypoint/sendPoint.jsp");
		rd.forward(request, response);
	}
	
	

}
