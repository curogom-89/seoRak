package kr.co.serRak.repository.domain;

import java.util.Date;

public class Member {

	private String memberId;

	private Integer memberNo;

	private String memberPassword;

	private String memberNickname;

	private String memberGrade;

	private String memberSns;

	private Date memberLoginDate;

	private Integer memberWarining;

	private Integer memberTotalPoint;

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public Integer getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public String getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}

	public String getMemberSns() {
		return memberSns;
	}

	public void setMemberSns(String memberSns) {
		this.memberSns = memberSns;
	}

	public Date getMemberLoginDate() {
		return memberLoginDate;
	}

	public void setMemberLoginDate(Date memberLoginDate) {
		this.memberLoginDate = memberLoginDate;
	}

	public Integer getMemberWarining() {
		return memberWarining;
	}

	public void setMemberWarining(Integer memberWarining) {
		this.memberWarining = memberWarining;
	}

	public Integer getMemberTotalPoint() {
		return memberTotalPoint;
	}

	public void setMemberTotalPoint(Integer memberTotalPoint) {
		this.memberTotalPoint = memberTotalPoint;
	}

}
