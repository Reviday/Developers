package com.kh.developers.business.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.developers.business.model.vo.Business;

@Repository
public class BusinessDaoImpl implements BusinessDao {

	@Override
	public int insertEmployer(SqlSessionTemplate session,Map map) {
		
		return session.insert("business.insertEmployer",map);
	}
	
	@Override
	public int insertBusiness(SqlSessionTemplate session, Business bus) {
		
		return session.insert("business.insertBusiness",bus);
	}
	
	@Override
	public Business selectBusInfo(SqlSessionTemplate session, int memberNo) {

		return session.selectOne("business.selectBusInfo",memberNo);
	}

}
