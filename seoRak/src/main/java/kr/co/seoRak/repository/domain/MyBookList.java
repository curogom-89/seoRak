package kr.co.seoRak.repository.domain;

import java.util.Date;

public class MyBookList {

	String memberId;
	int myBookListNo;
	String myBookListUrl;
	String myBookListImgUrl;
	String isbn;
	
	String myBookListTitle;
	String myBookListPublisher;
	String myBookListAuthor;
	
	Date regDate;
	
	
	
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
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
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getMyBookListTitle() {
		return myBookListTitle;
	}
	public void setMyBookListTitle(String myBookListTitle) {
		this.myBookListTitle = myBookListTitle;
	}
	public String getMyBookListPublisher() {
		return myBookListPublisher;
	}
	public void setMyBookListPublisher(String myBookListPublisher) {
		this.myBookListPublisher = myBookListPublisher;
	}
	public String getMyBookListAuthor() {
		return myBookListAuthor;
	}
	public void setMyBookListAuthor(String myBookListAuthor) {
		this.myBookListAuthor = myBookListAuthor;
	}
	
	
}
