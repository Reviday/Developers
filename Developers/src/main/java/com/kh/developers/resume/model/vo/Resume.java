package com.kh.developers.resume.model.vo;

import java.util.Date;

import com.kh.developers.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Resume {
	private String memEmail;
	private String memName;
	private String memPhone;
	private String intro;
	private Date resumeDate;
	
}
