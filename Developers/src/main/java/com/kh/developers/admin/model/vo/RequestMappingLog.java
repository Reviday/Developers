package com.kh.developers.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RequestMappingLog {

	private int rmlNo; // 시퀀스 PK 
	private int rmlMemNo; // 회원의 no인데, 비로그인도 있을 수 있으므로 null이 가능하다.
	private String rmlUserEmail; // 회원의 이메일, 마찬가지로 비로그인이 가능하므로 null이 가능
	private Date rmlDatetime; // 사용 일시(어느 시간대에 많이 이용되는지)
	private String rmlIp; // ip
	private String rmlUseragent; // 수행한 브라우저의 user agent
	private String rmlUrl; // 수행하는 mapping 값
	private String rmlReferer; // 수행하기 전 mapping 값
}

