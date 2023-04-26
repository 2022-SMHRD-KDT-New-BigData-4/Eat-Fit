package com.eatfit.mapper;

import java.util.List;

import com.eatfit.entity.Board;
import com.eatfit.entity.Criteria;
import com.eatfit.entity.Member;

// Model(DAO) : JDBC(1.생산성이 떨어진다, 2. 유지보수가 어렵다(Java+SQL))
// Java<-----SQL Mapping Framework(MyBatis)---------->SQL(XML)
public interface BoardMapper {
	
	// DB연결 -- X -->Spring에서도 xml파일에 [데이터베이스를 연결]한다.
	
	// 데이터베이스에서 게시물 전체를 가져오는 메서드를 정의
	public List<Board> getAllList(Criteria cri); // 추상메서드 : select * from board
	
	public void register(Board vo); // insert SQL~
    public Board get(int num);	// select SQL~
    public int remove(int num); // delete SQL~
    public void modify(Board vo); // update SQL~
    
    // 답변에서 추가 메서드
    public void replySeqUpdate(Board parent); // update SQL~
    public void replyInsert(Board vo); // insert SQL~
    
    // 로그인 인증처리
    public Member login(Member vo); // select
    public int totalCount(); // select
    
}