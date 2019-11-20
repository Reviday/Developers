package com.kh.developers.search.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MainAdCompany {
	
	private int ad_no;
	private int bus_no;
	private String bus_name;
	private String[] bus_images;
	private String position;
	private int po_count;
	
}
