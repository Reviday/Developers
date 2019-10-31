package com.kh.developers.business.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.kh.developers.business.model.vo.Business;

public interface BusinessDao2 {
	int busLogoChange(SqlSession session, Business busInfo);
}
