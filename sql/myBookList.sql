create sequence s_mylist_no increment by 1;
create sequence s_point_no increment by 1;

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

create table seorak_point(
    member_id varchar(50) not null references seorak_member(member_id),
    point_no number not null,
    point_updown number not null,
    point_reg_date date not null,
    point_reason number not null,
    point_exchange_id varchar(50) not null
);

select *
from seorak_point;

select nvl( sum(point_updown), 0 )
from seorak_point
where member_id='dlopo123@gmail.com'
and point_reason=2;

insert into seorak_point(
                    member_id,
                    point_no,
                    point_updown,
                    point_reg_date,
                    point_reason,
                    point_exchange_id
                    ) values (
                    'dlopo123@gmail.com',
                    s_point_no.nextval,
                    '-200',
                    sysdate,
                    1,
                    'dlopo123'
                    );
                    
commit;