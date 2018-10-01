package kr.co.seoRak.repository.domain;

import java.util.Date;

public class Search {
 private int searchNo;
 private String searchId;
 private String keyword;
 private Date searchTime;
 
public int getSearchNo() {
	return searchNo;
}
public void setSearchNo(int searchNo) {
	this.searchNo = searchNo;
}
public String getSearchId() {
	return searchId;
}
public void setSearchId(String searchId) {
	this.searchId = searchId;
}
public String getKeyword() {
	return keyword;
}
public void setKeyword(String keyword) {
	this.keyword = keyword;
}
public Date getSearchTime() {
	return searchTime;
}
public void setSearchTime(Date searchTime) {
	this.searchTime = searchTime;
}
	
}
