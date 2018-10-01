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
		System.out.println("1-----------------------");
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("user");
		System.out.println("2-----------------------");
		PointMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(PointMapper.class);
		List<Point> list = mapper.selectPointById(member.getMemberId());
		System.out.println(member.getMemberId());
		System.out.println("3-----------------------");
		totalPoint = 0;
		for(Point p : list) {
			totalPoint += p.getPointUpDown();		
		}
		System.out.println(totalPoint);
		System.out.println("4-----------------------");
		request.setAttribute("list", list);
		request.setAttribute("totalPoint", totalPoint);
		
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/myPoint.jsp");
		rd.forward(request, response);
	}

	
	
}
