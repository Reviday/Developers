package com.kh.developers.search.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Tag {

	private int tag_no; //태그번호
	private int bus_no; //회사번호
	private String tag; //태그
	
}
