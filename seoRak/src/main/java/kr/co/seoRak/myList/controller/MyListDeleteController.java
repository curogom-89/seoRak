package kr.co.seoRak.myList.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jsp/delete.do")
public class MyListDeleteController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("호출 성공");
		
		request.setCharacterEncoding("utf-8");
		String no = request.getParameter("no");
//		String no = (String)request.getAttribute("id");
		String name = (String)request.getAttribute("name");
		System.out.println(no);
		System.out.println(name);
	}

	
	
}
