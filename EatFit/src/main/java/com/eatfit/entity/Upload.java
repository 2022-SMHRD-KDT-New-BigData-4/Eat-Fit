package com.eatfit.entity;

import java.util.Date;

import lombok.Data;

@Data
public class Upload {

	
	private String MEM_ID;
	private String REQ_DATE;
	private double FOOD_WEIGTH;
	private String FOOD_IMG;
	private String ANALOGY_FOOD_IMG;
	private int FOOD_SEQ;
	private String FOOD_NAME;
	private double FOOD_CALORIE;
	private double FOOD_CRB;
	private double FOOD_PROTEIN;
	private double FOOD_FAT;
	private String MLD;
	
	public Upload() {
		// TODO Auto-generated constructor stub
	}
	public Upload(String MEM_ID, String MLD, String REQ_DATE) {
		this.MEM_ID = MEM_ID;
		this.MLD = MLD;
		this.REQ_DATE = REQ_DATE;
	}

}