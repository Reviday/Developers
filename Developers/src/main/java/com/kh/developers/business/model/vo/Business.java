package com.kh.developers.business.model.vo;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Business {
	
	private String busNo;
	private String busName;
	private String busCountry;
	private String busArea;
	private String busAddress;
	private String busRegNo;
	private String busIncome;
	private String busIndustrial;
	private String busTotalEmp;
	private String busIntroduce; 
	private String busEstablishment;
	private String busEmail;
	private String busPhone;
	private String busWebsite;
	private String[] searchKeywords; 
	private String regPath;
	private Date busEnrollDate;
	private String newIncome;
	private String allIncome;
	private Date confirmedDate;
	
	//logo & images
	private String busLogo;
	private String[] busImages;
	
	//관리자 승인 여부 
	private String busStatus;
	
	
}
