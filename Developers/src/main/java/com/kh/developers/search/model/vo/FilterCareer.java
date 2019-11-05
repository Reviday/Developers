package com.kh.developers.search.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FilterCareer {

	private int fc_no; //프라이머리키
	private String career; //경력종류
	
}
