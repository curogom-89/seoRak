package kr.co.seoRak.repository.domain;

import java.util.Date;

public class Point {
	String memberId;
	int pointNo;
	int pointUpDown;
	Date regDate;
	int pointReason;
	String pointExchangeId;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getPointNo() {
		return pointNo;
	}
	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
	}
	public int getPointUpDown() {
		return pointUpDown;
	}
	public void setPointUpDown(int pointUpDown) {
		this.pointUpDown = pointUpDown;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getPointReason() {
		return pointReason;
	}
	public void setPointReason(int pointReason) {
		this.pointReason = pointReason;
	}
	public String getPointExchangeId() {
		return pointExchangeId;
	}
	public void setPointExchangeId(String pointExchangeId) {
		this.pointExchangeId = pointExchangeId;
	}

	
}
