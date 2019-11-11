package com.kh.developers.business.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class IntroCard {
	
	private int resumeNo;
	private String memName;
	private String intro;
	private String duty[];
	private String experience;
	private String skill[];
	
	private List<CareerInCard> careers;
	private List<EducationInCard> educations;
	
	private String memEmail;
	private String memPhone;

}
