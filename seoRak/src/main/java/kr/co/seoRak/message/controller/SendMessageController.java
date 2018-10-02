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

@WebServlet("/message/send.do")
public class SendMessageController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");		
		MessageMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(MessageMapper.class);
		
		Message message = new Message();
		message.setRecvId(request.getParameter("receiver"));
		message.setSendId(request.getParameter("sender"));
		message.setMessageTitle(request.getParameter("title"));
		message.setMessageContent(request.getParameter("content"));
		
		mapper.sendMessage(message);
		
		response.sendRedirect("/seoRak/jsp/receivebox.jsp");
		
	}	

	
	
}
