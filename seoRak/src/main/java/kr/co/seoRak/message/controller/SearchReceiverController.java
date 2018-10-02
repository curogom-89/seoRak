package kr.co.seoRak.message.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.seoRak.common.db.MyAppSqlConfig;
import kr.co.seoRak.repository.domain.Message;
import kr.co.seoRak.repository.mapper.MessageMapper;
@WebServlet("/message/receiver.do")
public class SearchReceiverController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");		
		MessageMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(MessageMapper.class);
		
		String nickname = request.getParameter("nickname");
		String Member = mapper.receiverCheck(nickname);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if (Member != null) {
			out.println(1);
		} else {
			out.println(0);
		}
		out.close();
	}

}
