package kr.co.seoRak.myInfo.controller;

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
import kr.co.seoRak.repository.domain.MyBookList;
import kr.co.seoRak.repository.mapper.MyBookListMapper;

@WebServlet("/jsp/myInfo.do")
public class MyInfoController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("user");
		String memberId = member.getMemberId();
		
		MyBookListMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(MyBookListMapper.class);
		List<MyBookList> list = mapper.selectById(memberId);
		request.setAttribute("list", list);
		request.setAttribute("member", member);
		
		// http://localhost:8000/seoRak/jsp/myInfo2.jsp
		System.out.println(request.getContextPath());
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/myInfo.jsp");
		rd.forward(request, response);

	}
	
	

}
