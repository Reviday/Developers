package com.kh.developers.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Interests {
	private int interestNo;
	private String memEmail;
	private String jobName; 
	private String[] duty;
	private String career;
	private int salary;
	private String[] skill;
	private Date interestsDate;
}
