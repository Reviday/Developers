package com.kh.developers.business.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Applicant {

	private int alNo;
	private int applNo;
	private int busNo;
	private int memNo;
	private int positionNo;
	private int resumeNo;
	private int applStatus;
	private char applAnsYn;
	private Date offerDate;
	private Date answerDate;
	private Date applDate;
	private int recommendId;
	private Date finalDate;
	private String busName;
	private String busLogo;
	private String postionName;
	
}
