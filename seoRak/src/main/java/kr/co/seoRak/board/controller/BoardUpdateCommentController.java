package kr.co.seoRak.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.seoRak.common.db.MyAppSqlConfig;
import kr.co.seoRak.repository.domain.Comment;
import kr.co.seoRak.repository.mapper.CommentMapper;

@WebServlet("/comment-update.do")
public class BoardUpdateCommentController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		CommentMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(CommentMapper.class);
		
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		int no = Integer.parseInt(request.getParameter("no"));
		
		Comment comment = new Comment();
		comment.setCommentContent(request.getParameter("content"));
		comment.setCommentNo(commentNo);
		
		mapper.updateComment(comment);
		
		response.sendRedirect("boardDetail.do?no=" + no);
		
	}
}
