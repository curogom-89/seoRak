package kr.co.seoRak.repository.mapper;

import java.util.Date;

import kr.co.seoRak.repository.domain.RankingBookInfo;
import kr.co.seoRak.repository.domain.RankingRankingInfo;

public interface RankingMapper {
	void insertRanking(RankingBookInfo domain);
	String selectIsbn(String isbn);
	void updateDate(RankingRankingInfo best);
	void insertTotalBestRankyes24(RankingRankingInfo best);
	String selectIsbnbyTitle(String alaTitle);
	String selectTitle(String string);
	void updateBookRankingkyobo(RankingRankingInfo rankingInfo);
	Date checkWeekDate(Date dateWeek);
	String seorakRankingtitlecheck(String title);
	void updateBookRankingaladdin(RankingRankingInfo rankingInfo);
	void updateBookRankingbandi(RankingRankingInfo best);
	void updateBookRankingbookpark(RankingRankingInfo best);
	void updateBookRankingypbooksRank(RankingRankingInfo best);
	void updateBookRankingmorning24Rank(RankingRankingInfo best);
	void insertKyoboRanking(RankingRankingInfo best);
	void insertAladdinRanking(RankingRankingInfo best);
	void insertBookparkRanking(RankingRankingInfo best);
	void insertBandikRanking(RankingRankingInfo best);
	void insertYPRanking(RankingRankingInfo best);
	String RankingTitleCheck(String title);
}
