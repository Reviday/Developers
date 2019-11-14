package com.kh.developers.search.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ResumeSearch {

	private int resume_no;
	private String mem_email;
	private String mem_name;
	private String mem_phone;
	private String intro;
	private Date resume_date;
	private String matchup;
	private int interests_no;
	private String status;
	
	
}
