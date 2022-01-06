create table board(
    idx int not null auto_increment,
    id varchar(20) not null,
	title varchar(100) not null,
	content varchar(2000) not null,
	writer varchar(100) not null,
	indate datetime default now(),
	count int default 0,
	PRIMARY KEY(idx)
);
drop table board;
INSERT INTO board (title, content, writer)
	   	    VALUE('공지사항 ㅇㅅㅇ쓰지마세요', 'ㅇ_ㅇ','ㅇ_ㅇ');
select*from board;
insert into board(title,writer,content) values('#{title}','#{writer}','#{content}');
SELECT VERSION();
select * from member;
delete from board where idx=24;
insert into board(title,writer,content) values('#{title}','#{writer}','#{content}');
update board set content='집에 보내줘요' where idx=17;
create table member(
	memId varchar(20) not null,
	memPass varchar(20) not null,
	memName varchar(20) not null,
	primary key(memId)
);
select*from member;
insert into member values('skalswn2','1234','나민주');
insert into member values('admin','1234','관리자');
insert into member values('한글도','되나','한글화');