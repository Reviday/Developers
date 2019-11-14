package com.kh.developers.recommend.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Friend {

	private int mem_no; //친구할 사람 번호
	private int friend_no; //친구받을 사람 번호
	private String recommend_status; //추천여부 디폴트 Y
	private String friend_photo; //친구사진
}
