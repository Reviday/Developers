package com.kh.developers.resume.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Career {
	private int careerNo;
	private String memEmail;
	private Date startCareer;
	private Date endCareer;
	private String empName;
	private String depName;
	private Date careerDate;

}
