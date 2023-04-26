create table board(
  num int not null auto_increment, -- auto_increment(자동증가)
  title varchar(100) not null,
  content varchar(2000) not null,
  writer varchar(30) not null,
  indate datetime default now(), -- now() 날짜와시간, sysdate
  count int default 0,
  primary key(num)
);

insert into board(title, content, writer)
values('스프링 게시판 연습','스프링 게시판 연습','관리자');

insert into board(title, content, writer)
values('스프링 게시판 연습','스프링 게시판 연습','박매일');

insert into board(title, content, writer)
values('스프링 게시판 연습','스프링 게시판 연습','채수민');

select * from board;

create table reboard(
  num int not null auto_increment, -- auto_increment(자동증가)
  title varchar(100) not null,
  content varchar(2000) not null,
  writer varchar(30) not null,
  indate datetime default now(), -- now() 날짜와시간, sysdate
  count int default 0,
  boardGroup int,
  boardSeq int,
  boardLevel int,
  boardDel int default 1,
  primary key(num)
);

select IFNULL(max(boardGroup)+1,0) as boardGroup from reboard;

select * from reboard;

create table member(
	memId varchar(50) not null,
	memPwd varchar(50) not null,
	memName varchar(50) not null,
	primary key(memId)
)

insert into member values('smhrd01', 'smhrd01', '관리자');
insert into member values('smhrd02', 'smhrd02', '하이요');
insert into member values('smhrd03', 'smhrd03', '안녕요');

select * from member;




create table memboard(
  num int not null auto_increment, -- auto_increment(자동증가)
  memId varchar(50) not null,   -- Member의 PK(memId)를 가리키는 FK
  title varchar(100) not null,
  content varchar(2000) not null,
  writer varchar(30) not null,
  indate datetime default now(), -- now() 날짜와시간, sysdate
  count int default 0,
  boardGroup int,
  boardSeq int,
  boardLevel int,
  boardDel int default 1,
  primary key(num)
);

select * from memboard;


