package com.kh.developers.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MyApp {
	private String busName;
	private String position;
	private Date applDate;
	private String applStatus;
	private String busLogo;
	private int memNo;
}
