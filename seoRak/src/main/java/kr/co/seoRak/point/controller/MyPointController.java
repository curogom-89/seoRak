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

@WebServlet("/jsp/myPoint.do")
public class MyPointController extends HttpServlet {
	
	int totalPoint;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("user");
		
		PointMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(PointMapper.class);
		List<Point> list = mapper.selectPointById(member.getMemberId());
		totalPoint=0;
		for(Point p : list) {
			System.out.println(p.getPointUpDown());
			totalPoint = totalPoint + p.getPointUpDown();
			System.out.println(totalPoint);
		}
		System.out.println(totalPoint);
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/myPoint.jsp");
		rd.forward(request, response);
	}

	
	
}
