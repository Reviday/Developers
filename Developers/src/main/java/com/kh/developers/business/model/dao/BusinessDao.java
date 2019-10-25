package com.kh.developers.business.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.developers.business.model.vo.Business;

public interface BusinessDao {
	
	int insertEmployer (SqlSessionTemplate session, Map map);
	
	int insertBusiness (SqlSessionTemplate session, Business bus);

}
