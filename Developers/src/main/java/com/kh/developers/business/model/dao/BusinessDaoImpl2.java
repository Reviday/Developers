package com.kh.developers.business.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.developers.business.model.vo.Business;

@Repository
public class BusinessDaoImpl2 implements BusinessDao2 {

	@Override
	public int busLogoChange(SqlSession session, Business busInfo) {
		return session.update("business.busLogoChange", busInfo);
	}

}
