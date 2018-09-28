package kr.co.seoRak.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
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
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		AesUtil aesUtil = new AesUtil();
		
		String id = request.getParameter("email");
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
		
		if (loginMember != null) {
		
			HttpSession session = request.getSession();
			session.setAttribute("user", loginMember);
			
			response.sendRedirect("/seoRak/main.do");
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/loginForm.jsp");
			request.setAttribute("unmatch", true);
			rd.forward(request, response);
		}

	}
	
	
	
}
