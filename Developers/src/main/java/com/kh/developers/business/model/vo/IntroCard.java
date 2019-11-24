package com.kh.developers.business.model.vo;

import java.util.List;

import com.kh.developers.resume.model.vo.Activitie;
import com.kh.developers.resume.model.vo.Lang;
import com.kh.developers.resume.model.vo.Links;

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
	private List<Activitie> activities;
	private List<Lang> languages;
	private List<Links> links;
	
	private String memEmail;
	private String memPhone;
	private String favorite;
	private String readed;
	private int applNo;

}
