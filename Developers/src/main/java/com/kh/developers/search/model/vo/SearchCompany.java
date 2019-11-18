package com.kh.developers.search.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class SearchCompany {

	private int bus_no; //회사번호
	private String bus_name; //회사이름
	private String bus_country; //회사국적
	private String bus_area; //회사지역
	private String bus_total_emp; //회사직원수
	private String bus_introduce; //회사소개
	private String bus_logo; //회사로고
	private String[] bus_images; //회사사진
	private String new_income; //신규입사자 연봉
	private String all_income; //전체입사자 연봉
	private String bus_industrial; //회사 직무분야
	
}
