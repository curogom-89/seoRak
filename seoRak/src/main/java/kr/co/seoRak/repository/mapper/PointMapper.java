package kr.co.seoRak.repository.mapper;

import java.util.List;

import kr.co.seoRak.repository.domain.Member;
import kr.co.seoRak.repository.domain.Point;

public interface PointMapper {
	List<Point> selectPointById(String memberId);
	
	/* [0] 전체 포인트 */
	int selectPointTotalById(String memberId); 
	
	/* [1] 보낸 포인트  */
	int selectSendPointById(String memberId);
	
	/* [2] 받은 포인트 */
	int selectReceivePointById(String memberId);
	
	/* [3] 게시글 포인트 */
	int selectBoardPointById(String memberId);
	
	/* [4] 출석 포인트 */
	int selectAttendPointById(String memberId);
	
	void insertPoint(Point point);
	
	void updateMemberPoint(Member member);
	
	
	
}
