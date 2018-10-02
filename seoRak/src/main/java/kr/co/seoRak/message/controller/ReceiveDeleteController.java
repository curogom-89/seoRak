package kr.co.seoRak.message.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.seoRak.common.db.MyAppSqlConfig;
import kr.co.seoRak.repository.mapper.MessageMapper;

@WebServlet("/message/receiveDelete.do")
public class ReceiveDeleteController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MessageMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(MessageMapper.class);
		String[] del = request.getParameterValues("delCheck");
		
		for (String delNo : del) {
			int no = Integer.parseInt(delNo);
			mapper.receiveMoveTrash(no);
		}
		
	}

}
