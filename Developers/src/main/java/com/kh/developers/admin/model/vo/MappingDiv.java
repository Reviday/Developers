package com.kh.developers.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MappingDiv {

	private int mapNo; // 시퀀스 PK
	private String mapUrl; // 수행 mapping 값(ta_request_mapping_log과 조인되는 기준이기도 함)
	private String mapDiv; // 기능을 구분하는 기준(기능/페이지 전환 등)
	private String mapAuthority; // 해당 mapping에 접근할 수 있는 권한(비회원/회원/기업회원/관리자)
}
