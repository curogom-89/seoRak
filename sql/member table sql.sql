
create SEQUENCE s_member_no;

/* seorak_member */
CREATE TABLE seorak_member (
    member_no number not null,
	member_id VARCHAR2(50) NOT NULL, /* id */
	member_password VARCHAR2(50) NOT NULL, /* 비밀번호 */
	member_nickname VARCHAR2(50) NOT NULL, /* 닉네임 */
	member_grade VARCHAR2(50) default 'normal' NOT NULL, /* 회원등급 */
	member_sns VARCHAR2(50) default 'normal' NOT NULL, /* sns회원여부 */
	member_login_date DATE default sysdate NOT NULL, /* 최근 로그인 시간 */
	member_warining NUMBER default 0 , /* 경고 횟수 */
	member_total_point NUMBER default 0 NOT NULL /* 보유점수 */
);

COMMENT ON COLUMN seorak_member.member_no IS '회원번호';

COMMENT ON COLUMN seorak_member.member_id IS 'id';

COMMENT ON COLUMN seorak_member.member_password IS '비밀번호';

COMMENT ON COLUMN seorak_member.member_nickname IS '닉네임';

COMMENT ON COLUMN seorak_member.member_grade IS '회원등급';

COMMENT ON COLUMN seorak_member.member_sns IS 'sns회원여부';

COMMENT ON COLUMN seorak_member.member_login_date IS '최근 로그인 시간';

COMMENT ON COLUMN seorak_member.member_warining IS '경고 횟수';

COMMENT ON COLUMN seorak_member.member_total_point IS '보유점수';

CREATE UNIQUE INDEX PK_seorak_member
	ON seorak_member (
		member_id ASC
	);

ALTER TABLE seorak_member
	ADD
		CONSTRAINT PK_seorak_member
		PRIMARY KEY (
			member_id
		);
        

