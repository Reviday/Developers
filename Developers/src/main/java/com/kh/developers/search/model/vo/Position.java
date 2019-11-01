package com.kh.developers.search.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Position {

	private int position_no; //포지션번호(enroll_position/position_no)
	private int bus_no; //회사 번호(business_info/bus_no), 
	private String bus_name; //회사 이름(business_info/bus_name), 
	private String bus_country; //회사 국가(business_info/bus_country),
	private String bus_area; //회사 지역(business_info/bus_area),
	private String bus_address; //회사 근무지 주소(business_info/bus_address), 
	private String apply_email; //회사 이메일(지원 알림 이메일)(enroll_position/apply_email), 
	private String[] job_type; //직무(최고 3개)(enroll_position/job_type), 
	private String career; //경력(enroll_position/career), 
	private String[] tag; //태그(enroll_position/tag),
	private Date dead_date; //마감일(enroll_position/dead_date), 
	private String position; //포지션명(enroll_position/position), 
	private String position_info; //포지션 공고/서론(enroll_position/position_info), 
	private String mainbusiness; //주요업무(enroll_position/mainbusiness), 
	private String qualification; //자격요건(enroll_position/qualification), 
	private String preference; //우대사항(선택)(enroll_position/preference), 
	private String benefit; //혜택 및 복지(enroll_position/benefit),
	private String[] bus_images; //bus_회사 사진(business_info/bus_images),
	private String bus_logo; //회사 로고(business_info/bus_logo)  
	
}
