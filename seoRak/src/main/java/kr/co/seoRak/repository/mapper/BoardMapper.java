package kr.co.seoRak.repository.mapper;

import java.util.List;

import kr.co.seoRak.repository.domain.Board;

public interface BoardMapper {

	List<Board> selectAllBoard ();
	Board selectOneBoard (int no);
	void insertBoard (Board board);
	void deleteBoard (int no);
	void updateBoard (Board board);
	
}
