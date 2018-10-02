package kr.co.seoRak.repository.domain;

import java.util.Date;

public class RankingRankingInfo {
	private Date bestsellerWeek;
	private int kyoboRank;
	private int yes24Rank;
	private int aladdinRank;
	private int bookparkRank;
	private int bandiRank;
	private int ypbooksRank;
	private int morning24Rank;
	private String bookTitle;
	private String isbn;

	public Date getBestsellerWeek() {
		return bestsellerWeek;
	}
	public void setBestsellerWeek(Date bestsellerWeek) {
		this.bestsellerWeek = bestsellerWeek;
	}
	public int getKyoboRank() {
		return kyoboRank;
	}
	public void setKyoboRank(int kyoboRank) {
		this.kyoboRank = kyoboRank;
	}
	
	public int getYes24Rank() {
		return yes24Rank;
	}
	public void setYes24Rank(int yes24Rank) {
		this.yes24Rank = yes24Rank;
	}
	public int getAladdinRank() {
		return aladdinRank;
	}
	public void setAladdinRank(int aladdinRank) {
		this.aladdinRank = aladdinRank;
	}
	public int getBookparkRank() {
		return bookparkRank;
	}
	public void setBookparkRank(int bookparkRank) {
		this.bookparkRank = bookparkRank;
	}
	public int getBandiRank() {
		return bandiRank;
	}
	public void setBandiRank(int bandiRank) {
		this.bandiRank = bandiRank;
	}
	public int getYpbooksRank() {
		return ypbooksRank;
	}
	public void setYpbooksRank(int ypbooksRank) {
		this.ypbooksRank = ypbooksRank;
	}
	public int getMorning24Rank() {
		return morning24Rank;
	}
	public void setMorning24Rank(int morning24Rank) {
		this.morning24Rank = morning24Rank;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	
}
