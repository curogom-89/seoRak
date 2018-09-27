package kr.co.seoRak.login.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/login/naver.do")
public class NaverLoginController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		URL url = new URL("https://nid.naver.com/oauth2.0/token");
		
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		
		conn.setRequestMethod("POST");
		
		
		conn.setRequestProperty("client_id", "YjI86DNmOfwfD8Ah_H_c");
		conn.setRequestProperty("client_secret", "QuR5SnM_X4");

		conn.setDoOutput(true);
		
		String postParams = "client_id=YjI86DNmOfwfD8Ah_H_c&client_secret=QuR5SnM_X4&grant_type=authorization_code&code="+code+"&state="+state;
        DataOutputStream wr = new DataOutputStream(conn.getOutputStream());
        wr.writeBytes(postParams);
        wr.flush();
        wr.close();		
		
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
        
		Gson gson = new Gson();
				
		NaverLogin nl = gson.fromJson(br, NaverLogin.class);

		
		
		response.sendRedirect("http://localhost:8000/seoRak/main.do");
		
	}

	
	
}

class NaverLogin {
	String access_token;
	String refresh_token;
	String token_type;
	String expries_in;
}