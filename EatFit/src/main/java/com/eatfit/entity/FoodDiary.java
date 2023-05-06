package com.eatfit.entity;

import java.util.Date;

import lombok.Data;

@Data
public class FoodDiary {

   private String REQ_DATE;
   private double FOOD_WEIGTH;
   private String FOOD_IMG;
   private String ANALOGY_FOOD_IMG;
   private String FOOD_NAME;
   private double FOOD_CALORIE;
   private double FOOD_CRB;
   private double FOOD_PROTEIN;
   private double FOOD_FAT;
}