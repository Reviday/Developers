package com.kh.developers.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BusinessRequest {

	private int requestNo;
	private Date requestDate;
	
	// business
	private int busNo;
	private String busName;
	private String busAddress;
	private String busIncome;
	private String busIndustrial;
	
	//member
	private int memNo; // 회원넘버(시퀀스넘버로 부여)
	private String memEmail; // 회원 이메일
}
