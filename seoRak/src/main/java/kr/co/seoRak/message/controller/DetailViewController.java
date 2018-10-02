package kr.co.seoRak.message.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.naming.ldap.Rdn;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.seoRak.common.db.MyAppSqlConfig;
import kr.co.seoRak.repository.domain.Message;
import kr.co.seoRak.repository.mapper.MessageMapper;

@WebServlet("/message/read.do")
public class DetailViewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		MessageMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(MessageMapper.class);
		
		mapper.readMessageDate(no);
		Message message = mapper.readMessage(no);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sendtime = sdf.format(message.getSendDate());
		String readtime = sdf.format(message.getReadDate());
		
		request.setAttribute("sender", message.getSendId());
		request.setAttribute("sendtime", sendtime);
		request.setAttribute("readtime", readtime);
		request.setAttribute("title", message.getMessageTitle());
		request.setAttribute("content", message.getMessageContent());
		
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/messageDetail.jsp");
		
		rd.forward(request, response);
		
	}
	
	
	
}
