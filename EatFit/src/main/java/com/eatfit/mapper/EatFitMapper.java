package com.eatfit.mapper;

import java.util.List;

import com.eatfit.entity.Diary;
import com.eatfit.entity.Food;
import com.eatfit.entity.MSB;
import com.eatfit.entity.Member;
import com.eatfit.entity.SearchDiary;
import com.eatfit.entity.Upload;

public interface EatFitMapper {

	// 회원가입
	public int join(Member vo);

	// 로그인
	public Member login(Member vo);

	// 식자재 보관함
	public List<Food> foodMSB(Member mvo);

	// 식자재 보관함 추가
	public int addFoodSearch(String add_food);

	public int addMSB(MSB msb);

	// 식자재 보관함 삭제
	public int deleteMSB(MSB msb);

	// 식단 기록장 정보 불러오기
	public List<Integer> foodDiary(String MEM_ID);

	// 식단 기록장 정보 불러오기
	public List<SearchDiary> searchDiary(Diary diary);

	// 음식 이름(cNames) -> seq로 바꿔오기 위한 select
	public int uploadFoodSearch(String FOOD_NAME);

	// mem_id, req_date, food_seq, food_weigth, food_img, analogy_food_img -> insert
	public int insertUploadData(Upload uvo);

	// insert 후 중량 디폴트 값 불러오기 위한 select
	public List<Food> getFoodWeigth(String MEM_ID);

	// 중량, MLD update!
	public int updateWeigth(Upload uvo);

	// 분석된 사진 기반 메인, 기록일지에 업로드
	public List<Upload> upload(String vo);
	
	// 로그인 메인페이지 사용자 대시보드 섭취하고 난 뒤 영양정보 가져오기
	public Upload getNTSum(String vo);

	// 상세 영양정보 불러오기 위한 select
	public List<Upload> getFoodDetailData(Upload foodData);
}
