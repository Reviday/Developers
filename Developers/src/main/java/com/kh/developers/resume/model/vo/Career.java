package com.kh.developers.resume.model.vo;

import java.util.Date;

import javax.servlet.http.HttpServlet;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Career {
	private int careerNo;
	private String memEmail;
	private String startCareer;
	private String endCareer;
	private String busName;
	private String depName;
	private Date careerDate;
	private int resumeNo;
	private String careerIntro;
	
}
