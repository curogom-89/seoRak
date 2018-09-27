package kr.co.seoRak.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.seoRak.common.db.MyAppSqlConfig;
import kr.co.seoRak.repository.mapper.LoginMapper;

@WebServlet("/login/check.do")
public class OverlapCheckController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		request.setCharacterEncoding("utf-8");
		LoginMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(LoginMapper.class);

		String type = request.getParameter("type");

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if (type.equals("nick")) {
			String nickName = request.getParameter("nickName");
			String result = mapper.nickCheck(nickName);
			if (result == null) {
				// OK				
				out.println(1);
				out.close();
			} else {
				// Error
				out.println(2);
				out.close();

			}
		} else {
			String id = request.getParameter("id");
			String result = mapper.idCheck(id);
			if (result == null) {
				// OK				
				out.println(1);
				out.close();
			} else {
				// Error
				out.println(2);
				out.close();

			}

		}
	}

}
