package com.kh.developers.business.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Business {

	private String busName;
	private String busCountry;
	private String busArea;
	private String busAddress;
	private String busRegNum;
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
}
