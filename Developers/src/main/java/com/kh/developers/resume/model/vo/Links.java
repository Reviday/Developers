package com.kh.developers.resume.model.vo;

import java.util.Date;

import javax.servlet.http.HttpServlet;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Links {
	private int linksNo;
	private String memEmail;
	private String linksAddr;
	private Date linksDate;
	private int resumeNo;
	
}
