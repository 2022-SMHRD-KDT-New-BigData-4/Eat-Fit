package com.eatfit.entity;

import java.util.Date;

import lombok.Data;
// import java.lang.*; default package
// 게시판(Object) -> 번호, 제목, 내용, 작성자, 작성일, 조회수,.........--->
// Lombok API
@Data
public class Board {
   private int num;
   private String memId;
   private String title;
   private String content;
   private String writer;
   private Date indate;
   private int count;   
   // 답글과 관련된 멤버변수 추가
   private int boardGroup; // 원글과 답글을 묶는 역할
   private int boardSeq; // 답글의 순서
   private int boardLevel; // 답글의 레벨(들여쓰기)
   private int boardDel; // 답글의 삭제여부(1:정상, 0:삭제)
}
