package com.kh.developers.business.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CareerInCard {
	private String busName;
	private String startCareer;
	private String endCareer;
	
	private String deptName;
	private String careerIntro;
}
