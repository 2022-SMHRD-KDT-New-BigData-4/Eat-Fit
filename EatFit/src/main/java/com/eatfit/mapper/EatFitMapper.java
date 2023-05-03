package com.eatfit.mapper;

import java.util.List;

import com.eatfit.entity.Food;
import com.eatfit.entity.MSB;
import com.eatfit.entity.Member;

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
}
