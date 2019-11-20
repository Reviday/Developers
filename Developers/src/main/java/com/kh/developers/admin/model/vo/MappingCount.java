package com.kh.developers.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MappingCount {

	private int count;
	private String mapper;
	private String mapDiv;
	private String detail;
	private String authority;
}
