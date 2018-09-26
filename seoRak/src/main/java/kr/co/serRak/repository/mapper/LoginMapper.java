package kr.co.serRak.repository.mapper;

import kr.co.serRak.repository.domain.Member;

public interface LoginMapper {
	int signInMember (Member member);
}