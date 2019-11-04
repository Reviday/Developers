package com.kh.developers.business.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.developers.business.model.vo.Business;
import com.kh.developers.member.model.vo.Member;

public interface BusinessDao {
	
	int insertMember(SqlSessionTemplate session, Member m);
	
	void createAuthKey(SqlSessionTemplate session, Map<String, Object> map);
	
	int checkAuth(SqlSessionTemplate session, Member m);
	
	int successAuth(SqlSessionTemplate session, Member m);
	
	
//	사업장 로직
	int insertBusiness (SqlSessionTemplate session, Business bus);
	
	Business selectBusInfo (SqlSessionTemplate session, int memberNo);

}
