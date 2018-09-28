package kr.co.seoRak.repository.domain;

public class MyBookList {

	String memberId;
	int myBookListNo;
	String myBookListUrl;
	String myBookListImgUrl;
	int isbn;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getMyBookListNo() {
		return myBookListNo;
	}
	public void setMyBookListNo(int myBookListNo) {
		this.myBookListNo = myBookListNo;
	}
	public String getMyBookListUrl() {
		return myBookListUrl;
	}
	public void setMyBookListUrl(String myBookListUrl) {
		this.myBookListUrl = myBookListUrl;
	}
	public String getMyBookListImgUrl() {
		return myBookListImgUrl;
	}
	public void setMyBookListImgUrl(String myBookListImgUrl) {
		this.myBookListImgUrl = myBookListImgUrl;
	}
	public int getIsbn() {
		return isbn;
	}
	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}
	
}
