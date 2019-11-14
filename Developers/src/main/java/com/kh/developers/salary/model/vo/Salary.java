package com.kh.developers.salary.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Salary {
	
	private String jobGroup;
	private String jobField;
	private int jobYear;
	private int jobAvgSalary;
	
	
	

}
