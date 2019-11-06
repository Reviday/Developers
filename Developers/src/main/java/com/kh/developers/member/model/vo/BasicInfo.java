package com.kh.developers.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BasicInfo {
	private int schoolNo;
	private String school;
	private String memEmail;
	private String officeName;
	private String startOffice;
	private String endOffice;
	private String intro;
	private Date schoolDate;
}
