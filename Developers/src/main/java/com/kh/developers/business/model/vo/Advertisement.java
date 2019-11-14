package com.kh.developers.business.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Advertisement {
	
	private int positionNo;
	private String position;
	private Date deadDate;
	
	private int advertisementNo;
	private Date adStartDate;
	private Date adeEndDate;
	private String adType;
	private int clickTimes;
	private String adOn;
	

}
