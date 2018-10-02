 CREATE TABLE seorak_search(
 search_no NUMBER not null PRIMARY key,
 search_id VARCHAR2(50) not null,
 keyword VARCHAR2(250) not null,
 search_time DATE not null
 );
 
 create sequence s_seorak_search_no;
 