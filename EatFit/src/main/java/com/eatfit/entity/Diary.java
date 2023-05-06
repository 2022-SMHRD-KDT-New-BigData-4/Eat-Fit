package com.eatfit.entity;

import lombok.Data;

@Data
public class Diary {
	
	private String MEM_ID;
	private String REQ_DATE;
	private String MLD;
	private int FOOD_SEQ;
	private double FOOD_WEIGTH;
	private String FOOD_IMG;
	private String ANALOGY_FOOD_IMG;

	public Diary(String MEM_ID, String req_date) {
		this.MEM_ID = MEM_ID;
		this.REQ_DATE = req_date;
	}

}
