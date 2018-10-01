package kr.co.seoRak.repository.mapper;

import kr.co.seoRak.repository.domain.BestSellerList;
import kr.co.seoRak.repository.domain.seorakRankdomain;

public interface RankingMapper {
	void insertRanking(seorakRankdomain domain);
	String selectIsbn(String isbn);
	void updateDate(String isbs);
	void insertTotalBestRankyes24(BestSellerList best);
	String selectIsbnbyTitle(seorakRankdomain domain);
	String selectTitle(String string);
}
