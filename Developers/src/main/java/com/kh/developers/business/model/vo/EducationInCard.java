package com.kh.developers.business.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EducationInCard {

	private String schoolName;
	private String majorName;
	
	private String subjectName;
	private String startEd;
	private String endEd;
	
}

