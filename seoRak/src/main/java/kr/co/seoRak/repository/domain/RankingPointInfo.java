package kr.co.seoRak.repository.domain;

import java.util.Date;

public class RankingPointInfo {
	private String id;
	private String isbn;
	private int starpoint;
	private int notice ;
	private int totalpoint;
	private Date rankingWeek;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getRankingWeek() {
		return rankingWeek;
	}
	public void setRankingWeek(Date rankingWeek) {
		this.rankingWeek = rankingWeek;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public int getStarpoint() {
		return starpoint;
	}
	public void setStarpoint(int starpoint) {
		this.starpoint = starpoint;
	}
	public int getNotice() {
		return notice;
	}
	public void setNotice(int notice) {
		this.notice = notice;
	}
	public int getTotalpoint() {
		return totalpoint;
	}
	public void setTotalpoint(int totalpoint) {
		this.totalpoint = totalpoint;
	}
	
}
