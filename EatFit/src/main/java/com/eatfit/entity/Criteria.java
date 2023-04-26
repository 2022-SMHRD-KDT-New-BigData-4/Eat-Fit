package com.eatfit.entity;

import lombok.Data;

// 페이지들 만들기
// 기준이 되는 클래스 Criteria
@Data
public class Criteria {
	private int page; // 현재 페이지 번호
	private int perPageNum; // 페이지 당 몇 개의 게시물을 보여줄건지
	// private int pageStart;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 3;
	}
	
	// 현재 페이지의 게시글의 시작번호 구하기
	public int getPageStart() {
		return (page-1)*perPageNum; // limit #{?}, #{perPageNum}
	}
	
}
