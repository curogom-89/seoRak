package kr.co.seoRak.repository.mapper;

import java.util.List;

import kr.co.seoRak.repository.domain.Comment;

public interface CommentMapper {
	List<Comment> selectComment(int boardNo);
	int insertComment(Comment comment);
	int updateComment(Comment comment);
	int deleteComment(int commentNo);
	Comment selectOneComment(int commentNo);
}
