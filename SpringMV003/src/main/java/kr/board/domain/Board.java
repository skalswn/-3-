package kr.board.domain;

import lombok.Data;

@Data
public class Board {
	//mysql -u root -p
	//cd C:\eGovFrame-3.10.0\bin\mysql-5.6.21\bin
	//마이바티스 sql맵핑프레임
	   // property(프로퍼티, 속성)
	   private int idx; // 번호
	   private String id;
	   private String title; // 제목
	   private String content; // 내용
	   private String writer; // 작성자
	   private String indate; // 작성일
	   private int count; // 조회수
	   
}