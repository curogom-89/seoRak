package kr.co.seoRak.myList.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jsp/myList/Write.do")
public class MyListWriteController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//http://localhost:8000/seoRak/jsp/myList/Write.do?title=&book=&publisher=&author=&btn2=
//		String memberId = request.getParameter("memberId");
//		String myBookListUrl = request.getParameter("");
//		String myBookListImgUrl = request.getParameter("");
//		int isbn = Integer.parseInt(request.getParameter("isbn"));
		
		System.out.println(request.getContextPath());
		
	}

	
}
