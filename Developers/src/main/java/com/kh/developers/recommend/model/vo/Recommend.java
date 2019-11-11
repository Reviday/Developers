package com.kh.developers.recommend.model.vo;

import com.kh.developers.search.model.vo.BookMark;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Recommend {

	private int mem_no; //추천할 멤버번호
	private int recommend_no; //추천받을 멤버번호
	private String recommend_name; //추천받는 사람 이름(임의지정 가능)
	private String realationship; //관계
	private String recommend_text; //추천사
	
}
