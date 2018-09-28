package kr.co.seoRak.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login/logout.do")
public final class LogoutController extends HttpServlet{

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		session.invalidate(); // 세션을 삭제
		
		//메인으로 이동하기
		response.sendRedirect(
				request.getContextPath() + "/main.do");
		
	}
}
