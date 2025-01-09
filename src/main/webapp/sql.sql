create table tbl_vote202006(
v_jumin char(13) not null primary key,
v_name varchar2(20),
m_no char(1),
v_time char(4),
v_area char(20),
v_confirm char(1)
);

create table tbl_member_202006(
m_no char(1) not null primary key,
m_name varchar2(20),
p_code char(2),
p_school char(1),
m_jumin char(13),
m_city varchar2(20)
);

create table tbl_party_202006(
p_code char(2) not null primary key,
p_name varchar2(20),
p_indate date,
p_reader varchar2(20),
p_tel1 char(3),
p_tel2 char(4),
p_tel3 char(4)
);

insert into tbl_vote202006 values('99010110001', '김유권', '1', '0930', '제1투표장', 'N');
insert into tbl_vote202006 values('89010120002', '이유권', '2', '0930', '제1투표장', 'N');
insert into tbl_vote202006 values('69010110003', '박유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote202006 values('59010120004', '홍유권', '4', '0930', '제1투표장', 'Y');
insert into tbl_vote202006 values('79010110005', '조유권', '5', '0930', '제1투표장', 'Y');
insert into tbl_vote202006 values('89010120006', '최유권', '1', '0930', '제1투표장', 'Y');
insert into tbl_vote202006 values('59010110007', '지유권', '1', '0930', '제1투표장', 'Y');
insert into tbl_vote202006 values('49010120008', '장유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote202006 values('79010110009', '정유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote202006 values('89010120010', '강유권', '4', '0930', '제1투표장', 'Y');
insert into tbl_vote202006 values('99010110011', '신유권', '5', '0930', '제1투표장', 'Y');
insert into tbl_vote202006 values('79010120012', '오유권', '1', '1330', '제2투표장', 'Y');
insert into tbl_vote202006 values('69010110013', '현유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote202006 values('89010110014', '왕유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote202006 values('99010110015', '유유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote202006 values('79010110016', '한유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote202006 values('88010110017', '문유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote202006 values('99010110018', '양유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote202006 values('99010110019', '구유권', '4', '1330', '제2투표장', 'Y');

insert into tbl_member_202006 values('1', '김후보', 'P1', '1', '6603011999991', '수선화동');
insert into tbl_member_202006 values('2', '이후보', 'P2', '3', '5503011999992', '민들래동');
insert into tbl_member_202006 values('3', '박후보', 'P3', '2', '7703011999993', '나팔꽃동');
insert into tbl_member_202006 values('4', '조후보', 'P4', '2', '8803011999994', '진달래동');
insert into tbl_member_202006 values('5', '최후보', 'P5', '3', '9903011999995', '개나리동');

insert into tbl_party_202006 values('P1', 'A정당', '2010-01-01', '위대표', '02', '1111', '0001');
insert into tbl_party_202006 values('P2', 'B정당', '2010-02-01', '명대표', '02', '1111', '0002');
insert into tbl_party_202006 values('P3', 'C정당', '2010-03-01', '기대표', '02', '1111', '0003');
insert into tbl_party_202006 values('P4', 'D정당', '2010-04-01', '옥대표', '02', '1111', '0004');
insert into tbl_party_202006 values('P5', 'E정당', '2010-05-01', '임대표', '02', '1111', '0005');

<--List-->
select tm.m_no, tm.m_name, tp.p_name, tm.p_school, substr(tm.m_jumin, 1, 6), substr(tm.m_jumin, 7, 7), tm.m_city, tp.p_tel1, tp.p_tel2, tp.p_tel3
from tbl_member_202006 tm, tbl_party_202006 tp
where tm.p_code = tp.p_code
order by tm.m_no;

<--RegiConfirm-->
insert into tbl_vote202006 values(?, ?, ?, ?, ?, ?);

<--Reult-->
select tm.m_no, tm.m_name, count(*) as total
from tbl_vote202006 tv, tbl_member_202006 tm
where tv.m_no = tm.m_no and v_confirm = 'Y'
group by tm.m_no, tm.m_name
order by total desc;

<--TuList-->
select v_name, substr(v_jumin,1,2), substr(v_jumin,3,2), substr(v_jumin,5,2),
substr(v_jumin, 7, 1), m_no, substr(v_time,1,2),
substr(v_time,3,2), v_confirm, substr(v_jumin, 1, 1)
from tbl_vote202006
where v_area = '제1투표장';