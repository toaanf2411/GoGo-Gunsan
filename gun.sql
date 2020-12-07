--=================================================
--회원테이블
create table member (
    --회원번호
    member_no varchar2(20),
    --회원이메일
    member_email varchar2(30) unique,
      --회원이름
    member_name varchar2(30) not null,
    --회원패스워드
   member_password varchar2(300) not null,
   --생년월일
   member_birth date not null,
   --전화번호
    member_phone char(11) not null,
    --등급
    grade char(1) default 'U' not null,
    --가입일
   member_enrolldate date default sysdate,
--제약조건   
constraint pk_member primary key(member_no),
constraint ck_member_grade check(grade in ('U','A'))
);

select * from member;
--drop table member;
create sequence seq_tbl_member_no;
--drop sequence seq_tbl_member_no;


insert into member values('gn'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_member_no.nextval,'fm0000'),'admin@admin.com','관리자','1234','2000-02-01','01012341234','A',default);
insert into member values('gn'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_member_no.nextval,'fm0000'),'hong@naver.com','홍길동','1234','1999-05-02','01012341234','U',default);
commit;

--암호화 작업
update member
set member_password ='zV20EPLU+GYDUVbjcdO5SyYume2DrF3/DX6oap1Mtkroi1KsygjZOow69UaTNgBICjDvM2zr/8G5BW0Wg6tuhw==';


--======================================
--관광지 카테고리 테이블
create table  tour_category(
    --카테고리아이디
    category_id varchar2(20) not null,
       --카테고리네임
    category_name varchar2(30) not null,
   constraint pk_tour_category primary key(category_id)
);

select * from tour_category;

insert into  tour_category values('T1','자연');
insert into  tour_category values('T2','공원');
insert into  tour_category values('T3','마을');
insert into  tour_category values('T4','박물관/전시관');
insert into  tour_category values('T5','문화유적');
insert into  tour_category values('T6','레저/체험');

commit;

--============================================
--관광지 정보 테이블
create table  tour_info(
    --관광지아이디
    tour_info_id varchar2(20) not null,
    --관광지이름
    tour_info_name varchar2(100) not null unique,
   --카테고리 fk
   category_id varchar2(20) not null,
   --서비스 타입
   service_type varchar2(4) not null,
   --has_ticket
   has_ticket char(1),
   -- 어른가격
   adult_price varchar2(20) default '0',
      -- 어린이가격,
   child_price varchar2(20) default '0',
     --위도
   lat number not null,
    --경도
   longitude number not null,
  -- 소개 이미지 경로
  img_service_original_filename varchar2(100),
  --제약조건
   constraint pk_tour_info_id primary key( tour_info_id),
   constraint ck_has_ticket check(has_ticket in ('Y','N')),
   constraint fk_category_id foreign key(category_id) references tour_category(category_id) on delete cascade
);

--drop sequence seq_tour_info;
--drop table tour_info;

--관광지별 시퀀스 넘버
select * from tour_info;
create sequence seq_tour_info_ta1;
create sequence seq_tour_info_ta2;
create sequence seq_tour_info_ta3;
create sequence seq_tour_info_ta4;
create sequence seq_tour_info_ta5;
create sequence seq_tour_info_ta6;
--TA1 자연 6개
insert into tour_info values('TA1'|| to_char(seq_tour_info_ta1.nextval, 'fm0000'), '월명호수', 'T1','C', 'N',default,default,35.979715,126.695576, 'info월명호수.png');
insert into tour_info values('TA1'|| to_char(seq_tour_info_ta1.nextval, 'fm0000'), '축성산', 'T1','M', 'N',default,default,36.006552,126.843504, 'info축성산.png');
insert into tour_info values('TA1'|| to_char(seq_tour_info_ta1.nextval, 'fm0000'), '해망굴', 'T1','F', 'N',default,default,35.991669,126.704232, 'info행망굴.png');
insert into tour_info values('TA1'|| to_char(seq_tour_info_ta1.nextval, 'fm0000'), '옥구저수지', 'T1','S', 'N',default,default,35.930713,126.657638, 'info옥구저수지.png');
insert into tour_info values('TA1'|| to_char(seq_tour_info_ta1.nextval, 'fm0000'), '망해산', 'T1','S', 'N',default,default,36.018098,126.839806, 'info망해산.png');
insert into tour_info values('TA1'|| to_char(seq_tour_info_ta1.nextval, 'fm0000'), '선유도', 'T1','FMCS', 'N',default,default,35.810655,126.416209, 'info선유도.png');
--TA2 공원 1개
insert into tour_info values('TA2'|| to_char(seq_tour_info_ta2.nextval, 'fm0000'), '월명공원', 'T2','FMC', 'N',default,default,35.990116,126.702635, 'info월명공원.png');
--TA3 마을 2개
insert into tour_info values('TA3'|| to_char(seq_tour_info_ta3.nextval, 'fm0000'), '열대자마을', 'T3','F', 'N',default,default,35.959563,126.633837, 'info열대자마을.png');
insert into tour_info values('TA3'|| to_char(seq_tour_info_ta3.nextval, 'fm0000'), '경암동철길마을', 'T3','FMC', 'N',default,default,35.981288,126.737023, 'info경암동철길마을.png');
--TA4 박물관/전시관 5개
insert into tour_info values('TA4'|| to_char(seq_tour_info_ta4.nextval, 'fm0000'), '근대역사박물관', 'T4','FMCS', 'Y','3000','1000',35.990779,126.712097, 'info근대역사박물관.png');
insert into tour_info values('TA4'|| to_char(seq_tour_info_ta4.nextval, 'fm0000'), '호남관세박물관', 'T4','FMCS', 'Y','2000','1000',35.991061,126.711249, 'info호남관세박물관.png');
insert into tour_info values('TA4'|| to_char(seq_tour_info_ta4.nextval, 'fm0000'), '(구)조선은행(근대건축관)', 'T4','M', 'Y','1000','500',35.989257,126.714172, 'info근대건축관.png');
insert into tour_info values('TA4'|| to_char(seq_tour_info_ta4.nextval, 'fm0000'), '(구)일본18은행(근대미술관)', 'T4','FMCS', 'Y','500','200',35.989907,126.712759, 'info근대미술관.png');
insert into tour_info values('TA4'|| to_char(seq_tour_info_ta4.nextval, 'fm0000'), '군산 3.1기념관', 'T4','C', 'Y','500','200',35.984936,126.741964, 'info31기념관.png');
--TA5 문화유적 4개
insert into tour_info values('TA5'|| to_char(seq_tour_info_ta5.nextval, 'fm0000'), '동국사', 'T5','FMC', 'N',default,default,35.982849,126.707512, 'info동국사.png');
insert into tour_info values('TA5'|| to_char(seq_tour_info_ta5.nextval, 'fm0000'), '군산신흥동일본식가옥', 'T5','FS', 'N',default,default,35.986130,126.706050, 'info군산신흥동일본식가옥.png');
insert into tour_info values('TA5'|| to_char(seq_tour_info_ta5.nextval, 'fm0000'), '이영춘가옥', 'T5','MS', 'N',default,default,35.970884,126.759705, 'info이영춘가옥.png');
insert into tour_info values('TA5'|| to_char(seq_tour_info_ta5.nextval, 'fm0000'), '부잔교', 'T5','CS', 'N',default,default,35.991440,126.713946, 'info부잔교.png');
--TA6 레저체험 7개
insert into tour_info values('TA6'|| to_char(seq_tour_info_ta6.nextval, 'fm0000'), '신시도어촌체험마을(바지락캐기 체험)', 'T6','FMCS', 'Y','5000','5000',35.814059,126.452258, 'info바지락캐기.png');
insert into tour_info values('TA6'|| to_char(seq_tour_info_ta6.nextval, 'fm0000'), '신시도어촌체험마을(낚시 체험)', 'T6','FMCS', 'Y','60000',default,35.814059,126.452258, 'info낚시체험.png');
insert into tour_info values('TA6'|| to_char(seq_tour_info_ta6.nextval, 'fm0000'), '옥구오산마을(연꽃재배)', 'T6','FMCS', 'Y','10000','5000',35.922172,126.683866, 'info연꽃재배.png');
insert into tour_info values('TA6'|| to_char(seq_tour_info_ta6.nextval, 'fm0000'), '옥구오산마을(토속음식 체험)', 'T6','FMCS', 'Y','5000','3000',35.922172,126.683866, 'info토속음식체험.png');
insert into tour_info values('TA6'|| to_char(seq_tour_info_ta6.nextval, 'fm0000'), '승마체험', 'T6','FMCS', 'Y', '50000','25000',35.981612,126.785103, 'info승마체험.png');
insert into tour_info values('TA6'|| to_char(seq_tour_info_ta6.nextval, 'fm0000'), '패러글라이딩', 'T6','FMCS', 'Y','75000','50000',35.999433,126.786499, 'info패러글라이딩.png');
insert into tour_info values('TA6'|| to_char(seq_tour_info_ta6.nextval, 'fm0000'), '선유스카이 SUN라인', 'T6','FMCS', 'Y','20000','16000',35.815877,126.406784, 'info선유스카이.png');


commit;
--총 25개 확인 
select * from tour_info;

drop sequence seq_tour_info_ta1;
drop sequence seq_tour_info_ta2;
drop sequence seq_tour_info_ta3;
drop sequence seq_tour_info_ta4;
drop sequence seq_tour_info_ta5;
drop sequence seq_tour_info_ta6;
--=============================================
--관광지staff테이블
create table tour_staff (
    tour_staff_no varchar2(20) not null,
    tour_staff_email varchar2(30) not null,
    tour_staff_name varchar(50) not null,
    tour_staff_password varchar2(300) not null,
    tour_staff_phone char(11) not null,
    tour_staff_enrolldate date default sysdate,
    tour_info_id varchar2(20),
    constraint pk_tour_staff_no primary key(tour_staff_no),
    constraint fk_tour_info_id foreign key (tour_info_id) references tour_info(tour_info_id) on delete cascade
);

--drop table tour_staff;
--drop sequence seq_tbl_admin_staff_no;
--관광지 staff 시퀀스 번호
create sequence seq_tbl_admin_staff_no;

--관광지 staff테이블 암호화
update tour_staff
    set tour_staff_password ='1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==';


select * from tour_info;
select * from tour_staff;
-- TA1 스태프계정
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta10001_staff@staff.com','월명호수staff','1234','01012341234',default,'TA10001');
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta10002_staff@staff.com','축성산staff','1234','01012341234',default,'TA10002');
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta10003_staff@staff.com','해망굴staff','1234','01012341234',default,'TA10003');
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta10004_staff@staff.com','옥구저수지staff','1234','01012341234',default,'TA10004');
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta10005_staff@staff.com','망해산staff','1234','01012341234',default,'TA10005');
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta10006_staff@staff.com','선유도staff','1234','01012341234',default,'TA10006');

-- TA2 스태프계정
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta20001_staff@staff.com','월명공원staff','1234','01012341234',default,'TA20001');

-- TA3 스태프계정
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta30001_staff@staff.com','열대자마을staff','1234','01012341234',default,'TA30001');
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta30002_staff@staff.com','경암동철길마을staff','1234','01012341234',default,'TA30002');

-- TA4 스태프계정
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta40001_staff@staff.com','근대역사staff','1234','01012341234',default,'TA40001');
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta40002_staff@staff.com','호남관세staff','1234','01012341234',default,'TA40002');
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta40003_staff@staff.com','근대건축staff','1234','01012341234',default,'TA40003');
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta40004_staff@staff.com','근대미술staff','1234','01012341234',default,'TA40004');
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta40005_staff@staff.com','31기념staff','1234','01012341234',default,'TA40005');

-- TA5 스태프계정
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta50001_staff@staff.com','동국사staff','1234','01012341234',default,'TA50001');
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta50002_staff@staff.com','신흥동일본식가옥staff','1234','01012341234',default,'TA50002');
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta50003_staff@staff.com','이영춘가옥staff','1234','01012341234',default,'TA50003');
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta50004_staff@staff.com','부잔교staff','1234','01012341234',default,'TA50004');

-- TA6 스태프계정
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta60001_staff@staff.com','신시도바지락케기staff','1234','01012341234',default,'TA60001');
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta60002_staff@staff.com','신시도낚시체험staff','1234','01012341234',default,'TA60002');
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta60003_staff@staff.com','옥구오산연꽃재배staff','1234','01012341234',default,'TA60003');
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta60004_staff@staff.com','옥구오산토속음식staff','1234','01012341234',default,'TA60004');
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta60005_staff@staff.com','승마체험staff','1234','01012341234',default,'TA60005');
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta60006_staff@staff.com','패러글라이딩staff','1234','01012341234',default,'TA60006');
insert into tour_staff values ('gst'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'ta60007_staff@staff.com','선유스카이staff','1234','01012341234',default,'TA60007');

commit;


--------------------------------------------------------------------
--예약테이블

create table reservation(
    --pk 예약번호
   reservation_id varchar2(20) not null,
    --관광지 번호
    tour_info_id varchar2(20),
     --관광지 staff번호
    tour_staff_no varchar2(20) not null,
    --회원번호
    member_no varchar2(20),
--어른 인원수
    adult_amount number,
    --어린이 인원수
    children_amount number,
    --총가격
    total_price varchar2(15),
    --날짜/시간
    tour_date_time varchar2(30),
    --예매날짜
   reservation_date date default sysdate,
    --결제수단
    pay char(1) default 'C' not null,
    -- 제약조건
    constraint pk_reservation_id primary key (reservation_id),
    constraint fk_rs_member_no foreign key(member_no) references member(member_no) on delete cascade  ,
    constraint fk_rs_tour_info_id foreign key(tour_info_id) references tour_info(tour_info_id) on delete cascade,
    constraint fk_rs_tour_staff_no foreign key(tour_staff_no) references tour_staff(tour_staff_no) on delete cascade,
     constraint ck_reservation_pay check( pay in ('C','W'))
);
--drop table reservation;
select * from reservation;
--예약 테이블 시퀀스 번호
create sequence seq_reservation_no;
--drop sequence seq_reservation_no;
select * from tour_info;
select * from tour_staff;
select * from member;
 -- 결제 수단 'C' , 'W'
insert into reservation values( to_char(sysdate,'yymmdd')||'_'||to_char(seq_reservation_no.nextval,'fm0000'),'TA60005','gst200217_0023','gn200217_0002',3,2,(select adult_price *3+child_price*2 from tour_info where tour_info_id = 'TA60005')
    ,'2020/2/18'||'-'||'10:00',default,default);
    insert into reservation values( to_char(sysdate,'yymmdd')||'_'||to_char(seq_reservation_no.nextval,'fm0000'),'TA60006','gst200217_0024','gn200217_0002',3,2,(select adult_price *3+child_price*2 from tour_info where tour_info_id = 'TA60006')
    ,'2020/2/18'||'-'||'10:00',default,default);
    
commit;

select reservation_id,tour_info_id,tour_info_name,tour_staff_no,member_no,member_name,member_phone,adult_amount,children_amount,total_price,tour_date_time,reservation_date,pay from reservation R join tour_info T  using(tour_info_id) join member M  using(member_no) order by r.tour_date_time;

    
    select adult_price *3+child_price*2 from tourist_attraction where tourist_attraction_id = 'TA6028';
   
   
   ---------------------------------------------------
   --시간테이블
   
   create table tour_time(
        tour_info_id varchar2(20),
        remaining_ticket varchar2(100),
        start_time varchar2(300),
        constraint pk_tour_time_info_id primary key( tour_info_id),
        constraint fk_tour_time_info_id foreign key( tour_info_id) references  tour_info( tour_info_id) on delete cascade
);

--drop table tour_time;
select * from tour_time;
insert into tour_time values('TA60005','20,20,20,20,20,20','10:00,11:00,13:00,14:00,15:00,16:00');
insert into tour_time values('TA60006','20,25,20,20,15', '10:30,11:30,13:30,14:30,15:30');
insert into tour_time values('TA60007','20,30,30,30,30,30,20','10:00,11:00,13:00,14:00,15:00,16:00,17:00');
insert into tour_time values('TA40001','999','10:00~16:00');
insert into tour_time values('TA40002','999','08:00~15:00');
insert into tour_time values('TA40003','999','09:00~17:00');
insert into tour_time values('TA40004','999','10:00~18:00');
insert into tour_time values('TA40005','999','9:30~16:00');
insert into tour_time values('TA60001','999','8:00~16:30');
insert into tour_time values('TA60002','999','10:00~15:30');
insert into tour_time values('TA60003','999','12:00~17:00');
insert into tour_time values('TA60004','999','11:00~17:30');

commit;
     
    --------------------------------------------------------------------------
    --자유게시판
    --=================================================
    --BOARD
    --=================================================
    --board테이블 생성
    create table free_board(
        free_board_no number,
        free_board_title varchar2(100) not null,
        free_board_writer varchar2(15) not null,
        free_board_content varchar2(2000) not null,
        free_board_original_filename varchar2(100),
        free_board_renamed_filename varchar2(100),
        free_board_date date default sysdate,
        free_board_readcount number default 0,
        constraint pk_fr_board_no primary key(free_board_no),
       constraint fk_fr_board_writer foreign key(free_board_writer) references member(member_no)
                                           on delete cascade
    );

--    drop table   free_board;
-- 자유 게시판 시퀀스 번호
    create sequence seq_fr_board_no;
--    drop sequence seq_fr_board_no;
    select count(*) cnt  from free_board;
    
select rownum,A.*
from
            (select free_board_no, free_board_title, m.member_name, free_board_content, free_board_original_filename, free_board_renamed_filename, free_board_date, free_board_readcount
            from free_board A join member m 
            on a.free_board_writer = m.member_no 
            order by free_board_date desc) A 
            where rownum between 1 and 5;
            
select *
    from(
    select row_number() over(order by enrolldate desc) rnum, M.*
    from member M)
    where rnum between 11 and 20;

    select * from free_board;
    select  *  from ( select free_board_no, free_board_title, m.member_name, free_board_content, free_board_original_filename, free_board_renamed_filename, free_board_date, free_board_readcount, rownum rnum from free_board A join member m  on a.free_board_writer = m.member_no order by free_board_date desc) A  where rnum between 2 and 5;
insert into free_board values(seq_fr_board_no.nextval,'hi','관리자','안녕',null,null,default,default);
Insert into free_board   values (seq_fr_board_no.nextval,'안녕하세요, 게시판입니다 - 1','gn200205_0002','반갑습니다',null,null,to_date('18/01/11','RR/MM/DD'),0);
Insert into free_board   values (seq_fr_board_no.nextval,'안녕하세요, 게시판입니다 - 2','gn200205_0002','반갑습니다',null,null,to_date('18/02/12','RR/MM/DD'),0);
Insert into free_board   values (seq_fr_board_no.nextval,'안녕하세요, 게시판입니다 - 3','gn200205_0002','반갑습니다',null,null,to_date('18/02/13','RR/MM/DD'),0);
Insert into free_board   values (seq_fr_board_no.nextval,'안녕하세요, 게시판입니다 - 4','gn200205_0002','반갑습니다',null,null,to_date('18/02/14','RR/MM/DD'),0);
Insert into free_board   values (seq_fr_board_no.nextval,'안녕하세요, 게시판입니다 - 5','gn200205_0002','반갑습니다',null,null,to_date('18/02/15','RR/MM/DD'),0);
Insert into free_board   values (seq_fr_board_no.nextval,'안녕하세요, 게시판입니다 - 6','gn200205_0002','반갑습니다',null,null,to_date('18/02/16','RR/MM/DD'),0);
Insert into free_board   values (seq_fr_board_no.nextval,'안녕하세요, 게시판입니다 - 7','gn200205_0002','반갑습니다',null,null,to_date('18/02/17','RR/MM/DD'),0);
Insert into free_board   values (seq_fr_board_no.nextval,'안녕하세요, 게시판입니다 - 8','gn200205_0002','반갑습니다',null,null,to_date('18/02/18','RR/MM/DD'),0);
Insert into free_board   values (seq_fr_board_no.nextval,'안녕하세요, 게시판입니다 - 9','gn200205_0002','반갑습니다',null,null,to_date('18/02/19','RR/MM/DD'),0);
Insert into free_board   values (seq_fr_board_no.nextval,'안녕하세요, 게시판입니다 - 10','gn200205_0002','반갑습니다',null,null,to_date('18/02/20','RR/MM/DD'),0);
Insert into free_board   values (seq_fr_board_no.nextval,'안녕하세요, 게시판입니다 - 11','gn200205_0002','반갑습니다',null,null,to_date('18/03/11','RR/MM/DD'),0);
Insert into free_board   values (seq_fr_board_no.nextval,'안녕하세요, 게시판입니다 - 12','gn200205_0002','반갑습니다',null,null,to_date('18/03/12','RR/MM/DD'),0);
Insert into free_board   values (seq_fr_board_no.nextval,'안녕하세요, 게시판입니다 - 13','gn200205_0002','반갑습니다',null,null,to_date('18/03/13','RR/MM/DD'),0);
Insert into free_board   values (seq_fr_board_no.nextval,'안녕하세요, 게시판입니다 - 14','gn200205_0002','반갑습니다',null,null,to_date('18/03/14','RR/MM/DD'),0);
Insert into free_board   values (seq_fr_board_no.nextval,'안녕하세요, 게시판입니다 - 15','gn200205_0002','반갑습니다',null,null,to_date('18/03/15','RR/MM/DD'),0);
commit;
    --============================================
    --댓글 게시판
    --============================================
    --    drop table board_comment;
    --    drop sequence seq_board_comment_no;
    create table free_board_comment(
        free_board_comment_no number,
        free_board_comment_level number default 1, --댓글1, 대댓글2
        free_board_comment_writer varchar2(15),
        free_board_comment_content varchar2(2000),
        free_board_ref number,
        free_board_comment_ref number,
        free_board_comment_date date default sysdate,
        constraint pk_fr_board_comment_no primary key(free_board_comment_no),
        constraint fk_fr_board_comment_writer foreign key(free_board_comment_writer)
                                                                references member(member_no) on delete set null,
        constraint fk_fr_board_ref foreign key(free_board_ref) references  free_board(free_board_no) on delete cascade,
        constraint fk_fr_board_comment_ref foreign key(free_board_comment_ref) references free_board_comment(free_board_comment_no) on delete cascade
        );
--    drop table  free_board_comment;

-- 자유게시판 댓글 시퀀스
        create sequence seq_fr_board_comment_no;
--        drop sequence seq_fr_board_comment_no;



        insert into free_board_comment values (seq_fr_board_comment_no.nextval,1,'gn200205_0001','안녕하세요',18,null,default);
         insert into free_board_comment
        values(seq_fr_board_comment_no.nextval, default, 'gn200205_0002','글 잘읽었어요(댓)',16, null,default);
        insert into free_board_comment
        values(seq_fr_board_comment_no.nextval, default, 'gn200205_0002','좋은 정보 감사합니다.(댓)',16, null,default); 
        
          insert into free_board_comment
        values(seq_fr_board_comment_no.nextval,2, 'gn200205_0001','저도요,,,,(대댓)',16, 1,default);
         insert into free_board_comment
        values(seq_fr_board_comment_no.nextval, 2, 'gn200205_0001','누구세요,,,,(대댓)',16, 1,default);
         insert into free_board_comment
        values(seq_fr_board_comment_no.nextval, 2, 'gn200205_0001','얼씨구,,,,(대댓)',16, 2,default);
         insert into free_board_comment
        values(seq_fr_board_comment_no.nextval, 2, 'gn200205_0001','say 호오,,,,(대댓)',16, 2,default);
        commit;
        select  * from free_board_comment;
        
        
        select lpad(' ',(level-1)*5) || free_board_comment_content, BC.*
        from free_board_comment BC
        where free_board_ref = 16
        start with free_board_comment_level = 1
        connect by prior free_board_comment_no = free_board_comment_ref
        order siblings by free_board_comment_no desc;
        
        select lpad(' ',(level-1)*5) || free_board_comment_content, free_board_comment_no, free_board_comment_level, m.member_name, free_board_comment_content,free_board_ref,free_board_comment_ref,free_board_comment_date
        from free_board_comment BC join member m
        on bc.free_board_comment_writer =  m.member_no
        where free_board_ref = 16
        start with free_board_comment_level = 1
        connect by prior free_board_comment_no = free_board_comment_ref
        order siblings by free_board_comment_no desc;
        
        
        
    select lpad(' ',(level-1)*5) || free_board_comment_content, BC.* from free_board_comment BC where free_board_ref = ? start with free_board_comment_level = 1 connect by prior free_board_comment_no = free_board_comment_ref order siblings by free_board_comment_no desc;
    
    --------------------------------------------------------------------------
    --------------------------------------------------------------------------
    --관광지공지사항게시판
    --=================================================
    --BOARD
    --=================================================
    --board테이블 생성
    create table staff_board(
        staff_board_no number,
        staff_board_title varchar2(100) not null,
        staff_board_writer varchar2(15) not null,
        staff_board_content varchar2(2000) not null,
        staff_board_original_filename varchar2(100),
        staff_board_renamed_filename varchar2(100),
        staff_board_date date default sysdate,
        staff_board_readcount number default 0,
        constraint pk_st_board_no primary key(staff_board_no),
        constraint fk_st_board_writer foreign key(staff_board_writer) references tour_staff(tour_staff_no)
                                          on delete cascade
    );
    
    --관광지 공지사항 테이블 시퀀스 번호
    create sequence seq_st_board_no;

        --------------------------------------------------------------------------
    --관리자게시판
    --=================================================
    --BOARD
    --=================================================
    --board테이블 생성
    create table admin_board(
        admin_board_no number,
        admin_board_title varchar2(100) not null,
        admin_board_writer varchar2(15) not null,
        admin_board_content varchar2(2000) not null,
        admin_board_original_filename varchar2(100),
        admin_board_renamed_filename varchar2(100),
        admin_board_date date default sysdate,
        admin_board_readcount number default 0,
        constraint pk_ad_board_no primary key(admin_board_no),
        constraint fk_ad_board_writer foreign key(admin_board_writer) references member(member_no)
                                            on delete cascade
    );
    select *from admin_board;
    commit;
    create sequence seq_ad_board_no;
    Insert into admin_board   values (seq_ad_board_no.nextval,'안녕하세요, 게시판입니다 - 1','gn200205_0001','반갑습니다',null,null,to_date('18/01/11','RR/MM/DD'),0);

    --------------------------------------------------------------------------
   - 
SELECT  'DROP TABLE ' || object_name || ' CASCADE CONSTRAINTS;'
 FROM    user_objects
WHERE   object_type = 'TABLE';




SELECT  'DROP SEQUENCE ' || object_name || ' ;'
FROM    user_objects
WHERE   object_type = 'SEQUENCE';

