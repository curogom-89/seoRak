package kr.co.seoRak.repository.domain;

public class BoardBook {
	int boardNo;
	String memberId;
	String boardBookTitle;
	String boardBookPublisher;
	String boardBookAuthor;
	String boardBookCover;
	String isbn;
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getBoardBookTitle() {
		return boardBookTitle;
	}
	public void setBoardBookTitle(String boardBookTitle) {
		this.boardBookTitle = boardBookTitle;
	}
	public String getBoardBookPublisher() {
		return boardBookPublisher;
	}
	public void setBoardBookPublisher(String boardBookPublisher) {
		this.boardBookPublisher = boardBookPublisher;
	}
	public String getBoardBookAuthor() {
		return boardBookAuthor;
	}
	public void setBoardBookAuthor(String boardBookAuthor) {
		this.boardBookAuthor = boardBookAuthor;
	}
	public String getBoardBookCover() {
		return boardBookCover;
	}
	public void setBoardBookCover(String boardBookCover) {
		this.boardBookCover = boardBookCover;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	
	
}
