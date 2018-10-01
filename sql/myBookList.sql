create sequence s_mylist_no increment by 1;

create table seorak_myBookList(
    mylist_no number not null,
    mylist_url varchar2(255),
    mylist_img_url varchar2(255) not null,
    member_id varchar(50) not null references seorak_member(member_id),
    isbn varchar(50) not null    
);

drop table seorak_myBookList;
drop sequence mylist_no;

select *
from seorak_mybooklist;

select *
from seorak_member;