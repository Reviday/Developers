package com.kh.developers.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Point {
	private int pointNo;
	private int memNo;
	private int memPointPlus;
	private String pointIntro;
	private Date pointDate;
	private int memPoint;
}
