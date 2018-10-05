--------------------------------------------------------
--  파일이 생성됨 - 금요일-10월-05-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence S_BOARDBOOK_NO
--------------------------------------------------------

   CREATE SEQUENCE  "S_BOARDBOOK_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence S_MEMBER_NO
--------------------------------------------------------

   CREATE SEQUENCE  "S_MEMBER_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence S_MESSAGE_NO
--------------------------------------------------------

   CREATE SEQUENCE  "S_MESSAGE_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence S_MYLIST_NO
--------------------------------------------------------

   CREATE SEQUENCE  "S_MYLIST_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence S_POINT_NO
--------------------------------------------------------

   CREATE SEQUENCE  "S_POINT_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 181 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence S_SEORAK_BOARD_NO
--------------------------------------------------------

   CREATE SEQUENCE  "S_SEORAK_BOARD_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 121 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence S_SEORAK_COMMENT_NO
--------------------------------------------------------

   CREATE SEQUENCE  "S_SEORAK_COMMENT_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence S_SEORAK_SEARCH_NO
--------------------------------------------------------

   CREATE SEQUENCE  "S_SEORAK_SEARCH_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Table SEORAK_BOARD
--------------------------------------------------------

  CREATE TABLE "SEORAK_BOARD" 
   (	"BOARD_NO" NUMBER, 
	"BOARD_WRITER" VARCHAR2(50), 
	"BOARD_CATEGORY" VARCHAR2(255), 
	"BOARD_CONTENT" VARCHAR2(255), 
	"BOARD_TITLE" VARCHAR2(255), 
	"BOARD_RECOMM" NUMBER DEFAULT (0), 
	"BOARD_VIEW" NUMBER DEFAULT (0), 
	"BOARD_DATE" DATE DEFAULT sysdate
   )
--------------------------------------------------------
--  DDL for Table SEORAK_BOARDBOOK
--------------------------------------------------------

  CREATE TABLE "SEORAK_BOARDBOOK" 
   (	"BOARD_NO" NUMBER, 
	"MEMBER_ID" VARCHAR2(50), 
	"BOARD_BOOK_TITLE" VARCHAR2(255), 
	"BOARD_BOOK_PUBLISHER" VARCHAR2(255), 
	"BOARD_BOOK_AUTHOR" VARCHAR2(255), 
	"BOARD_BOOK_COVER" VARCHAR2(255), 
	"ISBN" VARCHAR2(255), 
	"BOOK_TITLE" VARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table SEORAK_COMMENT
--------------------------------------------------------

  CREATE TABLE "SEORAK_COMMENT" 
   (	"COMMENT_NO" NUMBER, 
	"BOARD_NO" NUMBER, 
	"COMMENT_WRITER" VARCHAR2(50), 
	"COMMENT_CONTENT" VARCHAR2(255), 
	"COMMENT_DATE" DATE DEFAULT sysdate
   )
--------------------------------------------------------
--  DDL for Table SEORAK_MEMBER
--------------------------------------------------------

  CREATE TABLE "SEORAK_MEMBER" 
   (	"MEMBER_NO" NUMBER, 
	"MEMBER_ID" VARCHAR2(50), 
	"MEMBER_PASSWORD" VARCHAR2(50), 
	"MEMBER_NICKNAME" VARCHAR2(50), 
	"MEMBER_GRADE" VARCHAR2(50) DEFAULT 'normal', 
	"MEMBER_SNS" VARCHAR2(50) DEFAULT 'normal', 
	"MEMBER_LOGIN_DATE" DATE DEFAULT sysdate, 
	"MEMBER_WARINING" NUMBER DEFAULT 0, 
	"MEMBER_TOTAL_POINT" NUMBER DEFAULT 0
   ) 

   COMMENT ON COLUMN "SEORAK_MEMBER"."MEMBER_NO" IS '회원번호'
   COMMENT ON COLUMN "SEORAK_MEMBER"."MEMBER_ID" IS 'id'
   COMMENT ON COLUMN "SEORAK_MEMBER"."MEMBER_PASSWORD" IS '비밀번호'
   COMMENT ON COLUMN "SEORAK_MEMBER"."MEMBER_NICKNAME" IS '닉네임'
   COMMENT ON COLUMN "SEORAK_MEMBER"."MEMBER_GRADE" IS '회원등급'
   COMMENT ON COLUMN "SEORAK_MEMBER"."MEMBER_SNS" IS 'sns회원여부'
   COMMENT ON COLUMN "SEORAK_MEMBER"."MEMBER_LOGIN_DATE" IS '최근 로그인 시간'
   COMMENT ON COLUMN "SEORAK_MEMBER"."MEMBER_WARINING" IS '경고 횟수'
   COMMENT ON COLUMN "SEORAK_MEMBER"."MEMBER_TOTAL_POINT" IS '보유점수'
--------------------------------------------------------
--  DDL for Table SEORAK_MESSAGE
--------------------------------------------------------

  CREATE TABLE "SEORAK_MESSAGE" 
   (	"MESSAGE_NO" NUMBER, 
	"RECV_ID" VARCHAR2(50), 
	"SEND_ID" VARCHAR2(50), 
	"MESSAGE_TITLE" VARCHAR2(255), 
	"MESSAGE_CONTENT" VARCHAR2(255), 
	"SEND_DATE" DATE DEFAULT sysdate, 
	"READ_DATE" DATE, 
	"RECV_DEL" CHAR(1) DEFAULT 0, 
	"SEND_DEL" CHAR(1) DEFAULT 0
   ) 

   COMMENT ON COLUMN "SEORAK_MESSAGE"."MESSAGE_NO" IS '쪽지번호'
   COMMENT ON COLUMN "SEORAK_MESSAGE"."RECV_ID" IS '수신자'
   COMMENT ON COLUMN "SEORAK_MESSAGE"."SEND_ID" IS '발신자'
   COMMENT ON COLUMN "SEORAK_MESSAGE"."MESSAGE_TITLE" IS '쪽지 제목'
   COMMENT ON COLUMN "SEORAK_MESSAGE"."MESSAGE_CONTENT" IS '쪽지 내용'
   COMMENT ON COLUMN "SEORAK_MESSAGE"."SEND_DATE" IS '보낸날짜'
   COMMENT ON COLUMN "SEORAK_MESSAGE"."READ_DATE" IS '읽은시간'
   COMMENT ON COLUMN "SEORAK_MESSAGE"."RECV_DEL" IS '받은쪽지 삭제 여부'
   COMMENT ON COLUMN "SEORAK_MESSAGE"."SEND_DEL" IS '보낸쪽지 삭제 여부'
   COMMENT ON TABLE "SEORAK_MESSAGE"  IS 'seorak_message'
--------------------------------------------------------
--  DDL for Table SEORAK_MYBOOKLIST
--------------------------------------------------------

  CREATE TABLE "SEORAK_MYBOOKLIST" 
   (	"MYLIST_NO" NUMBER, 
	"MYLIST_URL" VARCHAR2(255), 
	"MYLIST_IMG_URL" VARCHAR2(255), 
	"MEMBER_ID" VARCHAR2(50), 
	"ISBN" VARCHAR2(50), 
	"MYLIST_TITLE" VARCHAR2(255), 
	"MYLIST_PUBLISHER" VARCHAR2(255), 
	"MYLIST_AUTHOR" VARCHAR2(255), 
	"REG_DATE" DATE
   )
--------------------------------------------------------
--  DDL for Table SEORAK_POINT
--------------------------------------------------------

  CREATE TABLE "SEORAK_POINT" 
   (	"MEMBER_ID" VARCHAR2(50), 
	"POINT_NO" NUMBER, 
	"POINT_UPDOWN" NUMBER, 
	"POINT_REG_DATE" DATE, 
	"POINT_REASON" NUMBER, 
	"POINT_EXCHANGE_ID" VARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table SEORAK_RANKINGPOINT
--------------------------------------------------------

  CREATE TABLE "SEORAK_RANKINGPOINT" 
   (	"MEMBER_ID" VARCHAR2(255), 
	"ISBN" VARCHAR2(277), 
	"BOARD_NOTICE_STARPOINT" NUMBER, 
	"BOARD_NOTICECNT" NUMBER, 
	"TOTALPOINT" NUMBER, 
	"RANKINGWEEK" DATE
   )
--------------------------------------------------------
--  DDL for Table SEORAK_RANKING_BOOKINFO
--------------------------------------------------------

  CREATE TABLE "SEORAK_RANKING_BOOKINFO" 
   (	"ISBN" VARCHAR2(255), 
	"BOOK_TITLE" VARCHAR2(255), 
	"BOOK_AUTHOR" VARCHAR2(255), 
	"BOOK_PUBLISHER" VARCHAR2(255), 
	"BOOK_IMG" VARCHAR2(255), 
	"BOOK_PUBDATE" DATE
   )
--------------------------------------------------------
--  DDL for Table SEORAK_RANKING_RANKING
--------------------------------------------------------

  CREATE TABLE "SEORAK_RANKING_RANKING" 
   (	"BESTSELLER_WEEK" DATE, 
	"KYOBO_RANK" NUMBER, 
	"YES24_RANK" NUMBER, 
	"ALADDIN_RANK" NUMBER, 
	"BANDI_RANK" NUMBER, 
	"BOOK_TITLE" VARCHAR2(277), 
	"ISBN" VARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table SEORAK_SEARCH
--------------------------------------------------------

  CREATE TABLE "SEORAK_SEARCH" 
   (	"SEARCH_NO" NUMBER, 
	"SEARCH_ID" VARCHAR2(50), 
	"KEYWORD" VARCHAR2(250), 
	"SEARCH_TIME" DATE
   )
REM INSERTING into SEORAK_BOARD
SET DEFINE OFF;
Insert into SEORAK_BOARD (BOARD_NO,BOARD_WRITER,BOARD_CATEGORY,BOARD_CONTENT,BOARD_TITLE,BOARD_RECOMM,BOARD_VIEW,BOARD_DATE) values (72,'seeyoung','자유','ㅁㄴㅇㄹㄷㄹ','오늘만 쉬자',0,0,to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_BOARD (BOARD_NO,BOARD_WRITER,BOARD_CATEGORY,BOARD_CONTENT,BOARD_TITLE,BOARD_RECOMM,BOARD_VIEW,BOARD_DATE) values (73,'seeyoung','추천','ㅂㅂㅂㅂ','노잼',0,0,to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_BOARD (BOARD_NO,BOARD_WRITER,BOARD_CATEGORY,BOARD_CONTENT,BOARD_TITLE,BOARD_RECOMM,BOARD_VIEW,BOARD_DATE) values (47,'seeyoung','자유','gfadsff','fdfdfasdf',0,0,to_date('18/10/03','RR/MM/DD'));
Insert into SEORAK_BOARD (BOARD_NO,BOARD_WRITER,BOARD_CATEGORY,BOARD_CONTENT,BOARD_TITLE,BOARD_RECOMM,BOARD_VIEW,BOARD_DATE) values (70,'seeyoung','추천','ㅁㄴㅇㄹㄹㄹ','북테스트',0,0,to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_BOARD (BOARD_NO,BOARD_WRITER,BOARD_CATEGORY,BOARD_CONTENT,BOARD_TITLE,BOARD_RECOMM,BOARD_VIEW,BOARD_DATE) values (71,'seeyoung','자유','ㄴㅇㄹㄷㄷㄷㄷ','상세만 수정하자',0,0,to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_BOARD (BOARD_NO,BOARD_WRITER,BOARD_CATEGORY,BOARD_CONTENT,BOARD_TITLE,BOARD_RECOMM,BOARD_VIEW,BOARD_DATE) values (87,'seeyoung','비평','ㅂㅈㄷㄱㅇㅁㄴㅇㄹ','디테일 테스트중',0,0,to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_BOARD (BOARD_NO,BOARD_WRITER,BOARD_CATEGORY,BOARD_CONTENT,BOARD_TITLE,BOARD_RECOMM,BOARD_VIEW,BOARD_DATE) values (81,'seeyoung','추천','dddddd','asdfffefeeefefefefef',0,0,to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_BOARD (BOARD_NO,BOARD_WRITER,BOARD_CATEGORY,BOARD_CONTENT,BOARD_TITLE,BOARD_RECOMM,BOARD_VIEW,BOARD_DATE) values (82,'seeyoung','추천','ㅈㄷㄹㄹㄹㄹㄹ','확인용~~',0,0,to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_BOARD (BOARD_NO,BOARD_WRITER,BOARD_CATEGORY,BOARD_CONTENT,BOARD_TITLE,BOARD_RECOMM,BOARD_VIEW,BOARD_DATE) values (83,'seeyoung','추천','ㅁㄴㅇㄹ','테스트용',0,0,to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_BOARD (BOARD_NO,BOARD_WRITER,BOARD_CATEGORY,BOARD_CONTENT,BOARD_TITLE,BOARD_RECOMM,BOARD_VIEW,BOARD_DATE) values (96,'seeyoung','자유','평가좀','이 책은 어떤가요?',0,0,to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_BOARD (BOARD_NO,BOARD_WRITER,BOARD_CATEGORY,BOARD_CONTENT,BOARD_TITLE,BOARD_RECOMM,BOARD_VIEW,BOARD_DATE) values (97,'seeyoung','자유','선물~','오늘의 나한테 주는 선물',0,0,to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_BOARD (BOARD_NO,BOARD_WRITER,BOARD_CATEGORY,BOARD_CONTENT,BOARD_TITLE,BOARD_RECOMM,BOARD_VIEW,BOARD_DATE) values (98,'seeyoung','추천','추천이요','아악연구 추천합니다',0,0,to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_BOARD (BOARD_NO,BOARD_WRITER,BOARD_CATEGORY,BOARD_CONTENT,BOARD_TITLE,BOARD_RECOMM,BOARD_VIEW,BOARD_DATE) values (99,'seeyoung','비평','비평좀','이책에 대해 비평',0,0,to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_BOARD (BOARD_NO,BOARD_WRITER,BOARD_CATEGORY,BOARD_CONTENT,BOARD_TITLE,BOARD_RECOMM,BOARD_VIEW,BOARD_DATE) values (86,'seeyoung','추천','dfdfdfdf','edxvdddddccss',0,0,to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_BOARD (BOARD_NO,BOARD_WRITER,BOARD_CATEGORY,BOARD_CONTENT,BOARD_TITLE,BOARD_RECOMM,BOARD_VIEW,BOARD_DATE) values (89,'seeyoung','추천','인용이가 쓴 책입니다.','이 책을 추천합니다.',0,0,to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_BOARD (BOARD_NO,BOARD_WRITER,BOARD_CATEGORY,BOARD_CONTENT,BOARD_TITLE,BOARD_RECOMM,BOARD_VIEW,BOARD_DATE) values (51,'seeyoung','자유','loeffefasdf','득수 울다',0,0,to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_BOARD (BOARD_NO,BOARD_WRITER,BOARD_CATEGORY,BOARD_CONTENT,BOARD_TITLE,BOARD_RECOMM,BOARD_VIEW,BOARD_DATE) values (88,'seeyoung','비평','wwwwww','wwwwwww',0,0,to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_BOARD (BOARD_NO,BOARD_WRITER,BOARD_CATEGORY,BOARD_CONTENT,BOARD_TITLE,BOARD_RECOMM,BOARD_VIEW,BOARD_DATE) values (5,'seeyoung','자유','sdfdf','유신이는 바보다',0,0,to_date('18/10/02','RR/MM/DD'));
Insert into SEORAK_BOARD (BOARD_NO,BOARD_WRITER,BOARD_CATEGORY,BOARD_CONTENT,BOARD_TITLE,BOARD_RECOMM,BOARD_VIEW,BOARD_DATE) values (1,'seeyoung','비평','test','test',0,0,to_date('18/10/02','RR/MM/DD'));
Insert into SEORAK_BOARD (BOARD_NO,BOARD_WRITER,BOARD_CATEGORY,BOARD_CONTENT,BOARD_TITLE,BOARD_RECOMM,BOARD_VIEW,BOARD_DATE) values (2,'admin','비평','닉네임 가져오기','test2',0,0,to_date('18/10/02','RR/MM/DD'));
Insert into SEORAK_BOARD (BOARD_NO,BOARD_WRITER,BOARD_CATEGORY,BOARD_CONTENT,BOARD_TITLE,BOARD_RECOMM,BOARD_VIEW,BOARD_DATE) values (3,'admin','비평','dfdfdsdsd','test 확인중',0,0,to_date('18/10/02','RR/MM/DD'));
Insert into SEORAK_BOARD (BOARD_NO,BOARD_WRITER,BOARD_CATEGORY,BOARD_CONTENT,BOARD_TITLE,BOARD_RECOMM,BOARD_VIEW,BOARD_DATE) values (85,'쟤는 전설이다','추천','adf','afd',0,0,to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_BOARD (BOARD_NO,BOARD_WRITER,BOARD_CATEGORY,BOARD_CONTENT,BOARD_TITLE,BOARD_RECOMM,BOARD_VIEW,BOARD_DATE) values (7,'seeyoung','추천','asdfffff','236778',0,0,to_date('18/10/02','RR/MM/DD'));
commit;
REM INSERTING into SEORAK_BOARDBOOK
SET DEFINE OFF;
Insert into SEORAK_BOARDBOOK (BOARD_NO,MEMBER_ID,BOARD_BOOK_TITLE,BOARD_BOOK_PUBLISHER,BOARD_BOOK_AUTHOR,BOARD_BOOK_COVER,ISBN,BOOK_TITLE) values (2,'seeyoung','북테스트','이지스퍼블리싱','정인용','https://bookthumb-phinf.pstatic.net/cover/134/575/13457579.jpg?type=m1','1163030031 9791163030034',null);
Insert into SEORAK_BOARDBOOK (BOARD_NO,MEMBER_ID,BOARD_BOOK_TITLE,BOARD_BOOK_PUBLISHER,BOARD_BOOK_AUTHOR,BOARD_BOOK_COVER,ISBN,BOOK_TITLE) values (3,'seeyoung','상세만 하면 되겟네','이지스퍼블리싱','박은종','https://bookthumb-phinf.pstatic.net/cover/137/971/13797129.jpg?type=m1','1163030198 9791163030195',null);
Insert into SEORAK_BOARDBOOK (BOARD_NO,MEMBER_ID,BOARD_BOOK_TITLE,BOARD_BOOK_PUBLISHER,BOARD_BOOK_AUTHOR,BOARD_BOOK_COVER,ISBN,BOOK_TITLE) values (4,'seeyoung','오늘만 쉬자','부크럼','손힘찬','https://bookthumb-phinf.pstatic.net/cover/137/970/13797037.jpg?type=m1','1162141786 9791162141786',null);
Insert into SEORAK_BOARDBOOK (BOARD_NO,MEMBER_ID,BOARD_BOOK_TITLE,BOARD_BOOK_PUBLISHER,BOARD_BOOK_AUTHOR,BOARD_BOOK_COVER,ISBN,BOOK_TITLE) values (5,'seeyoung','노잼','사이언스북스','<b>칼</b> 세이건','https://bookthumb-phinf.pstatic.net/cover/026/239/02623907.jpg?type=m1','8983711892 9788983711892',null);
Insert into SEORAK_BOARDBOOK (BOARD_NO,MEMBER_ID,BOARD_BOOK_TITLE,BOARD_BOOK_PUBLISHER,BOARD_BOOK_AUTHOR,BOARD_BOOK_COVER,ISBN,BOOK_TITLE) values (6,'seeyoung','상세페이지안보여','영진닷컴','김경은','https://bookthumb-phinf.pstatic.net/cover/128/416/12841638.jpg?type=m1','8931456786 9788931456783',null);
Insert into SEORAK_BOARDBOOK (BOARD_NO,MEMBER_ID,BOARD_BOOK_TITLE,BOARD_BOOK_PUBLISHER,BOARD_BOOK_AUTHOR,BOARD_BOOK_COVER,ISBN,BOOK_TITLE) values (7,'seeyoung','졸리네','열린책들','베르나르 베르베르','https://bookthumb-phinf.pstatic.net/cover/120/850/12085032.jpg?type=m1','8932918376 9788932918372',null);
Insert into SEORAK_BOARDBOOK (BOARD_NO,MEMBER_ID,BOARD_BOOK_TITLE,BOARD_BOOK_PUBLISHER,BOARD_BOOK_AUTHOR,BOARD_BOOK_COVER,ISBN,BOOK_TITLE) values (16,'seeyoung','디테일 테스트중','한빛미디어','이선 브라운','https://bookthumb-phinf.pstatic.net/cover/121/818/12181869.jpg?type=m1','8968483388 9788968483387','러닝 <b>자바</b>스크립트 (ES6로 제대로 입문하는 모던 <b>자바</b>스크립트 웹 개발)');
Insert into SEORAK_BOARDBOOK (BOARD_NO,MEMBER_ID,BOARD_BOOK_TITLE,BOARD_BOOK_PUBLISHER,BOARD_BOOK_AUTHOR,BOARD_BOOK_COVER,ISBN,BOOK_TITLE) values (101,'seeyoung','자바스크립트 책 추천','이지스퍼블리싱','정인용','https://bookthumb-phinf.pstatic.net/cover/134/575/13457579.jpg?type=m1','1163030031 9791163030034','Do it! <b>자바</b>스크립트   제이쿼리 입문 (155개 예제로 기본 잡고, 반응형 웹부터 실무 활용 플러그인까지!)');
Insert into SEORAK_BOARDBOOK (BOARD_NO,MEMBER_ID,BOARD_BOOK_TITLE,BOARD_BOOK_PUBLISHER,BOARD_BOOK_AUTHOR,BOARD_BOOK_COVER,ISBN,BOOK_TITLE) values (10,'seeyoung','asdfffefeeefefefefef','이지스퍼블리싱','정인용','https://bookthumb-phinf.pstatic.net/cover/134/575/13457579.jpg?type=m1','1163030031 9791163030034',null);
Insert into SEORAK_BOARDBOOK (BOARD_NO,MEMBER_ID,BOARD_BOOK_TITLE,BOARD_BOOK_PUBLISHER,BOARD_BOOK_AUTHOR,BOARD_BOOK_COVER,ISBN,BOOK_TITLE) values (11,'seeyoung','확인용~~','부크럼','손힘찬','https://bookthumb-phinf.pstatic.net/cover/137/970/13797037.jpg?type=m1','1162141786 9791162141786',null);
Insert into SEORAK_BOARDBOOK (BOARD_NO,MEMBER_ID,BOARD_BOOK_TITLE,BOARD_BOOK_PUBLISHER,BOARD_BOOK_AUTHOR,BOARD_BOOK_COVER,ISBN,BOOK_TITLE) values (12,'seeyoung','테스트용','이지스퍼블리싱','정인용','https://bookthumb-phinf.pstatic.net/cover/134/575/13457579.jpg?type=m1','1163030031 9791163030034',null);
Insert into SEORAK_BOARDBOOK (BOARD_NO,MEMBER_ID,BOARD_BOOK_TITLE,BOARD_BOOK_PUBLISHER,BOARD_BOOK_AUTHOR,BOARD_BOOK_COVER,ISBN,BOOK_TITLE) values (13,'seeyoung','성일형','이지스퍼블리싱','정인용','https://bookthumb-phinf.pstatic.net/cover/134/575/13457579.jpg?type=m1','1163030031 9791163030034',null);
Insert into SEORAK_BOARDBOOK (BOARD_NO,MEMBER_ID,BOARD_BOOK_TITLE,BOARD_BOOK_PUBLISHER,BOARD_BOOK_AUTHOR,BOARD_BOOK_COVER,ISBN,BOOK_TITLE) values (90,'seeyoung','책내용이 어렵다.','이지스퍼블리싱','정인용','https://bookthumb-phinf.pstatic.net/cover/134/575/13457579.jpg?type=m1','1163030031 9791163030034','Do it! <b>자바</b>스크립트   제이쿼리 입문 (155개 예제로 기본 잡고, 반응형 웹부터 실무 활용 플러그인까지!)');
Insert into SEORAK_BOARDBOOK (BOARD_NO,MEMBER_ID,BOARD_BOOK_TITLE,BOARD_BOOK_PUBLISHER,BOARD_BOOK_AUTHOR,BOARD_BOOK_COVER,ISBN,BOOK_TITLE) values (96,'seeyoung','이 책은 어떤가요?','이지스퍼블리싱','박은종','https://bookthumb-phinf.pstatic.net/cover/137/971/13797129.jpg?type=m1','1163030198 9791163030195','Do it! <b>자바</b> 프로그래밍 입문 (개발 10년, 강의 10년! 명강사의 기초 튼튼 코딩 밥상!)');
Insert into SEORAK_BOARDBOOK (BOARD_NO,MEMBER_ID,BOARD_BOOK_TITLE,BOARD_BOOK_PUBLISHER,BOARD_BOOK_AUTHOR,BOARD_BOOK_COVER,ISBN,BOOK_TITLE) values (97,'seeyoung','오늘의 나한테 주는 선물','예담','도대체','https://bookthumb-phinf.pstatic.net/cover/125/624/12562407.jpg?type=m1','8959135593 9788959135592','일단 <b>오늘은</b> 나한테 잘합시다 (어쩐지 의기양양 도대체 씨의 띄엄띄엄 인생 기술)');
Insert into SEORAK_BOARDBOOK (BOARD_NO,MEMBER_ID,BOARD_BOOK_TITLE,BOARD_BOOK_PUBLISHER,BOARD_BOOK_AUTHOR,BOARD_BOOK_COVER,ISBN,BOOK_TITLE) values (98,'seeyoung','아악연구 추천합니다','민속원','정화순','https://bookthumb-phinf.pstatic.net/cover/024/870/02487050.jpg?type=m1','8956383502 9788956383507','조선 세종대 <b>조회</b>아악 연구');
Insert into SEORAK_BOARDBOOK (BOARD_NO,MEMBER_ID,BOARD_BOOK_TITLE,BOARD_BOOK_PUBLISHER,BOARD_BOOK_AUTHOR,BOARD_BOOK_COVER,ISBN,BOOK_TITLE) values (99,'seeyoung','이책에 대해 비평','청미디어','남시욱','https://bookthumb-phinf.pstatic.net/cover/137/730/13773016.jpg?type=m1','1187861138 9791187861133','한국 진보세력 <b>연구</b>');
Insert into SEORAK_BOARDBOOK (BOARD_NO,MEMBER_ID,BOARD_BOOK_TITLE,BOARD_BOOK_PUBLISHER,BOARD_BOOK_AUTHOR,BOARD_BOOK_COVER,ISBN,BOOK_TITLE) values (100,'seeyoung','음료수 만들기','수작걸다','신송이','https://bookthumb-phinf.pstatic.net/cover/120/963/12096367.jpg?type=m1','8969930167 9788969930163','한입에 가정식 <b>음료</b> 100 (수제 베이스로 만드는 100가지 <b>음료</b>)');
Insert into SEORAK_BOARDBOOK (BOARD_NO,MEMBER_ID,BOARD_BOOK_TITLE,BOARD_BOOK_PUBLISHER,BOARD_BOOK_AUTHOR,BOARD_BOOK_COVER,ISBN,BOOK_TITLE) values (15,'seeyoung','edxvdddddccss','부크럼','손힘찬','https://bookthumb-phinf.pstatic.net/cover/137/970/13797037.jpg?type=m1','1162141786 9791162141786','<b>오늘은</b> 이만 좀 쉴게요');
Insert into SEORAK_BOARDBOOK (BOARD_NO,MEMBER_ID,BOARD_BOOK_TITLE,BOARD_BOOK_PUBLISHER,BOARD_BOOK_AUTHOR,BOARD_BOOK_COVER,ISBN,BOOK_TITLE) values (88,'seeyoung','wwwwwww','이지스퍼블리싱','정인용','https://bookthumb-phinf.pstatic.net/cover/134/575/13457579.jpg?type=m1','1163030031 9791163030034','Do it! <b>자바</b>스크립트   제이쿼리 입문 (155개 예제로 기본 잡고, 반응형 웹부터 실무 활용 플러그인까지!)');
Insert into SEORAK_BOARDBOOK (BOARD_NO,MEMBER_ID,BOARD_BOOK_TITLE,BOARD_BOOK_PUBLISHER,BOARD_BOOK_AUTHOR,BOARD_BOOK_COVER,ISBN,BOOK_TITLE) values (89,'seeyoung','이 책을 추천합니다.','이지스퍼블리싱','정인용','https://bookthumb-phinf.pstatic.net/cover/134/575/13457579.jpg?type=m1','1163030031 9791163030034','Do it! <b>자바</b>스크립트   제이쿼리 입문 (155개 예제로 기본 잡고, 반응형 웹부터 실무 활용 플러그인까지!)');
Insert into SEORAK_BOARDBOOK (BOARD_NO,MEMBER_ID,BOARD_BOOK_TITLE,BOARD_BOOK_PUBLISHER,BOARD_BOOK_AUTHOR,BOARD_BOOK_COVER,ISBN,BOOK_TITLE) values (8,'쟤는 전설이다','dsfafda','북바이북','이혜화','https://bookthumb-phinf.pstatic.net/cover/139/543/13954303.jpg?type=m1','118540080X 9791185400808',null);
Insert into SEORAK_BOARDBOOK (BOARD_NO,MEMBER_ID,BOARD_BOOK_TITLE,BOARD_BOOK_PUBLISHER,BOARD_BOOK_AUTHOR,BOARD_BOOK_COVER,ISBN,BOOK_TITLE) values (9,'쟤는 전설이다','sadfsfd','북바이북','이혜화','https://bookthumb-phinf.pstatic.net/cover/139/543/13954303.jpg?type=m1','118540080X 9791185400808',null);
Insert into SEORAK_BOARDBOOK (BOARD_NO,MEMBER_ID,BOARD_BOOK_TITLE,BOARD_BOOK_PUBLISHER,BOARD_BOOK_AUTHOR,BOARD_BOOK_COVER,ISBN,BOOK_TITLE) values (87,'쟤는 전설이다','afd','북바이북','이혜화','https://bookthumb-phinf.pstatic.net/cover/139/543/13954303.jpg?type=m1','118540080X 9791185400808',null);
commit;
REM INSERTING into SEORAK_COMMENT
SET DEFINE OFF;
Insert into SEORAK_COMMENT (COMMENT_NO,BOARD_NO,COMMENT_WRITER,COMMENT_CONTENT,COMMENT_DATE) values (9,6,'2222','용제형',to_date('18/10/02','RR/MM/DD'));
Insert into SEORAK_COMMENT (COMMENT_NO,BOARD_NO,COMMENT_WRITER,COMMENT_CONTENT,COMMENT_DATE) values (26,8,'sdff','연탄길',to_date('18/10/03','RR/MM/DD'));
Insert into SEORAK_COMMENT (COMMENT_NO,BOARD_NO,COMMENT_WRITER,COMMENT_CONTENT,COMMENT_DATE) values (27,8,'asdf','1233',to_date('18/10/03','RR/MM/DD'));
Insert into SEORAK_COMMENT (COMMENT_NO,BOARD_NO,COMMENT_WRITER,COMMENT_CONTENT,COMMENT_DATE) values (28,8,'feeee','wwwff',to_date('18/10/03','RR/MM/DD'));
Insert into SEORAK_COMMENT (COMMENT_NO,BOARD_NO,COMMENT_WRITER,COMMENT_CONTENT,COMMENT_DATE) values (29,8,'efef','wwwffss',to_date('18/10/03','RR/MM/DD'));
Insert into SEORAK_COMMENT (COMMENT_NO,BOARD_NO,COMMENT_WRITER,COMMENT_CONTENT,COMMENT_DATE) values (30,8,'tjsxoff','aaaa',to_date('18/10/03','RR/MM/DD'));
Insert into SEORAK_COMMENT (COMMENT_NO,BOARD_NO,COMMENT_WRITER,COMMENT_CONTENT,COMMENT_DATE) values (31,8,'zzzff','erqrerer',to_date('18/10/03','RR/MM/DD'));
Insert into SEORAK_COMMENT (COMMENT_NO,BOARD_NO,COMMENT_WRITER,COMMENT_CONTENT,COMMENT_DATE) values (40,75,'득수','워치',to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_COMMENT (COMMENT_NO,BOARD_NO,COMMENT_WRITER,COMMENT_CONTENT,COMMENT_DATE) values (2,6,'드륵수','드륵수',to_date('18/10/02','RR/MM/DD'));
Insert into SEORAK_COMMENT (COMMENT_NO,BOARD_NO,COMMENT_WRITER,COMMENT_CONTENT,COMMENT_DATE) values (4,6,'용제형','용제형~~',to_date('18/10/02','RR/MM/DD'));
Insert into SEORAK_COMMENT (COMMENT_NO,BOARD_NO,COMMENT_WRITER,COMMENT_CONTENT,COMMENT_DATE) values (5,6,'용제형~~~~~','코멘트 했어여???',to_date('18/10/02','RR/MM/DD'));
Insert into SEORAK_COMMENT (COMMENT_NO,BOARD_NO,COMMENT_WRITER,COMMENT_CONTENT,COMMENT_DATE) values (6,6,'2222','용제형~~~~',to_date('18/10/02','RR/MM/DD'));
Insert into SEORAK_COMMENT (COMMENT_NO,BOARD_NO,COMMENT_WRITER,COMMENT_CONTENT,COMMENT_DATE) values (10,10,'test','sdfefddddfedfff',to_date('18/10/02','RR/MM/DD'));
Insert into SEORAK_COMMENT (COMMENT_NO,BOARD_NO,COMMENT_WRITER,COMMENT_CONTENT,COMMENT_DATE) values (21,9,'2222','수정이 쫌 이상하네 ',to_date('18/10/03','RR/MM/DD'));
Insert into SEORAK_COMMENT (COMMENT_NO,BOARD_NO,COMMENT_WRITER,COMMENT_CONTENT,COMMENT_DATE) values (22,9,'텍스트','33333',to_date('18/10/03','RR/MM/DD'));
Insert into SEORAK_COMMENT (COMMENT_NO,BOARD_NO,COMMENT_WRITER,COMMENT_CONTENT,COMMENT_DATE) values (23,9,'ㅇㄹㅇㄹ','이상하다',to_date('18/10/03','RR/MM/DD'));
Insert into SEORAK_COMMENT (COMMENT_NO,BOARD_NO,COMMENT_WRITER,COMMENT_CONTENT,COMMENT_DATE) values (34,57,'2222222222','asdf',to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_COMMENT (COMMENT_NO,BOARD_NO,COMMENT_WRITER,COMMENT_CONTENT,COMMENT_DATE) values (36,75,'asfdsa','asfdf',to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_COMMENT (COMMENT_NO,BOARD_NO,COMMENT_WRITER,COMMENT_CONTENT,COMMENT_DATE) values (38,75,'되면은 ','설화',to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_COMMENT (COMMENT_NO,BOARD_NO,COMMENT_WRITER,COMMENT_CONTENT,COMMENT_DATE) values (39,75,'asdfdf','afsdfdsfda',to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_COMMENT (COMMENT_NO,BOARD_NO,COMMENT_WRITER,COMMENT_CONTENT,COMMENT_DATE) values (7,6,'방진웅','내일 건대',to_date('18/10/02','RR/MM/DD'));
Insert into SEORAK_COMMENT (COMMENT_NO,BOARD_NO,COMMENT_WRITER,COMMENT_CONTENT,COMMENT_DATE) values (8,6,'됏다~~','용제형: 형 할일없어요?
        도와줘....',to_date('18/10/02','RR/MM/DD'));
Insert into SEORAK_COMMENT (COMMENT_NO,BOARD_NO,COMMENT_WRITER,COMMENT_CONTENT,COMMENT_DATE) values (42,85,'dsafasdfsda','sadfsdafsdafsad',to_date('18/10/04','RR/MM/DD'));
commit;
REM INSERTING into SEORAK_MEMBER
SET DEFINE OFF;
Insert into SEORAK_MEMBER (MEMBER_NO,MEMBER_ID,MEMBER_PASSWORD,MEMBER_NICKNAME,MEMBER_GRADE,MEMBER_SNS,MEMBER_LOGIN_DATE,MEMBER_WARINING,MEMBER_TOTAL_POINT) values (3,'curogom@gmail.com','lcwEm9Hy1v8CVOm9Xdb+iw==','curogom','normal','normal',to_date('18/10/04','RR/MM/DD'),0,0);
Insert into SEORAK_MEMBER (MEMBER_NO,MEMBER_ID,MEMBER_PASSWORD,MEMBER_NICKNAME,MEMBER_GRADE,MEMBER_SNS,MEMBER_LOGIN_DATE,MEMBER_WARINING,MEMBER_TOTAL_POINT) values (61,'a1234555558@naver.com','c90lW+qphR/RzbVEUVYARQ==','창유','normal','normal',to_date('18/10/04','RR/MM/DD'),0,0);
Insert into SEORAK_MEMBER (MEMBER_NO,MEMBER_ID,MEMBER_PASSWORD,MEMBER_NICKNAME,MEMBER_GRADE,MEMBER_SNS,MEMBER_LOGIN_DATE,MEMBER_WARINING,MEMBER_TOTAL_POINT) values (41,'woro104@naver.com','XT8DE2/NTOvn+HXwNzYy9g==','seeyoung','normal','normal',to_date('18/10/05','RR/MM/DD'),0,0);
Insert into SEORAK_MEMBER (MEMBER_NO,MEMBER_ID,MEMBER_PASSWORD,MEMBER_NICKNAME,MEMBER_GRADE,MEMBER_SNS,MEMBER_LOGIN_DATE,MEMBER_WARINING,MEMBER_TOTAL_POINT) values (62,'spracy@naver.com','U7TqTIGAknE76oV8s8MPKw==','유병욱','normal','normal',to_date('18/10/04','RR/MM/DD'),0,0);
Insert into SEORAK_MEMBER (MEMBER_NO,MEMBER_ID,MEMBER_PASSWORD,MEMBER_NICKNAME,MEMBER_GRADE,MEMBER_SNS,MEMBER_LOGIN_DATE,MEMBER_WARINING,MEMBER_TOTAL_POINT) values (21,'jinwoong@naver.com','fuiN8eNGbfJhAIWdI98fzQ==','나는코딩의전설이다(진웅)','normal','normal',to_date('18/09/29','RR/MM/DD'),0,0);
Insert into SEORAK_MEMBER (MEMBER_NO,MEMBER_ID,MEMBER_PASSWORD,MEMBER_NICKNAME,MEMBER_GRADE,MEMBER_SNS,MEMBER_LOGIN_DATE,MEMBER_WARINING,MEMBER_TOTAL_POINT) values (7,'exist17@naver.com','U7TqTIGAknE76oV8s8MPKw==','쟤는 전설이다','normal','normal',to_date('18/10/05','RR/MM/DD'),0,123516);
Insert into SEORAK_MEMBER (MEMBER_NO,MEMBER_ID,MEMBER_PASSWORD,MEMBER_NICKNAME,MEMBER_GRADE,MEMBER_SNS,MEMBER_LOGIN_DATE,MEMBER_WARINING,MEMBER_TOTAL_POINT) values (22,'dlopo123@gmail.com','U7TqTIGAknE76oV8s8MPKw==','나는전설(진웅)','normal','normal',to_date('18/10/04','RR/MM/DD'),0,490);
Insert into SEORAK_MEMBER (MEMBER_NO,MEMBER_ID,MEMBER_PASSWORD,MEMBER_NICKNAME,MEMBER_GRADE,MEMBER_SNS,MEMBER_LOGIN_DATE,MEMBER_WARINING,MEMBER_TOTAL_POINT) values (5,'seorakbooks@gmail.com','nu6gQnF690TispZvdhDiGw==','admin','admin','normal',to_date('18/10/04','RR/MM/DD'),0,440);
Insert into SEORAK_MEMBER (MEMBER_NO,MEMBER_ID,MEMBER_PASSWORD,MEMBER_NICKNAME,MEMBER_GRADE,MEMBER_SNS,MEMBER_LOGIN_DATE,MEMBER_WARINING,MEMBER_TOTAL_POINT) values (6,'dlopo123@naver.com','c90lW+qphR/RzbVEUVYARQ==','나는전설이다','normal','normal',to_date('18/10/01','RR/MM/DD'),0,0);
commit;
REM INSERTING into SEORAK_MESSAGE
SET DEFINE OFF;
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (4,'admin','admin','ㅇㄹㄴㅇㄹㄴㅇㄹㄴㄹㅇ','ㅁㄴㅇㄹㄴㅁㄹㅇㄴㅁㄹㄴㅇㄹㄴㅁㄹ',to_date('18/10/02','RR/MM/DD'),to_date('18/10/02','RR/MM/DD'),'1','1');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (24,'seeyoung','쟤는 전설이다','중탈은','선택',to_date('18/10/04','RR/MM/DD'),null,'1','1');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (25,'seeyoung','쟤는 전설이다','진웅이형과','ㅇㅇ',to_date('18/10/04','RR/MM/DD'),null,'0','1');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (26,'쟤는 전설이다','seeyoung','큐큐','깍가',to_date('18/10/04','RR/MM/DD'),null,'1','0');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (37,'쟤는 전설이다','쟤는 전설이다','sadfasdf','fasdsdfas',to_date('18/10/04','RR/MM/DD'),to_date('18/10/04','RR/MM/DD'),'1','1');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (38,'쟤는 전설이다','쟤는 전설이다','asdffa','asdfsdf',to_date('18/10/04','RR/MM/DD'),null,'1','1');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (39,'쟤는 전설이다','쟤는 전설이다','sdafas','afsdfas',to_date('18/10/04','RR/MM/DD'),to_date('18/10/04','RR/MM/DD'),'1','0');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (3,'admin','curogom','asdfasdf','aswdfsadf',to_date('18/10/02','RR/MM/DD'),to_date('18/10/02','RR/MM/DD'),'1','0');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (5,'admin','admin','asdfasdf','ㅇ나ㅓ랑니러ㅏ인렁나ㅣㅁㅇ러ㅏㅣㅣ더ㅏㅇㄴㄹ',to_date('18/10/02','RR/MM/DD'),to_date('18/10/02','RR/MM/DD'),'1','1');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (21,'seeyoung','쟤는 전설이다','중탈은','선택입니다',to_date('18/10/04','RR/MM/DD'),null,'1','1');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (22,'seeyoung','쟤는 전설이다','중탈은','선택입니다',to_date('18/10/04','RR/MM/DD'),null,'1','1');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (23,'seeyoung','쟤는 전설이다','중탈은','선택입니다',to_date('18/10/04','RR/MM/DD'),null,'0','1');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (1,'admin','curogom','asdfasdf','asdfasdf',to_date('18/10/02','RR/MM/DD'),to_date('18/10/02','RR/MM/DD'),'0','0');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (2,'admin','curogom','asdfasdfdd','asdfasdfdd',to_date('18/10/02','RR/MM/DD'),to_date('18/10/02','RR/MM/DD'),'0','0');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (30,'쟤는 전설이다','쟤는 전설이다','```21','12213',to_date('18/10/04','RR/MM/DD'),null,'1','1');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (31,'admin','쟤는 전설이다','쪽지','쪽지',to_date('18/10/04','RR/MM/DD'),null,'0','1');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (32,'admin','쟤는 전설이다','1111111111111','1111111111',to_date('18/10/04','RR/MM/DD'),null,'0','1');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (33,'쟤는 전설이다','쟤는 전설이다','ㅁㄹㅇㄴ','ㄴㅇㅁㄹ',to_date('18/10/04','RR/MM/DD'),to_date('18/10/04','RR/MM/DD'),'1','0');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (34,'쟤는 전설이다','쟤는 전설이다','ㅁㅇㄴㄹ','ㅁㄴㅇㄻ',to_date('18/10/04','RR/MM/DD'),null,'1','1');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (35,'쟤는 전설이다','쟤는 전설이다','ㄴㅇㅁㄹㅇㄴㅇㄻㄴ','ㄴㅁㅇㄹㅇㄴ',to_date('18/10/04','RR/MM/DD'),null,'1','0');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (36,'쟤는 전설이다','쟤는 전설이다','진웅이형과asd','sdafasdf',to_date('18/10/04','RR/MM/DD'),null,'0','0');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (27,'seeyoung','쟤는 전설이다','진웅이형과','11',to_date('18/10/04','RR/MM/DD'),null,'0','0');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (28,'쟤는 전설이다','쟤는 전설이다','1111111','11111111',to_date('18/10/04','RR/MM/DD'),null,'1','0');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (29,'쟤는 전설이다','쟤는 전설이다','12','123',to_date('18/10/04','RR/MM/DD'),null,'1','0');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (40,'쟤는 전설이다','쟤는 전설이다','진웅이형과','safdsadf',to_date('18/10/04','RR/MM/DD'),null,'0','0');
Insert into SEORAK_MESSAGE (MESSAGE_NO,RECV_ID,SEND_ID,MESSAGE_TITLE,MESSAGE_CONTENT,SEND_DATE,READ_DATE,RECV_DEL,SEND_DEL) values (41,'쟤는 전설이다','쟤는 전설이다','sdafdfa','fasddfsd',to_date('18/10/04','RR/MM/DD'),null,'0','0');
commit;
REM INSERTING into SEORAK_MYBOOKLIST
SET DEFINE OFF;
Insert into SEORAK_MYBOOKLIST (MYLIST_NO,MYLIST_URL,MYLIST_IMG_URL,MEMBER_ID,ISBN,MYLIST_TITLE,MYLIST_PUBLISHER,MYLIST_AUTHOR,REG_DATE) values (73,'http://book.naver.com/bookdb/book_detail.php?bid=13453490','https://bookthumb-phinf.pstatic.net/cover/134/534/13453490.jpg?type=m1','exist17@naver.com','8936442929 9788936442927','<b>도깨비</b>폰을 개통하시겠습니까?','창비','박하익',to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_MYBOOKLIST (MYLIST_NO,MYLIST_URL,MYLIST_IMG_URL,MEMBER_ID,ISBN,MYLIST_TITLE,MYLIST_PUBLISHER,MYLIST_AUTHOR,REG_DATE) values (13,'http://book.naver.com/bookdb/book_detail.php?bid=161393','https://bookthumb-phinf.pstatic.net/cover/001/613/00161393.jpg?type=m1','dlopo123@gmail.com','8987504565 9788987504568','으악, <b>도깨비</b>다!','느림보','손정원',to_date('18/09/29','RR/MM/DD'));
Insert into SEORAK_MYBOOKLIST (MYLIST_NO,MYLIST_URL,MYLIST_IMG_URL,MEMBER_ID,ISBN,MYLIST_TITLE,MYLIST_PUBLISHER,MYLIST_AUTHOR,REG_DATE) values (14,'http://book.naver.com/bookdb/book_detail.php?bid=12181869','https://bookthumb-phinf.pstatic.net/cover/121/818/12181869.jpg?type=m1','dlopo123@gmail.com','8968483388 9788968483387','러닝 <b>자바</b>스크립트 (ES6로 제대로 입문하는 모던 <b>자바</b>스크립트 웹 개발)','한빛미디어','이선',to_date('18/09/29','RR/MM/DD'));
Insert into SEORAK_MYBOOKLIST (MYLIST_NO,MYLIST_URL,MYLIST_IMG_URL,MEMBER_ID,ISBN,MYLIST_TITLE,MYLIST_PUBLISHER,MYLIST_AUTHOR,REG_DATE) values (30,'http://book.naver.com/bookdb/book_detail.php?bid=11023382','https://bookthumb-phinf.pstatic.net/cover/110/233/11023382.jpg?type=m1','dlopo123@gmail.com','8904165598 9788904165599','<b>연탄길</b> 3','생명의말씀사','이철환',to_date('18/10/01','RR/MM/DD'));
Insert into SEORAK_MYBOOKLIST (MYLIST_NO,MYLIST_URL,MYLIST_IMG_URL,MEMBER_ID,ISBN,MYLIST_TITLE,MYLIST_PUBLISHER,MYLIST_AUTHOR,REG_DATE) values (35,'http://book.naver.com/bookdb/book_detail.php?bid=11023382','https://bookthumb-phinf.pstatic.net/cover/110/233/11023382.jpg?type=m1','dlopo123@naver.com','8904165598 9788904165599','<b>연탄길</b> 3','생명의말씀사','이철환',to_date('18/10/01','RR/MM/DD'));
Insert into SEORAK_MYBOOKLIST (MYLIST_NO,MYLIST_URL,MYLIST_IMG_URL,MEMBER_ID,ISBN,MYLIST_TITLE,MYLIST_PUBLISHER,MYLIST_AUTHOR,REG_DATE) values (74,'http://book.naver.com/bookdb/book_detail.php?bid=13733438','https://bookthumb-phinf.pstatic.net/cover/137/334/13733438.jpg?type=m1','seorakbooks@gmail.com','1196394504 9791196394509','죽고 싶지만 <b>떡볶이</b>는 먹고 싶어 (백세희 에세이)','흔','백세희',to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_MYBOOKLIST (MYLIST_NO,MYLIST_URL,MYLIST_IMG_URL,MEMBER_ID,ISBN,MYLIST_TITLE,MYLIST_PUBLISHER,MYLIST_AUTHOR,REG_DATE) values (28,'http://book.naver.com/bookdb/book_detail.php?bid=13453490','https://bookthumb-phinf.pstatic.net/cover/134/534/13453490.jpg?type=m1','dlopo123@naver.com','8936442929 9788936442927','<b>도깨비</b>폰을 개통하시겠습니까?','창비','박하익',to_date('18/10/01','RR/MM/DD'));
Insert into SEORAK_MYBOOKLIST (MYLIST_NO,MYLIST_URL,MYLIST_IMG_URL,MEMBER_ID,ISBN,MYLIST_TITLE,MYLIST_PUBLISHER,MYLIST_AUTHOR,REG_DATE) values (29,'http://book.naver.com/bookdb/book_detail.php?bid=8589375','https://bookthumb-phinf.pstatic.net/cover/085/893/08589375.jpg?type=m1','dlopo123@naver.com','8968481474 9788968481475','이것이 <b>자바</b>다 (신용권의 Java 프로그래밍 정복)','한빛미디어','신용권',to_date('18/10/01','RR/MM/DD'));
Insert into SEORAK_MYBOOKLIST (MYLIST_NO,MYLIST_URL,MYLIST_IMG_URL,MEMBER_ID,ISBN,MYLIST_TITLE,MYLIST_PUBLISHER,MYLIST_AUTHOR,REG_DATE) values (61,'http://book.naver.com/bookdb/book_detail.php?bid=13457579','https://bookthumb-phinf.pstatic.net/cover/134/575/13457579.jpg?type=m1','exist17@naver.com','1163030031 9791163030034','Do it! <b>자바</b>스크립트   제이쿼리 입문 (155개 예제로 기본 잡고, 반응형 웹부터 실무 활용 플러그인까지!)','이지스퍼블리싱','정인용',to_date('18/10/03','RR/MM/DD'));
Insert into SEORAK_MYBOOKLIST (MYLIST_NO,MYLIST_URL,MYLIST_IMG_URL,MEMBER_ID,ISBN,MYLIST_TITLE,MYLIST_PUBLISHER,MYLIST_AUTHOR,REG_DATE) values (71,'http://book.naver.com/bookdb/book_detail.php?bid=13954303','https://bookthumb-phinf.pstatic.net/cover/139/543/13954303.jpg?type=m1','woro104@naver.com','118540080X 9791185400808','<b>설화</b>, 욕망을 품다 (여섯 빛깔 <b>설화</b> 속의 숨은 진실 찾기)','북바이북','이혜화',to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_MYBOOKLIST (MYLIST_NO,MYLIST_URL,MYLIST_IMG_URL,MEMBER_ID,ISBN,MYLIST_TITLE,MYLIST_PUBLISHER,MYLIST_AUTHOR,REG_DATE) values (64,'http://book.naver.com/bookdb/book_detail.php?bid=13457579','https://bookthumb-phinf.pstatic.net/cover/134/575/13457579.jpg?type=m1','exist17@naver.com','1163030031 9791163030034','Do it! <b>자바</b>스크립트   제이쿼리 입문 (155개 예제로 기본 잡고, 반응형 웹부터 실무 활용 플러그인까지!)','이지스퍼블리싱','정인용',to_date('18/10/03','RR/MM/DD'));
Insert into SEORAK_MYBOOKLIST (MYLIST_NO,MYLIST_URL,MYLIST_IMG_URL,MEMBER_ID,ISBN,MYLIST_TITLE,MYLIST_PUBLISHER,MYLIST_AUTHOR,REG_DATE) values (65,'http://book.naver.com/bookdb/book_detail.php?bid=13797037','https://bookthumb-phinf.pstatic.net/cover/137/970/13797037.jpg?type=m1','woro104@naver.com','1162141786 9791162141786','<b>오늘은</b> 이만 좀 쉴게요','부크럼','손힘찬',to_date('18/10/03','RR/MM/DD'));
Insert into SEORAK_MYBOOKLIST (MYLIST_NO,MYLIST_URL,MYLIST_IMG_URL,MEMBER_ID,ISBN,MYLIST_TITLE,MYLIST_PUBLISHER,MYLIST_AUTHOR,REG_DATE) values (68,'http://book.naver.com/bookdb/book_detail.php?bid=9189544','https://bookthumb-phinf.pstatic.net/cover/091/895/09189544.jpg?type=m1','exist17@naver.com','8955378971 9788955378979','NEWTON HIGHLIGHT 지수.<b>로그</b>.벡터 (과학을 발전시킨 수학의 세계)','뉴턴코리아','일본',to_date('18/10/03','RR/MM/DD'));
Insert into SEORAK_MYBOOKLIST (MYLIST_NO,MYLIST_URL,MYLIST_IMG_URL,MEMBER_ID,ISBN,MYLIST_TITLE,MYLIST_PUBLISHER,MYLIST_AUTHOR,REG_DATE) values (9,'http://book.naver.com/bookdb/book_detail.php?bid=11023382','https://bookthumb-phinf.pstatic.net/cover/110/233/11023382.jpg?type=m1','seorakbooks@gmail.com','8904165598 9788904165599','<b>연탄길</b> 3','생명의말씀사','이철환',to_date('18/09/28','RR/MM/DD'));
Insert into SEORAK_MYBOOKLIST (MYLIST_NO,MYLIST_URL,MYLIST_IMG_URL,MEMBER_ID,ISBN,MYLIST_TITLE,MYLIST_PUBLISHER,MYLIST_AUTHOR,REG_DATE) values (10,'http://book.naver.com/bookdb/book_detail.php?bid=11023381','https://bookthumb-phinf.pstatic.net/cover/110/233/11023381.jpg?type=m1','seorakbooks@gmail.com','890416558X 9788904165582','<b>연탄길</b> 2','생명의말씀사','이철환',to_date('18/09/29','RR/MM/DD'));
Insert into SEORAK_MYBOOKLIST (MYLIST_NO,MYLIST_URL,MYLIST_IMG_URL,MEMBER_ID,ISBN,MYLIST_TITLE,MYLIST_PUBLISHER,MYLIST_AUTHOR,REG_DATE) values (21,'http://book.naver.com/bookdb/book_detail.php?bid=11023382','https://bookthumb-phinf.pstatic.net/cover/110/233/11023382.jpg?type=m1','seorakbooks@gmail.com','8904165598 9788904165599','<b>연탄길</b> 3','생명의말씀사','이철환',to_date('18/10/01','RR/MM/DD'));
Insert into SEORAK_MYBOOKLIST (MYLIST_NO,MYLIST_URL,MYLIST_IMG_URL,MEMBER_ID,ISBN,MYLIST_TITLE,MYLIST_PUBLISHER,MYLIST_AUTHOR,REG_DATE) values (26,'http://book.naver.com/bookdb/book_detail.php?bid=11658869','https://bookthumb-phinf.pstatic.net/cover/116/588/11658869.jpg?type=m1','dlopo123@naver.com','1157851401 9791157851409','<b>연탄</b>집','키다리','임정진',to_date('18/10/01','RR/MM/DD'));
Insert into SEORAK_MYBOOKLIST (MYLIST_NO,MYLIST_URL,MYLIST_IMG_URL,MEMBER_ID,ISBN,MYLIST_TITLE,MYLIST_PUBLISHER,MYLIST_AUTHOR,REG_DATE) values (72,'http://book.naver.com/bookdb/book_detail.php?bid=11023380','https://bookthumb-phinf.pstatic.net/cover/110/233/11023380.jpg?type=m1','exist17@naver.com','8904165571 9788904165575','<b>연탄길</b> 1 (상한 마음을 치유해주는 우리 이웃들의 가슴 따뜻한 실제 이야기)','생명의말씀사','이철환',to_date('18/10/04','RR/MM/DD'));
Insert into SEORAK_MYBOOKLIST (MYLIST_NO,MYLIST_URL,MYLIST_IMG_URL,MEMBER_ID,ISBN,MYLIST_TITLE,MYLIST_PUBLISHER,MYLIST_AUTHOR,REG_DATE) values (24,'http://book.naver.com/bookdb/book_detail.php?bid=13921159','https://bookthumb-phinf.pstatic.net/cover/139/211/13921159.jpg?type=m1','dlopo123@gmail.com','8934982551 9788934982555','나의 가족, <b>사랑</b>하나요?','주니어김영사','전이수',to_date('18/10/01','RR/MM/DD'));
Insert into SEORAK_MYBOOKLIST (MYLIST_NO,MYLIST_URL,MYLIST_IMG_URL,MEMBER_ID,ISBN,MYLIST_TITLE,MYLIST_PUBLISHER,MYLIST_AUTHOR,REG_DATE) values (44,'http://book.naver.com/bookdb/book_detail.php?bid=182437','https://bookthumb-phinf.pstatic.net/cover/001/824/00182437.jpg?type=m1','dlopo123@gmail.com','8970940197 9788970940199','<b>도깨비</b>를 빨아버린 우리엄마','한림출판사','사토',to_date('18/10/02','RR/MM/DD'));
commit;
REM INSERTING into SEORAK_POINT
SET DEFINE OFF;
Insert into SEORAK_POINT (MEMBER_ID,POINT_NO,POINT_UPDOWN,POINT_REG_DATE,POINT_REASON,POINT_EXCHANGE_ID) values ('seorakbooks@gmail.com',157,500,to_date('18/10/04','RR/MM/DD'),4,'출석');
Insert into SEORAK_POINT (MEMBER_ID,POINT_NO,POINT_UPDOWN,POINT_REG_DATE,POINT_REASON,POINT_EXCHANGE_ID) values ('dlopo123@gmail.com',158,500,to_date('18/10/04','RR/MM/DD'),4,'출석');
Insert into SEORAK_POINT (MEMBER_ID,POINT_NO,POINT_UPDOWN,POINT_REG_DATE,POINT_REASON,POINT_EXCHANGE_ID) values ('seorakbooks@gmail.com',175,-10,to_date('18/10/04','RR/MM/DD'),1,'curogom@gmail.com');
Insert into SEORAK_POINT (MEMBER_ID,POINT_NO,POINT_UPDOWN,POINT_REG_DATE,POINT_REASON,POINT_EXCHANGE_ID) values ('curogom@gmail.com',176,10,to_date('18/10/04','RR/MM/DD'),2,'seorakbooks@gmail.com');
Insert into SEORAK_POINT (MEMBER_ID,POINT_NO,POINT_UPDOWN,POINT_REG_DATE,POINT_REASON,POINT_EXCHANGE_ID) values ('dlopo123@gmail.com',161,-123456,to_date('18/10/04','RR/MM/DD'),1,'exist17@naver.com');
Insert into SEORAK_POINT (MEMBER_ID,POINT_NO,POINT_UPDOWN,POINT_REG_DATE,POINT_REASON,POINT_EXCHANGE_ID) values ('exist17@naver.com',162,123456,to_date('18/10/04','RR/MM/DD'),2,'dlopo123@gmail.com');
Insert into SEORAK_POINT (MEMBER_ID,POINT_NO,POINT_UPDOWN,POINT_REG_DATE,POINT_REASON,POINT_EXCHANGE_ID) values ('seorakbooks@gmail.com',163,-10,to_date('18/10/04','RR/MM/DD'),1,'exist17@naver.com');
Insert into SEORAK_POINT (MEMBER_ID,POINT_NO,POINT_UPDOWN,POINT_REG_DATE,POINT_REASON,POINT_EXCHANGE_ID) values ('dlopo123@gmail.com',159,-10,to_date('18/10/04','RR/MM/DD'),1,'exist17@naver.com');
Insert into SEORAK_POINT (MEMBER_ID,POINT_NO,POINT_UPDOWN,POINT_REG_DATE,POINT_REASON,POINT_EXCHANGE_ID) values ('exist17@naver.com',160,10,to_date('18/10/04','RR/MM/DD'),2,'dlopo123@gmail.com');
Insert into SEORAK_POINT (MEMBER_ID,POINT_NO,POINT_UPDOWN,POINT_REG_DATE,POINT_REASON,POINT_EXCHANGE_ID) values ('exist17@naver.com',164,10,to_date('18/10/04','RR/MM/DD'),2,'seorakbooks@gmail.com');
Insert into SEORAK_POINT (MEMBER_ID,POINT_NO,POINT_UPDOWN,POINT_REG_DATE,POINT_REASON,POINT_EXCHANGE_ID) values ('seorakbooks@gmail.com',165,-10,to_date('18/10/04','RR/MM/DD'),1,'exist17@naver.com');
Insert into SEORAK_POINT (MEMBER_ID,POINT_NO,POINT_UPDOWN,POINT_REG_DATE,POINT_REASON,POINT_EXCHANGE_ID) values ('exist17@naver.com',166,10,to_date('18/10/04','RR/MM/DD'),2,'seorakbooks@gmail.com');
Insert into SEORAK_POINT (MEMBER_ID,POINT_NO,POINT_UPDOWN,POINT_REG_DATE,POINT_REASON,POINT_EXCHANGE_ID) values ('seorakbooks@gmail.com',167,-10,to_date('18/10/04','RR/MM/DD'),1,'exist17@naver.com');
Insert into SEORAK_POINT (MEMBER_ID,POINT_NO,POINT_UPDOWN,POINT_REG_DATE,POINT_REASON,POINT_EXCHANGE_ID) values ('exist17@naver.com',168,10,to_date('18/10/04','RR/MM/DD'),2,'seorakbooks@gmail.com');
Insert into SEORAK_POINT (MEMBER_ID,POINT_NO,POINT_UPDOWN,POINT_REG_DATE,POINT_REASON,POINT_EXCHANGE_ID) values ('seorakbooks@gmail.com',169,-10,to_date('18/10/04','RR/MM/DD'),1,'exist17@naver.com');
Insert into SEORAK_POINT (MEMBER_ID,POINT_NO,POINT_UPDOWN,POINT_REG_DATE,POINT_REASON,POINT_EXCHANGE_ID) values ('exist17@naver.com',170,10,to_date('18/10/04','RR/MM/DD'),2,'seorakbooks@gmail.com');
Insert into SEORAK_POINT (MEMBER_ID,POINT_NO,POINT_UPDOWN,POINT_REG_DATE,POINT_REASON,POINT_EXCHANGE_ID) values ('seorakbooks@gmail.com',171,-10,to_date('18/10/04','RR/MM/DD'),1,'exist17@naver.com');
Insert into SEORAK_POINT (MEMBER_ID,POINT_NO,POINT_UPDOWN,POINT_REG_DATE,POINT_REASON,POINT_EXCHANGE_ID) values ('exist17@naver.com',172,10,to_date('18/10/04','RR/MM/DD'),2,'seorakbooks@gmail.com');
Insert into SEORAK_POINT (MEMBER_ID,POINT_NO,POINT_UPDOWN,POINT_REG_DATE,POINT_REASON,POINT_EXCHANGE_ID) values ('seorakbooks@gmail.com',173,-10,to_date('18/10/04','RR/MM/DD'),1,'exist17@naver.com');
Insert into SEORAK_POINT (MEMBER_ID,POINT_NO,POINT_UPDOWN,POINT_REG_DATE,POINT_REASON,POINT_EXCHANGE_ID) values ('exist17@naver.com',174,10,to_date('18/10/04','RR/MM/DD'),2,'seorakbooks@gmail.com');
commit;
REM INSERTING into SEORAK_RANKINGPOINT
SET DEFINE OFF;
REM INSERTING into SEORAK_RANKING_BOOKINFO
SET DEFINE OFF;
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791187498063','혜민 스님의 따뜻한 응원 (스프링) - 365일 마음 달력','혜민 지음, 이영철 그림','수오서재','http://image.aladin.co.kr/product/9858/80/coversum/k952535356_1.jpg',to_date('16/12/20','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788901223032','하마터면 열심히 살 뻔했다','하완 지음','웅진지식하우스','http://image.aladin.co.kr/product/14231/53/coversum/8901223031_1.jpg',to_date('18/04/23','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788936476694','나의 문화유산답사기 : 산사 순례','유홍준 지음','창비','http://image.aladin.co.kr/product/16237/48/coversum/8936476696_1.jpg',to_date('18/08/24','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791160401967','슬픔을 공부하는 슬픔','신형철 지음','한겨레출판','http://image.aladin.co.kr/product/16234/14/coversum/k322534566_1.jpg',to_date('18/09/22','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791133491155','하이큐!! 32 - 하켄','후루다테 하루이치 지음','대원씨아이(만화)','http://image.aladin.co.kr/product/16886/45/coversum/k362534076_1.jpg',to_date('18/09/20','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788932919171','장미의 이름 (리커버 특별판, 양장)','움베르토 에코 지음, 이윤기 옮김','열린책들','http://image.aladin.co.kr/product/16263/65/coversum/k412534269_1.jpg',to_date('18/07/25','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788932319377','치아문단순적소미호 1','자오첸첸 지음, 남혜선 옮김','달다','http://image.aladin.co.kr/product/16848/51/coversum/8932319375_1.jpg',to_date('18/09/20','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788932319384','치아문단순적소미호 2','자오첸첸 지음, 남혜선 옮김','달다','http://image.aladin.co.kr/product/16848/55/coversum/8932319383_1.jpg',to_date('18/09/20','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791133487936','원펀맨 One Punch Man 17 - 대머리 망토라서?','무라타 유스케 그림, ONE 글','대원씨아이(만화)','http://image.aladin.co.kr/product/16817/18/coversum/k032534663_1.jpg',to_date('18/09/13','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791161319728','2019 선재국어 기출실록 - 전3권 - 7.9급 공무원 시험 대비','이선재 지음','(주)에스티유니타스','http://image.aladin.co.kr/product/16721/57/coversum/k642534460_1.jpg',to_date('18/09/15','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791130618937','연애의 기억','줄리언 반스 지음, 정영목 옮김','다산책방','http://image.aladin.co.kr/product/16598/57/coversum/k962533053_1.jpg',to_date('18/08/30','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788965962830','골든아워 2 - 생과 사의 경계, 중증외상센터의 기록 2013-2018','이국종 지음','흐름출판','http://image.aladin.co.kr/product/16891/58/coversum/8965962838_2.jpg',to_date('18/10/02','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788972916710','존재의 세 가지 거짓말 (리커버 특별판, 양장)','아고타 크리스토프 지음, 용경식 옮김','까치','http://image.aladin.co.kr/product/16336/61/coversum/8972916714_1.jpg',to_date('18/08/01','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791195888221','죄의 목소리','시오타 타케시 지음, 임희선 옮김','비앤엘(BNL)','http://image.aladin.co.kr/product/13508/6/coversum/k612532605_1.jpg',to_date('18/03/02','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788972758990','매스커레이드 나이트','히가시노 게이고 지음, 양윤옥 옮김','현대문학','http://image.aladin.co.kr/product/16497/13/coversum/897275899x_2.jpg',to_date('18/08/30','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791158160807','한때 소중했던 것들','이기주 지음','달','http://image.aladin.co.kr/product/15219/50/coversum/k272533662_3.jpg',to_date('18/07/10','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791195888207','이웃집 커플','샤리 라피나 지음, 장선하 옮김','비앤엘(BNL)','http://image.aladin.co.kr/product/9751/60/coversum/k972535448_1.jpg',to_date('16/11/22','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791162207550','곁에 남아 있는 사람','임경선 지음','위즈덤하우스','http://image.aladin.co.kr/product/16234/14/coversum/k762533054_1.jpg',to_date('18/09/05','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788965132288','어떻게 살 것인가 - 힐링에서 스탠딩으로!','유시민 지음','생각의길','http://image.aladin.co.kr/product/2398/18/coversum/8965132282_2.jpg',to_date('13/03/13','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788963722771','아흔일곱 번의 봄여름가을겨울','이옥남 지음','양철북','http://image.aladin.co.kr/product/15569/75/coversum/8963722775_2.jpg',to_date('18/08/16','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791162337486','시크:하다 - 이기적이어서 행복한 프랑스 소확행 인문학 관찰 에세이','조승연 지음','와이즈베리','http://image.aladin.co.kr/product/16012/37/coversum/k942533749_2.jpg',to_date('18/08/20','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788925564289','나는 오늘도 경제적 자유를 꿈꾼다 - 3년 만에 월세 1,000만 원 만든 투자 철칙','청울림 지음','알에이치코리아(RHK)','http://image.aladin.co.kr/product/15566/59/coversum/8925564289_1.jpg',to_date('18/07/19','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788932919126','고양이 1 (리커버 특별판)','베르나르 베르베르 지음, 전미연 옮김','열린책들','http://image.aladin.co.kr/product/16597/75/coversum/k312533051_1.jpg',to_date('18/05/30','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791162202913','모든 순간이 너였다 - 반짝반짝 빛나던 우리의 밤을, 꿈을, 사랑을 이야기하다','하태완 지음','위즈덤하우스','http://image.aladin.co.kr/product/13377/98/coversum/k152532104_3.jpg',to_date('18/02/16','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788950977405','Go Go 카카오프렌즈 4 : 미국 - 세계 역사 문화 체험 학습만화','김미영 지음, 김정한 그림','아울북','http://image.aladin.co.kr/product/16831/53/coversum/8950977400_1.jpg',to_date('18/09/27','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788925563770','11문자 살인사건','히가시노 게이고 지음, 민경욱 옮김','알에이치코리아(RHK)','http://image.aladin.co.kr/product/15645/53/coversum/8925563770_1.jpg',to_date('18/07/13','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788957369364','무례한 사람에게 웃으며 대처하는 법 - 인생자체는 긍정적으로, 개소리에는 단호하게!','정문정 지음','가나출판사','http://image.aladin.co.kr/product/12769/86/coversum/8957369368_1.jpg',to_date('18/01/08','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788952793591','임플란트 전쟁 - 본격치과담합리얼스릴러','고광욱 지음','지식너머','http://image.aladin.co.kr/product/16580/44/coversum/8952793595_1.jpg',to_date('18/08/30','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788925564210','앨리스, 너만의 길을 그려봐 - 아직 세상에 참 서툰 우리에게','이상한 나라의 앨리스 원작','알에이치코리아(RHK)','http://image.aladin.co.kr/product/15623/88/coversum/8925564211_1.jpg',to_date('18/07/20','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788925563367','곰돌이 푸, 서두르지 않아도 괜찮아 - 언제나 오늘이 처음인 우리에게','곰돌이 푸 원작','알에이치코리아(RHK)','http://image.aladin.co.kr/product/14413/12/coversum/8925563363_1.jpg',to_date('18/05/08','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791186757093','자존감 수업 - 하루에 하나, 나를 사랑하게 되는 자존감 회복 훈련','윤홍균 지음','심플라이프','http://image.aladin.co.kr/product/8679/31/coversum/k372535696_1.jpg',to_date('16/08/25','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791186665503','말투 하나 바꿨을 뿐인데 (리커버 한정판) - 일, 사랑, 관계가 술술 풀리는 40가지 심리 기술','나이토 요시히토 지음, 김한나 옮김','유노북스','http://image.aladin.co.kr/product/16451/64/coversum/k682533750_1.jpg',to_date('17/03/10','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791186137765','우리 함께하는 지금이 봄날 (표지 2종 중 랜덤 발송) - 방탄소년단, 꿈과 사랑의 여정','카라 J. 스티븐즈 지음, 권기대 옮김','베가북스','http://image.aladin.co.kr/product/16551/31/coversum/s262533958_2.jpg',to_date('18/09/14','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791161650401','여행영어 100일의 기적 - 해외여행 준비 D-100 프로젝트','문성현 지음','넥서스','http://image.aladin.co.kr/product/11100/26/coversum/k002531575_1.jpg',to_date('17/06/15','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('8809482280113','손글씨 교정 노트 바르다 - 악필에서 벗어나는 한글 펜글씨 교본','42미디어컨텐츠 편집부 엮음','42미디어콘텐츠','http://image.aladin.co.kr/product/8473/4/coversum/k722535367_1.jpg',to_date('16/05/30','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791185992747','과정중심평가란 무엇인가','강대일.정창규 지음','에듀니티','http://image.aladin.co.kr/product/13221/58/coversum/k192532698_1.jpg',to_date('18/02/09','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788997206575','핵심 역량을 키우는 수업 놀이','나승빈 지음','맘에드림','http://image.aladin.co.kr/product/11477/92/coversum/8997206575_1.jpg',to_date('17/08/17','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788969651181','해커스 HMAT 현대자동차그룹 직무적성검사 1주 합격 (2018년 하반기 최신판) - 최신기출유형 + 실전모의고사 한 권으로 단기 완성!｜현대자동차그룹 인적성검사 합격 가이드 및 모의테스트 수록','해커스 취업교육연구소 엮음','챔프스터디','http://image.aladin.co.kr/product/16230/10/coversum/8969651187_1.jpg',to_date('18/08/13','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791161315775','전한길 한국사 합격생 필기노트+빵꾸노트(2019)',null,null,'http://image.aladin.co.kr/product/15751/69/coversum/scm3058846504846.jpg',to_date('18/01/01','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788954652865','알려지지 않은 예술가의 눈물과 자이툰 파스타','박상영 지음','문학동네','http://image.aladin.co.kr/product/16636/56/coversum/8954652867_1.jpg',to_date('18/09/07','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788925564647','미키 마우스, 오늘부터 멋진 인생이 시작될 거야 - 작은 용기가 필요한 당신에게','미키 마우스 원작','알에이치코리아(RHK)','http://image.aladin.co.kr/product/16730/21/coversum/8925564645_1.jpg',to_date('18/09/13','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788926379752','쿠키런 어드벤처 29 : 타이베이','송도수 지음, 서정은 그림','서울문화사','http://image.aladin.co.kr/product/16867/55/coversum/8926379752_1.jpg',to_date('18/09/25','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791162335123','추리 천재 엉덩이 탐정 6 - 수상한 탐정 사무소 사건','트롤 글.그림, 김정화 옮김','아이세움','http://image.aladin.co.kr/product/14334/2/coversum/k272532049_1.jpg',to_date('18/05/30','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788968331831','행복해지는 연습을 해요 - 덜 신경 쓰고, 더 사랑하는 법','전승환 지음','허밍버드','http://image.aladin.co.kr/product/15135/31/coversum/8968331839_1.jpg',to_date('18/06/20','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791195291885','너의 우주를 받아든 손','최준렬 지음','소울앤북','http://image.aladin.co.kr/product/16932/40/coversum/k602534370_1.jpg',to_date('18/09/10','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788934927686','이원복 교수의 와인의 세계, 세계의 와인 1 - 와인의 세계','이원복 글.그림','김영사','http://image.aladin.co.kr/product/102/51/coversum/8934927682_2.jpg',to_date('07/12/24','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791195277964','내 자녀에게 성을 이야기할 때 - 내 자녀를 위한 올바른 성교육 지침서','스탠 존스 외 지음, 정현주 옮김','소원나무','http://image.aladin.co.kr/product/5414/98/coversum/6000816679_2.jpg',to_date('15/02/25','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788965421832','해커스 토익 기출 보카 - 최신기출 토익 단어.점수대별 어휘수록|영단어 암기어플, 단어시험 생성기, 무료 실전문제 10회분, MP3 제공','데이빗 조 (David Cho) 지음','해커스어학연구소(Hackers)','http://image.aladin.co.kr/product/8340/50/coversum/s122533538_1.jpg',to_date('16/05/09','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788933870693','설민석의 조선왕조실록 - 대한민국이 선택한 역사 이야기','설민석 지음, 최준석 그림','세계사','http://image.aladin.co.kr/product/8749/45/coversum/8933870695_3.jpg',to_date('16/07/25','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('8809226729434','뽀로로 영어 동요 사운드 카드','키즈아이콘 편집부 지음','키즈아이콘(아이코닉스)','http://image.aladin.co.kr/product/14322/88/coversum/k952532949_1.jpg',to_date('18/04/25','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791196415228','운을 부르는 부자의 말투 - 말과 운의 관계를 알면 인생이 바뀐다','미야모토 마유미 지음, 김지윤 옮김','포레스트북스','http://image.aladin.co.kr/product/16081/85/coversum/s042533847_1.jpg',to_date('18/08/13','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791156755272','데뷔의 순간 - 영화감독 17인이 들려주는 나의 청춘 분투기','한국영화감독조합 지음, 주성철 엮음','푸른숲','http://image.aladin.co.kr/product/4906/87/coversum/1156755271_1.jpg',to_date('14/11/18','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788984457287','위대한 영화감독들 A To Z','앤디 튜이 그림, 매트 글라스비 글, 유안나 옮김','시그마북스','http://image.aladin.co.kr/product/7236/88/coversum/8984457280_1.jpg',to_date('16/01/20','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791188007134','엄마의 말하기 연습 - 화내지 않고 상처 주지 않고 진심을 전하는','박재연 지음','한빛라이프','http://image.aladin.co.kr/product/13536/68/coversum/k642532819_1.jpg',to_date('18/02/26','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791189199029','일본식 집밥 레시피 100 - 재료 손질부터 인기 반찬까지 소소하고 정갈한','세오 유키코 지음, 윤경희 옮김','시그마북스','http://image.aladin.co.kr/product/14968/68/coversum/k682533966_1.jpg',to_date('18/06/15','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788959974306','능률 롱맨 영한사전','Pearson Longman 편집부 엮음','Pearson Longman','http://image.aladin.co.kr/product/582/52/coversum/8959974307_1.jpg',to_date('10/07/09','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788932881263','성경의 권위','존 스토트 지음','IVP','http://image.aladin.co.kr/product/1292/77/coversum/893288126x_1.jpg',to_date('11/04/20','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791185446462','검사의 삼국지 - 어제에 묻고, 내일에 답하다','양중진 지음','티핑포인트','http://image.aladin.co.kr/product/15739/85/coversum/k052533231_1.jpg',to_date('18/07/20','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791186610749','초등학생을 위한 표준 한국어 익힘책 1','국립국어원 엮음','하우출판사','http://image.aladin.co.kr/product/9451/86/coversum/k912535529_1.jpg',to_date('16/10/21','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788954641630','쇼코의 미소','최은영 지음','문학동네','http://image.aladin.co.kr/product/8679/95/coversum/8954641636_1.jpg',to_date('16/07/07','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788960213807','청진기 가라사대','김연종 지음','천년의시작','http://image.aladin.co.kr/product/15837/73/coversum/8960213802_1.jpg',to_date('18/07/23','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788955180664','아자아자 한국어 1 - 이주 노동자를 위한','국립국어원 기획, 허용.김재욱.허경행 지음','한글파크','http://image.aladin.co.kr/product/2334/98/coversum/8955180667_2.jpg',to_date('12/12/28','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791196394509','죽고 싶지만 떡볶이는 먹고 싶어','백세희 지음','흔','http://image.aladin.co.kr/product/15136/29/coversum/k962533360_1.jpg',to_date('18/06/20','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788998274795','돌이킬 수 없는 약속','야쿠마루 가쿠 지음, 김성미 옮김','북플라자','http://image.aladin.co.kr/product/10174/56/coversum/s572533950_1.jpg',to_date('17/02/02','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791160560510','열두 발자국 - 생각의 모험으로 지성의 숲으로 지도 밖의 세계로 이끄는 열두 번의 강의','정재승 지음','어크로스','http://image.aladin.co.kr/product/15072/28/coversum/k072533160_1.jpg',to_date('18/07/02','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791187310129','하버드 협상 강의 - 하버드는 왜 협상에 주목할까?','하버드 공개강의연구회 지음, 송은진 옮김','북아지트','http://image.aladin.co.kr/product/16751/61/coversum/k142534567_1.jpg',to_date('18/09/03','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788934982975','21세기를 위한 21가지 제언 - 더 나은 오늘은 어떻게 가능한가','유발 하라리 지음, 전병근 옮김','김영사','http://image.aladin.co.kr/product/16234/14/coversum/8934982977_1.jpg',to_date('18/09/03','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788971998557','역사의 역사 - History of Writing History','유시민 지음','돌베개','http://image.aladin.co.kr/product/14944/52/coversum/8971998555_2.jpg',to_date('18/06/25','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791195906840','당신이 허락한다면 나는 이 말 하고 싶어요 - 김제동의 헌법 독후감','김제동 지음','나무의마음','http://image.aladin.co.kr/product/16316/0/coversum/k762533341_2.jpg',to_date('18/09/05','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791129489159','뼈 있는 아무 말 대잔치 - 이왕이면 뼈 있는 아무 말을 나눠야 한다','신영준.고영성 지음','로크미디어','http://image.aladin.co.kr/product/16832/2/coversum/k372534778_1.jpg',to_date('18/09/13','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791187119845','나는 나로 살기로 했다 (100쇄 기념 스페셜 에디션, 양장)','김수현 지음','마음의숲','http://image.aladin.co.kr/product/16751/86/coversum/k642534567_2.jpg',to_date('16/11/25','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788965706908','초격차 - 넘볼 수 없는 차이를 만드는 격','권오현 지음, 김상근 정리','쌤앤파커스','http://image.aladin.co.kr/product/16628/32/coversum/8965706904_1.jpg',to_date('18/09/10','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791186560785','수학이 필요한 순간 - 인간은 얼마나 깊게 생각할 수 있는가','김민형 지음','인플루엔셜(주)','http://image.aladin.co.kr/product/15892/11/coversum/s802533642_1.jpg',to_date('18/08/03','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791188874217','설민석의 한국사 대모험 8 - 위기 극복 편 : 온달, 두 마리 토끼를 잡아라!','설민석.스토리박스 지음, 정현희 그림, 태건 역사 연구소 감수','아이휴먼','http://image.aladin.co.kr/product/16868/13/coversum/k532534979_1.jpg',to_date('18/10/24','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791162540381','10년 동안 적금밖에 모르던 39세 김 과장은 어떻게 1년 만에 부동산 천재가 됐을까? - 5년 만에 자산을 100배로 불린 투자고수 렘군의 단기속성 부동산 스쿨','김재수(렘군) 지음','비즈니스북스','http://image.aladin.co.kr/product/16639/21/coversum/k442534369_1.jpg',to_date('18/09/15','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788965746614','해리 1','공지영 지음','해냄','http://image.aladin.co.kr/product/15762/65/coversum/8965746612_1.jpg',to_date('18/07/30','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791157842858','퇴근길 인문학 수업 : 멈춤','백상경제연구원 지음','한빛비즈','http://image.aladin.co.kr/product/16234/14/coversum/k972534560_2.jpg',to_date('18/09/15','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791195522125','언어의 온도 (반양장)','이기주 지음','말글터','http://image.aladin.co.kr/product/14842/6/coversum/k742532452_1.jpg',to_date('16/08/19','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788925563350','곰돌이 푸, 행복한 일은 매일 있어 - 아직 행복을 기다리는 우리에게','곰돌이 푸 원작','알에이치코리아(RHK)','http://image.aladin.co.kr/product/13559/25/coversum/8925563355_1.jpg',to_date('18/03/12','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788937473135','82년생 김지영 (인터파크 리커버 특별판)','조남주 지음','민음사','http://image.aladin.co.kr/product/15166/8/coversum/k782533669_2.jpg',to_date('16/10/14','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788994702346','부의 추월차선 - 부자들이 말해 주지 않는 진정한 부를 얻는 방법','엠제이 드마코 지음, 신소영 옮김','토트','http://image.aladin.co.kr/product/3036/43/coversum/8994702342_1.jpg',to_date('13/08/20','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788950975913','굿 라이프 - 내 삶을 바꾸는 심리학의 지혜','최인철 지음','21세기북스','http://image.aladin.co.kr/product/15149/28/coversum/8950975912_1.jpg',to_date('18/06/20','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788934972464','사피엔스 - 유인원에서 사이보그까지, 인간 역사의 대담하고 위대한 질문','유발 하라리 지음, 조현욱 옮김, 이태수 감수','김영사','http://image.aladin.co.kr/product/5686/87/coversum/s702536164_1.jpg',to_date('15/11/23','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791159496875','에듀윌 한국사 능력 검정시험 2주끝장 고급 3.0 - 최신 3개년 기출문제 전 문항 분석 정리, 14강 압축팩 강의 제공, 특별부록 [키워드연표 + 키워드노트 + 플래너], 개정판','한국사기출연구회 엮음','에듀윌','http://image.aladin.co.kr/product/14013/76/coversum/k142532931_2.jpg',to_date('18/04/12','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788965962823','골든아워 1 - 생과 사의 경계, 중증외상센터의 기록 2002-2013','이국종 지음','흐름출판','http://image.aladin.co.kr/product/16891/57/coversum/896596282x_1.jpg',to_date('18/10/02','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788968331862','방구석 미술관 - 가볍고 편하게 시작하는 유쾌한 교양 미술','조원재 지음','블랙피쉬','http://image.aladin.co.kr/product/16076/44/coversum/8968331863_1.jpg',to_date('18/08/03','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791195603282','예뿍이의 종이구관 - 종이인형보다 더 재미있는 종이구체관절인형','예뿍 지음','우철','http://image.aladin.co.kr/product/16730/43/coversum/k472534569_1.jpg',to_date('18/08/31','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788990982728','살인의 문 1','히가시노 게이고 지음, 이혁재 옮김','재인','http://image.aladin.co.kr/product/16439/1/coversum/8990982723_1.jpg',to_date('18/08/31','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788950976514','오늘처럼 내가 싫었던 날은 없다 - 무너진 자존감을 일으켜줄 글배우의 마음 수업','글배우 지음','21세기북스','http://image.aladin.co.kr/product/16628/26/coversum/895097651x_1.jpg',to_date('18/09/07','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9791186686348','인생 우화','류시화 지음, 블라디미르 루바로프 그림','연금술사','http://image.aladin.co.kr/product/15646/54/coversum/k512533937_1.jpg',to_date('18/07/30','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788969651198','2018 하반기 해커스 GSAT 삼성직무적성검사 실전모의고사 - 2018 하반기 채용 대비 : GSAT 삼성그룹 직무적성검사｜서류/인적성/면접 모두 대비 가능ㅣ상반기 최신기출문제 수록','해커스잡 취업교육연구소 지음','챔프스터디','http://image.aladin.co.kr/product/16145/15/coversum/8969651195_1.jpg',to_date('18/08/16','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788972756194','나미야 잡화점의 기적 (100만 부 기념 특별 한정판)','히가시노 게이고 지음, 양윤옥 옮김','현대문학','http://image.aladin.co.kr/product/15848/6/coversum/k622533431_1.jpg',to_date('18/07/27','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788990982735','살인의 문 2','히가시노 게이고 지음, 이혁재 옮김','재인','http://image.aladin.co.kr/product/16439/6/coversum/8990982731_3.jpg',to_date('18/08/31','RR/MM/DD'));
Insert into SEORAK_RANKING_BOOKINFO (ISBN,BOOK_TITLE,BOOK_AUTHOR,BOOK_PUBLISHER,BOOK_IMG,BOOK_PUBDATE) values ('9788969651167','2018 해커스 GSAT 삼성직무적성검사 최신기출유형 - 2018 하반기 채용 대비 : GSAT 삼성그룹 직무적성검사｜서류/인적성/면접 모두 대비 가능ㅣ상반기 최신기출문제 수록','해커스 취업교육연구소 지음','챔프스터디','http://image.aladin.co.kr/product/15642/97/coversum/8969651160_1.jpg',to_date('18/07/25','RR/MM/DD'));
commit;
REM INSERTING into SEORAK_RANKING_RANKING
SET DEFINE OFF;
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,18,null,'2019 선재국어 기출실록 - 전3권 - 7.9급 공무원 시험 대비','9791161319728');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,19,null,'당신이 허락한다면 나는 이 말 하고 싶어요 - 김제동의 헌법 독후감','9791195906840');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,20,null,'알려지지 않은 예술가의 눈물과 자이툰 파스타','9788954652865');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,21,null,'나미야 잡화점의 기적 (100만 부 기념 특별 한정판)','9788972756194');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,22,null,'존재의 세 가지 거짓말 (리커버 특별판, 양장)','9788972916710');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,23,null,'초격차 - 넘볼 수 없는 차이를 만드는 격','9788965706908');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,24,null,'나의 문화유산답사기 : 산사 순례','9788936476694');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,25,null,'원펀맨 One Punch Man 17 - 대머리 망토라서?','9791133487936');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,1,'죽고 싶지만 떡볶이는 먹고 싶어','9791196394509');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,2,'돌이킬 수 없는 약속','9788998274795');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,3,'21세기를 위한 21가지 제언 - 더 나은 오늘은 어떻게 가능한가','9788934982975');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,4,'인생 우화','9791186686348');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,5,'뼈 있는 아무 말 대잔치 - 이왕이면 뼈 있는 아무 말을 나눠야 한다','9791129489159');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,6,'초격차 - 넘볼 수 없는 차이를 만드는 격','9788965706908');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,7,'언어의 온도 (반양장)','9791195522125');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,8,'열두 발자국 - 생각의 모험으로 지성의 숲으로 지도 밖의 세계로 이끄는 열두 번의 강의','9791160560510');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,9,'죄의 목소리','9791195888221');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,10,'역사의 역사 - History of Writing History','9788971998557');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,11,'미키 마우스, 오늘부터 멋진 인생이 시작될 거야 - 작은 용기가 필요한 당신에게','9788925564647');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,12,'곁에 남아 있는 사람','9791162207550');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,13,'당신이 허락한다면 나는 이 말 하고 싶어요 - 김제동의 헌법 독후감','9791195906840');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,14,'나는 나로 살기로 했다 (100쇄 기념 스페셜 에디션, 양장)','9791187119845');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,15,'곰돌이 푸, 행복한 일은 매일 있어 - 아직 행복을 기다리는 우리에게','9788925563350');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,16,'82년생 김지영 (인터파크 리커버 특별판)','9788937473135');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,17,'사피엔스 - 유인원에서 사이보그까지, 인간 역사의 대담하고 위대한 질문','9788934972464');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,18,'나의 문화유산답사기 : 산사 순례','9788936476694');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,19,'어떻게 살 것인가 - 힐링에서 스탠딩으로!','9788965132288');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,20,'쿠키런 어드벤처 29 : 타이베이','9788926379752');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,21,'나는 오늘도 경제적 자유를 꿈꾼다 - 3년 만에 월세 1,000만 원 만든 투자 철칙','9788925564289');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,22,'매스커레이드 나이트','9788972758990');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,23,'추리 천재 엉덩이 탐정 6 - 수상한 탐정 사무소 사건','9791162335123');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,24,'행복해지는 연습을 해요 - 덜 신경 쓰고, 더 사랑하는 법','9788968331831');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,null,25,'나미야 잡화점의 기적 (100만 부 기념 특별 한정판)','9788972756194');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,1,null,null,'죽고 싶지만 떡볶이는 먹고 싶어','9791196394509');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,2,null,null,'돌이킬 수 없는 약속','9788998274795');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,3,null,null,'열두 발자국 - 생각의 모험으로 지성의 숲으로 지도 밖의 세계로 이끄는 열두 번의 강의','9791160560510');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,4,null,null,'하버드 협상 강의 - 하버드는 왜 협상에 주목할까?','9791187310129');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,5,null,null,'21세기를 위한 21가지 제언 - 더 나은 오늘은 어떻게 가능한가','9788934982975');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,6,null,null,'역사의 역사 - History of Writing History','9788971998557');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,7,null,null,'당신이 허락한다면 나는 이 말 하고 싶어요 - 김제동의 헌법 독후감','9791195906840');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,8,null,null,'뼈 있는 아무 말 대잔치 - 이왕이면 뼈 있는 아무 말을 나눠야 한다','9791129489159');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,9,null,null,'나는 나로 살기로 했다 (100쇄 기념 스페셜 에디션, 양장)','9791187119845');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,10,null,null,'초격차 - 넘볼 수 없는 차이를 만드는 격','9788965706908');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,11,null,null,'수학이 필요한 순간 - 인간은 얼마나 깊게 생각할 수 있는가','9791186560785');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,12,null,null,'설민석의 한국사 대모험 8 - 위기 극복 편 : 온달, 두 마리 토끼를 잡아라!','9791188874217');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,13,null,null,'10년 동안 적금밖에 모르던 39세 김 과장은 어떻게 1년 만에 부동산 천재가 됐을까? - 5년 만에 자산을 100배로 불린 투자고수 렘군의 단기속성 부동산 스쿨','9791162540381');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,14,null,null,'해리 1','9788965746614');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,15,null,null,'퇴근길 인문학 수업 : 멈춤','9791157842858');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,16,null,null,'언어의 온도 (반양장)','9791195522125');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,17,null,null,'곰돌이 푸, 행복한 일은 매일 있어 - 아직 행복을 기다리는 우리에게','9788925563350');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,18,null,null,'82년생 김지영 (인터파크 리커버 특별판)','9788937473135');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,19,null,null,'부의 추월차선 - 부자들이 말해 주지 않는 진정한 부를 얻는 방법','9788994702346');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,20,null,null,'굿 라이프 - 내 삶을 바꾸는 심리학의 지혜','9788950975913');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,21,null,null,'사피엔스 - 유인원에서 사이보그까지, 인간 역사의 대담하고 위대한 질문','9788934972464');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,22,null,null,'에듀윌 한국사 능력 검정시험 2주끝장 고급 3.0 - 최신 3개년 기출문제 전 문항 분석 정리, 14강 압축팩 강의 제공, 특별부록 [키워드연표 + 키워드노트 + 플래너], 개정판','9791159496875');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,23,null,null,'골든아워 1 - 생과 사의 경계, 중증외상센터의 기록 2002-2013','9788965962823');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,24,null,null,'방구석 미술관 - 가볍고 편하게 시작하는 유쾌한 교양 미술','9788968331862');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,25,null,null,'예뿍이의 종이구관 - 종이인형보다 더 재미있는 종이구체관절인형','9791195603282');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),1,null,null,null,'죽고 싶지만 떡볶이는 먹고 싶어','9791196394509');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),2,null,null,null,'곰돌이 푸, 행복한 일은 매일 있어 - 아직 행복을 기다리는 우리에게','9788925563350');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),3,null,null,null,'21세기를 위한 21가지 제언 - 더 나은 오늘은 어떻게 가능한가','9788934982975');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),4,null,null,null,'돌이킬 수 없는 약속','9788998274795');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),5,null,null,null,'초격차 - 넘볼 수 없는 차이를 만드는 격','9788965706908');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),6,null,null,null,'뼈 있는 아무 말 대잔치 - 이왕이면 뼈 있는 아무 말을 나눠야 한다','9791129489159');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),7,null,null,null,'나는 나로 살기로 했다 (100쇄 기념 스페셜 에디션, 양장)','9791187119845');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),8,null,null,null,'역사의 역사 - History of Writing History','9788971998557');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),9,null,null,null,'열두 발자국 - 생각의 모험으로 지성의 숲으로 지도 밖의 세계로 이끄는 열두 번의 강의','9791160560510');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),10,null,null,null,'해리 1','9788965746614');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),11,null,null,null,'살인의 문 1','9788990982728');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),12,null,null,null,'언어의 온도 (반양장)','9791195522125');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),13,null,null,null,'해커스 HMAT 현대자동차그룹 직무적성검사 1주 합격 (2018년 하반기 최신판) - 최신기출유형 + 실전모의고사 한 권으로 단기 완성!｜현대자동차그룹 인적성검사 합격 가이드 및 모의테스트 수록','9788969651181');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),14,null,null,null,'오늘처럼 내가 싫었던 날은 없다 - 무너진 자존감을 일으켜줄 글배우의 마음 수업','9788950976514');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),15,null,null,null,'82년생 김지영 (인터파크 리커버 특별판)','9788937473135');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),16,null,null,null,'10년 동안 적금밖에 모르던 39세 김 과장은 어떻게 1년 만에 부동산 천재가 됐을까? - 5년 만에 자산을 100배로 불린 투자고수 렘군의 단기속성 부동산 스쿨','9791162540381');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),17,null,null,null,'나미야 잡화점의 기적 (100만 부 기념 특별 한정판)','9788972756194');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),18,null,null,null,'인생 우화','9791186686348');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),19,null,null,null,'살인의 문 2','9788990982735');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),20,null,null,null,'2018 하반기 해커스 GSAT 삼성직무적성검사 실전모의고사 - 2018 하반기 채용 대비 : GSAT 삼성그룹 직무적성검사｜서류/인적성/면접 모두 대비 가능ㅣ상반기 최신기출문제 수록','9788969651198');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),21,null,null,null,'하마터면 열심히 살 뻔했다','9788901223032');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),22,null,null,null,'굿 라이프 - 내 삶을 바꾸는 심리학의 지혜','9788950975913');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),23,null,null,null,'수학이 필요한 순간 - 인간은 얼마나 깊게 생각할 수 있는가','9791186560785');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),24,null,null,null,'사피엔스 - 유인원에서 사이보그까지, 인간 역사의 대담하고 위대한 질문','9788934972464');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),25,null,null,null,'골든아워 1 - 생과 사의 경계, 중증외상센터의 기록 2002-2013','9788965962823');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,1,null,'슬픔을 공부하는 슬픔','9791160401967');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,2,null,'골든아워 1 - 생과 사의 경계, 중증외상센터의 기록 2002-2013','9788965962823');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,3,null,'골든아워 2 - 생과 사의 경계, 중증외상센터의 기록 2013-2018','9788965962830');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,4,null,'역사의 역사 - History of Writing History','9788971998557');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,5,null,'21세기를 위한 21가지 제언 - 더 나은 오늘은 어떻게 가능한가','9788934982975');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,6,null,'열두 발자국 - 생각의 모험으로 지성의 숲으로 지도 밖의 세계로 이끄는 열두 번의 강의','9791160560510');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,7,null,'죽고 싶지만 떡볶이는 먹고 싶어','9791196394509');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,9,null,'하이큐!! 32 - 하켄','9791133491155');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,10,null,'돌이킬 수 없는 약속','9788998274795');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,11,null,'뼈 있는 아무 말 대잔치 - 이왕이면 뼈 있는 아무 말을 나눠야 한다','9791129489159');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,12,null,'장미의 이름 (리커버 특별판, 양장)','9788932919171');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,13,null,'82년생 김지영 (인터파크 리커버 특별판)','9788937473135');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,14,null,'나는 나로 살기로 했다 (100쇄 기념 스페셜 에디션, 양장)','9791187119845');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,15,null,'전한길 한국사 합격생 필기노트+빵꾸노트(2019)','9791161315775');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,16,null,'수학이 필요한 순간 - 인간은 얼마나 깊게 생각할 수 있는가','9791186560785');
Insert into SEORAK_RANKING_RANKING (BESTSELLER_WEEK,KYOBO_RANK,YES24_RANK,ALADDIN_RANK,BANDI_RANK,BOOK_TITLE,ISBN) values (to_date('18/10/03','RR/MM/DD'),null,null,17,null,'사피엔스 - 유인원에서 사이보그까지, 인간 역사의 대담하고 위대한 질문','9788934972464');
commit;
REM INSERTING into SEORAK_SEARCH
SET DEFINE OFF;
