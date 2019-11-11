package com.kh.developers.admin.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberLoginLog {

	private int mllNo; // 시퀀스 PK 
	private String mllSuccess; // 로그인 성공 여부
	private int mllMemNo; // 로그인 한 회원 PK
	private String mllUserEmail; // 로그인 시도할 때에 입력한 이메일
	private Date mllDatetime; // 로그인 일시
	private String mllIp; // 로그인 한 IP
	private String mllReason; // 로그인 성공/실패시 이유
	private String mllUseragent; // 로그인한 브라우저의 user agent
	private String mllUrl; // 로그인한 페이지 주소
	private String mllReferer; // 이전 페이지 주소
}
