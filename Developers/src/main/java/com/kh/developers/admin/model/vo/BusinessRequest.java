package com.kh.developers.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BusinessRequest {

	private int requestNo;
	private Date requestDate;
	
	// business
	private int busNo;
	private String busName;
	private String busCountry;
	private String busArea;
	private String busAddress;
	private String busRegNo;
	private String busIncome;
	private String busIndustrial;
	private String busTotalEmp;
	private String busIntroduce; 
	private String busEstablishment;
	private String busEmail;
	private String busPhone;
	private String busWebsite;
	private String[] searchKeywords; 
	private String regPath;
	private Date busEnrollDate;
	private String newIncome;
	private String allIncome;
	private String busLogo;
	private String[] busImages;
	private String busStatus;
	
	//member
	private int memNo; // 회원넘버(시퀀스넘버로 부여)
	private String memEmail; // 회원 이메일
	private int memLevel; // 회원레벨(0 - 회원가입 미완료, 1 - 일반회원, 3 - 기업회원, 5 - 관리자)
	private String memPassword; // 회원 psssword
	private String memName; // 회원 이름
	private String memPhone; // 회원 전화번호
	private int memPoint; // 회원 포인트
	private String memDenied; // 해당 회원 차단 여부(기본값 N/ 영구정지 P) 
	private String memEmailCert; // 이메일 인증 여부(기본값 N)
	private String memReceiveEmail; // 이메일 수신 동의 여부(기본값 N)
	private Date memEnrollDatetime; // 회원 가입일(시간 포함)
	private String memEnrollIp; // 회원 가입 ip
	private Date memLastloginDatetime; // 마지막 접속일 
	private String memLastloginIp; // 마지막 접속 ip
	private String memProgileContent; // 자기소개(프로필용)
	private String memAdminmemo; // 회원에 대한 관리자용 메모
	private String memIcon; // 기업 회원 아이콘 경로
	private String memPhoto; // 회원 프로필 사진 경로
	private String memStatus; // 회원 계정 상태
	private Date memWithdrawalDate; // 회원 탈퇴 일시
	private Date memDeniedDate; //회원 차단 일시
	private int filter_id; //회원 필터id
}
