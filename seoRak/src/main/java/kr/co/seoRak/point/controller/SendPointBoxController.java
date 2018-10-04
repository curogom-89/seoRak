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
import kr.co.seoRak.repository.mapper.PointMapper;

@WebServlet("/jsp/sendPointBox.do")
public class SendPointBoxController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("user");
		String memberId = member.getMemberId();*/
		
		String memberId = "dlopo123@gmail.com";
		
		PointMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(PointMapper.class);
		List<Point> list = mapper.selectPointById(memberId);
		request.setAttribute("list", list);
		
		//http://localhost:8000/seoRak/jsp/sendPointBox.jsp
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/sendPointBox.jsp");
		rd.forward(request, response);
	}
	
	

}
