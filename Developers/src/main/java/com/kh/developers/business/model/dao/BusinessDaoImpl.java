package com.kh.developers.business.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BusinessDaoImpl implements BusinessDao {

	@Override
	public int insertEmployer(SqlSessionTemplate session,Map map) {
		
		return session.insert("business.insertEmployer",map);
	}

}
