package com.eatfit.entity;

import lombok.Data;

@Data
public class SearchDiary { 
	// 식단기록장에서 선택날짜에 따라 보여줄 정보를 위한 엔터티
	
	private String FOOD_NAME;
	private String REQ_DATE;
	private String MLD;
	private String FOOD_IMG;
	private double FOOD_CALORIE;
	private double FOOD_CRB;
	private double FOOD_PROTEIN;
	private double FOOD_FAT;
	
}
