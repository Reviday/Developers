package com.kh.developers.resume.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Education {
	private int edNo;
	private String memEmail;
	private Date startEd;
	private Date endEd;
	private String schoolName;
	private String majorName;
	private String subjectName;
	private Date edDate;
}
