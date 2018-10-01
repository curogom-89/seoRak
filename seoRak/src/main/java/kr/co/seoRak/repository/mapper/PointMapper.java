package kr.co.seoRak.repository.mapper;

import java.util.List;

import kr.co.seoRak.repository.domain.Point;

public interface PointMapper {
	List<Point> selectPointById(String memberId);
}
