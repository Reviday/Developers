package com.kh.developers.resume.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Activitie {
	private int actNo;
	private String memEmail;
	private Date startAct;
	private String actName;
	private String actDetail;
	private Date actDate;
}
