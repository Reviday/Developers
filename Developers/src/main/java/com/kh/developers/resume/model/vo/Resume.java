package com.kh.developers.resume.model.vo;

import java.util.Date;

import javax.servlet.http.HttpServlet;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Resume  {
	private int resumeNo;
	private String memEmail;
	private String memName;
	private String memPhone;
	private String intro;
	private Date resumeDate;
	private String matchup;
	private int interestsNo;
	private String schoolName;
	private String startCareer;
	private String endCareer;
	private String busName;
	private String status;
	
}
