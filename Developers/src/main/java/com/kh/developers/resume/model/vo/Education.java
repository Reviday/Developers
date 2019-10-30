package com.kh.developers.resume.model.vo;

import java.util.Date;

import javax.servlet.http.HttpServlet;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Education {
	private int edNo;
	private String memEmail;
	private String startEd;
	private String endEd;
	private String schoolName;
	private String majorName;
	private String subjectName;
	private Date edDate;
	private int resumeNo;
}
