package com.kh.developers.business.model.service;

import java.util.Map;

import com.kh.developers.business.model.vo.Business;

public interface BusinessService {

	int insertEmployer(Map map);
	
	int insertBusiness(Business bus);
	
	Business selectBusInfo(int memberNo);
}
