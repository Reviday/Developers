package com.kh.developers.search.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Filter {

	private int filter_no; //필터no
	private int filter_id; //필터id
	private String country; //국가
	private String location; //지역
	private String career; //경력
	private String job_sort; //정렬
	
}
