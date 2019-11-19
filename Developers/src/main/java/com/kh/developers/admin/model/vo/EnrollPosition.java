package com.kh.developers.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EnrollPosition {
	private int positionNo;
	private int busNo;
	private String busName;
	private String applyEmail;
	private String[] jobType;
	private String[] career;
	private String[] tag;
	private Date deadDate;
	private String position;
	private String positionInfo;
	private String mainbusiness;
	private String qualification;
	private String preference;
	private String benefit;
	private Date enrollDate;
	private int likeId;
	private String lat;
	private String status;
	private String longg;
	private String[] positionSalary;
}
