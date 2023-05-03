package com.eatfit.entity;

import lombok.Data;

@Data
public class MSB {
	private String MEM_ID;
	private int FOOD_SEQ;

	public MSB(String MEM_ID, int FOOD_SEQ) {
		this.MEM_ID = MEM_ID;
		this.FOOD_SEQ = FOOD_SEQ;
	}
}
