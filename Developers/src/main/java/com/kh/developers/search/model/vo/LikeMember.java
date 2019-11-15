package com.kh.developers.search.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class LikeMember {
	
	private int like_no; //좋아요 프라이머리키
	private int like_id; //좋아요 id
	private int mem_no; //좋아요 한 멤버 id
	private String mem_name; //좋아요 한 멤버 이름
	private String mem_icon; //좋아요 한 멤버 프로필 사진
	
}
