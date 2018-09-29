package kr.co.seoRak.repository.mapper;



import java.util.List;

import kr.co.seoRak.repository.domain.MyBookList;

public interface MyBookListMapper {
	void insertMyBookList(MyBookList mbl);
	List<MyBookList> selectById(String memberId);
	void deleteMyBookList(MyBookList mbl);
}
