package kr.co.seoRak.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.seoRak.util.MailChecker;

@WebServlet("/login/mail.do")
public class MailCheckController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
	
		String address = request.getParameter("mail");
		MailChecker mailChecker = new MailChecker();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 4; i++) {
			int num = (int) ((Math.random()*10));
			sb.append(num);
		}
		
		String key = sb.toString();
		System.out.println(key + ", " + address);
		
		mailChecker.mailSend(address, key);
		
		PrintWriter out = response.getWriter();
		
		out.println(key);
		
		out.close();
	}
	
}
