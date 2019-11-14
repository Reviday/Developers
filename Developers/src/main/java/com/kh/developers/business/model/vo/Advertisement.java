package com.kh.developers.business.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Advertisement {
	
	private int postionNo;
	private int postion;
	private Date deadDate;
	
	private int advertisementNo;
	private Date startDate;
	private Date endDate;
	private String adType;
	private int clickTimes;
	private String adOn;
	

}
