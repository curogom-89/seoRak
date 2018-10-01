package kr.co.seoRak.Mapper;

import co.kr.seorak.Domain.BestSellerList;
import co.kr.seorak.Domain.seorakRankdomain;

public interface RankingMapper {
	void insertRanking(seorakRankdomain domain);
	String selectIsbn(String isbn);
	void updateDate(String isbs);
	void insertTotalBestRankyes24(BestSellerList best);
	String selectIsbnbyTitle(seorakRankdomain domain);
	String selectTitle(String string);
}
