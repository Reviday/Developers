package com.kh.developers.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Point {
	private int pointNo;//포인트 시퀀스
	private int memNo; //포인트 줄멤버 넘버
	private int memPointPlus; //멤버에게 줄 포인트
	private String pointIntro; //무슨 이유로 주는지 소개
	private Date pointDate; //포인트 준 날짜
	private int memPoint; //멤버 포인트 가져올 용도 
}
