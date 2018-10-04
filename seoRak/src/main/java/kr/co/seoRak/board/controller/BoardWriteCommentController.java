package kr.co.seoRak.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.seoRak.common.db.MyAppSqlConfig;
import kr.co.seoRak.repository.domain.Comment;
import kr.co.seoRak.repository.domain.Member;
import kr.co.seoRak.repository.mapper.CommentMapper;

@WebServlet("/comment-write.do")
public class BoardWriteCommentController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(CommentMapper.class);
		request.setCharacterEncoding("utf-8");
		
		
		int no = Integer.parseInt(request.getParameter("no"));
//		System.out.println(no);
		Comment comment = new Comment();
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("user");
		
		comment.setBoardNo(no);
		comment.setCommentContent(request.getParameter("content"));
		comment.setCommentWriter(request.getParameter("writer"));
//		System.out.println(comment.getCommentContent());
//		System.out.println(comment.getCommentWriter());
		String memberId = member.getMemberId();
		String memberNickname = member.getMemberNickname();
		mapper.insertComment(comment);
		
		response.sendRedirect(request.getContextPath() + "/boardDetail.do?no=" + no);
	}
}
