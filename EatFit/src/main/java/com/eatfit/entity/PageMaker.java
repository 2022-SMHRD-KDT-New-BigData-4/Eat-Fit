package com.eatfit.entity;

import lombok.Data;

// 페이징 처리를 하기 위해서 계산하는 클래스
@Data
public class PageMaker {
	
	private Criteria cri;
	private int totalCount; // 총 게시글의 수
	private int startPage; // 시작페이지 번호
	private int endPage; // 끝페이지 번호(조정이 되어야 한다)
	private boolean prev; // 이전 버튼이 있을지 없을지 - True : 이전버튼 있고, False : 이전 버튼 없고
	private boolean next; // 다음 버튼이 있을지 없을지
	private int displayPageNum = 3; // 1, 2, 3, 4, 5 ▶
	
	// 1. 총 게시글의 수를 구하는 메소드
	public void setTotalCount(int totalCount) {
		
		this.totalCount = totalCount;
		makePaging();
	}

	// 페이징 처리에서 제일 중요한 부분!
	private void makePaging() {

		// 1. 화면에 보여질 마지막 페이지 번호 구하기
		endPage = (int)(Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum);
		
		// 2. 화면에 보여질 시작 페이지 번호 구하기
		startPage = (endPage - displayPageNum) +1;
		if(startPage<=0) startPage = 1;
		
		// 3. 전체 마지막 페이지 계산
		int tempEndPage = (int)Math.ceil(totalCount/(double)cri.getPerPageNum());
		
		// 4. 화면에 보여진 마지막 페이지의 유효성 체크 
		if(tempEndPage<endPage) {
			endPage = tempEndPage;
		}
		
		// 5. 이전페이지 버튼 존재 여부
		prev = (startPage==1) ? false : true;
		// 6. 다음페이지 버튼 존재 여부
		next = (endPage<tempEndPage) ? true : false;
		
	}
	
	
}
