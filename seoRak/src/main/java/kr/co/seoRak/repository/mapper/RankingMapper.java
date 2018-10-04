package kr.co.seoRak.repository.mapper;

import java.util.Date;

import kr.co.seoRak.repository.domain.RankingBookInfo;
import kr.co.seoRak.repository.domain.RankingPointInfo;
import kr.co.seoRak.repository.domain.RankingRankingInfo;

public interface RankingMapper {
	void insertRanking(RankingBookInfo domain);
	String selectIsbn(String isbn);
	void updateDate(RankingRankingInfo best);	
	String selectIsbnbyTitle(String alaTitle);
	String selectTitle(String string);
	void Yes24insertRaninkingInfo(RankingRankingInfo info);
	RankingRankingInfo rankingInfoIsBnNullCherck(String isbn);
	Date DateCheckwhereRankingInfo(Date date);
	void morning24UpdateRanking(RankingRankingInfo info);
	String titleNullcheck(String alaIsbnTest);
	String titleByIsbn(String isbn);
	Date WeekChecking();
	void kyoboUpdateRanking(RankingRankingInfo info);
	void aladdinupdateRanking(RankingRankingInfo info);
	void bandiRanking(RankingRankingInfo info);	
	void kyoboInsert(RankingRankingInfo info);//1
	void aladdinInsert(RankingRankingInfo info);//2
	void bookparkInsert(RankingRankingInfo info);//3
	void bandiInsert(RankingRankingInfo info);
	String bookidSelectByIsbn(String result2);
	
	//----------------------
	void pointInsert(RankingPointInfo point);
	int aladdinPoint(String isbn);
	int kyoboPoint(String isbn);
	int bandiPoint(String isbn);
	int yes24Point(String isbn);
	
	String IsbnaladdinRank(int i );
	String IsbnkyoboRank(int i);
	String IsbnbandiRank(int i);
	String Isbnyes24Rank(int i);
	
	RankingPointInfo nullcheck(String isbn);
	
	int RankingselectByIsbn(int i);
	String IsbnselectByranking(int i);
	String authorByisbn(String isbn);
	String selectByRankingAuthor(int i);
	String Author(String i);
	String selectTitle1(String i);
	String selecPublisher(String i);
	String selecbookimg(String i);
	String selecpubdate(String i);
}
