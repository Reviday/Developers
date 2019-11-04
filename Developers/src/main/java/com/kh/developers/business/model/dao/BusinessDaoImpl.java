package com.kh.developers.business.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.developers.business.model.vo.Business;
import com.kh.developers.member.model.vo.Member;

@Repository
public class BusinessDaoImpl implements BusinessDao {

	
	@Override
	public int successAuth(SqlSessionTemplate session, Member m) {
		return session.update("business.successAuth", m);
	}
	
	@Override
	public int checkAuth(SqlSessionTemplate session, Member m) {
		return session.update("business.checkAuth", m);
	}

	@Override
	public int insertMember(SqlSessionTemplate session, Member m) {
		return session.insert("business.insertMember", m);
	}
	
	@Override
	public void createAuthKey(SqlSessionTemplate session, Map<String, Object> map) {
		session.insert("business.createAuthKey", map);
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
