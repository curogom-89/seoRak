package kr.co.seoRak.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.seoRak.common.db.MyAppSqlConfig;
import kr.co.seoRak.repository.domain.Member;
import kr.co.seoRak.repository.mapper.LoginMapper;
import kr.co.seoRak.util.AesUtil;

@WebServlet("/login/login.do")
public class LoginController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("email");
		AesUtil aesUtil = new AesUtil();
		String pass = null;
		try {
			pass = aesUtil.encrypt(request.getParameter("password"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}				
		
		LoginMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(LoginMapper.class);
		Member member = new Member();
		
		member.setMemberId(id);
		member.setMemberPassword(pass);
		
		Member loginMember = mapper.login(member);
		System.out.println(id +", "+ pass);
		
		if (loginMember == null) {
			PrintWriter out = response.getWriter();
			out.println("땡-");
			out.close();
		} else {
			
			HttpSession session = request.getSession();
			session.setAttribute("user", member);
			
			response.sendRedirect(request.getContextPath() + "/main.do");
		}
	}
	
	
	
}
