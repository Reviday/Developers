package com.kh.developers.search.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FilterOrderType {

	private int order_no; //프라이머리키
	private String order_type; //정렬타잎
	
}
