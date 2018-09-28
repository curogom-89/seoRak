package kr.co.seoRak.myList.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.seoRak.repository.domain.Book;
import kr.co.seoRak.repository.domain.Items;

@WebServlet("/myList/Search.do")
public class MyListSearchController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int detail = Integer.parseInt(request.getParameter("detail"));
		String title = request.getParameter("content");
		List<Book> list = searchBook(title);
//		for ( Book b : list ) {
//			System.out.println("작가 : " + b.getAuthor());
//			System.out.println("이미지 주소 : " + b.getImage());
//			System.out.println("isbn : " + b.getIsbn());
//			System.out.println("제목 : " + b.getTitle());
//			System.out.println("출판사" + b.getPublisher());
//		}
		request.setAttribute("list", list);
		// http://localhost:8000/seoRak/jsp/myListBookSearch.jsp
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/myListBookSearch.jsp");
		rd.forward(request, response);
	}
	
	public List<Book> searchBook(String title) {
		// json 데이터 응답받기
			String apiUrl = "https://openapi.naver.com/v1/search/book.json";

		try{
			String parameter = "?query=" + URLEncoder.encode(title, "utf-8");
			URL url = new URL(apiUrl + parameter);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			// GET 방식 설정
			conn.setRequestMethod("GET");
			
			// 헤더 설정
			conn.setRequestProperty("X-Naver-Client-Id", "nBhvc2fD6FG8BBXPfRKr");
			conn.setRequestProperty("X-Naver-Client-Secret", "OmULdGt4Ho");
			
			// 응답 코드 : 200(성공), 404(파일을 못 찾았을 때), 500(서버처리 에러)
			int code = conn.getResponseCode();
			System.out.println("응답 코드 : " + code);
			
			// 응답 데이터 추출하기
			BufferedReader br = new BufferedReader(
					new InputStreamReader(conn.getInputStream(), "utf-8")
			);
			
			Gson gson = new Gson();
			Items items = gson.fromJson(br, Items.class);
			
			List<Book> list = items.getItems();
			
			return list;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	

}
