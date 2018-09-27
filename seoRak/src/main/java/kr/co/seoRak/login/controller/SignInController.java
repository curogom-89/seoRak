package kr.co.seoRak.login.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.seoRak.common.db.MyAppSqlConfig;
import kr.co.seoRak.repository.domain.Member;
import kr.co.seoRak.repository.mapper.LoginMapper;
import kr.co.seoRak.util.AesUtil;

@WebServlet("/login/signUp.do")
public class SignInController extends HttpServlet{

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		request.setCharacterEncoding("utf-8");
		AesUtil aesUtil = new AesUtil();

		if (request.getParameter("id")==null) {
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/login/signUpForm.jsp");

			rd.forward(request, response);
			return;
		} 

		String nickname = request.getParameter("nickName");
		String pass = null;
		try {
			pass = aesUtil.encrypt(request.getParameter("pass"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		String id = request.getParameter("id");
		
		LoginMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(LoginMapper.class);

		Member member = new Member();

		member.setMemberNickname(nickname);
		member.setMemberPassword(pass);
		member.setMemberId(id);
		
		mapper.signInMember(member);

		//메인으로 이동하기
		response.sendRedirect(
				request.getContextPath() + "/main.do");

	}
	
	

}
