package kr.co.seoRak.repository.domain;

import java.util.Calendar;
import java.util.Date;

public class seorakRankdomain {
	private String isbn;//1
	private String bookTitle;//2
	private String bookAuthor;//3
	private String bookPublisher;//4
	private String bookImg;//5	
	private Date bookPubDate;
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public String getBookAuthor() {
		return bookAuthor;
	}
	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}
	public String getBookPublisher() {
		return bookPublisher;
	}
	public void setBookPublisher(String bookPublisher) {
		this.bookPublisher = bookPublisher;
	}
	public String getBookImg() {
		return bookImg;
	}
	public void setBookImg(String bookImg) {
		this.bookImg = bookImg;
	}
	public Date getBookPubDate() {
		return bookPubDate;
	}
	public void setBookPubDate(Date bookPubDate) {
		this.bookPubDate = bookPubDate;
	}

}


//create table sarakRanking(
//	    isbn NUMBER PRIMARY KEY,
//	    book_title VARCHAR2(255) not null,
//	    book_author VARCHAR2(255) not null,
//	    book_publisher VARCHAR2(255) not null,
//	    book_img VARCHAR2(255) not null,

//	    book_point NUMBER not null,
//	    bestseller_week DATE not null,
//	    kyobo_rank NUMBER not null,
//	    yes24_rank NUMBER not null,
//	    aladdin_rank NUMBER not null,
//	    bookpark_rank NUMBER not null,
//	    bandi_bandi NUMBER not null,
//	    ypbooks_rank NUMBER not null,
//	    morning365_rank NUMBER not null
//	);