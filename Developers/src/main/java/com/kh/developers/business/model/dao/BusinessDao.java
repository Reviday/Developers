package com.kh.developers.business.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface BusinessDao {
	
	int insertEmployer (SqlSessionTemplate session, Map map);

}
