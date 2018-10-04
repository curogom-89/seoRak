package kr.co.seoRak.repository.mapper;

import kr.co.seoRak.repository.domain.Member;

public interface LoginMapper {
	int signInMember (Member member);
	String nickCheck (String nickName);
	Member idCheck (String id);
	Member login (Member member);
	void updateLoginTime(Member member);
}