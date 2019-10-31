package com.kh.developers.search.model.vo;

import java.util.Date;

import com.kh.developers.resume.model.vo.Activitie;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class JobField {

	private int job_no; //직업분야넘버
	private String job_code; //직업분야코드
	private String job_name; //직업분야이름
	
}
