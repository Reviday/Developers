package com.kh.developers.business.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.developers.business.model.vo.Business;
import com.kh.developers.member.model.vo.Member;

public interface BusinessDao2 {
	int busLogoChange(SqlSession session, Business busInfo);
	
	//지원자 리스트
	List<Member> selectBusApplNew(SqlSession session);
	List<Member> selectBusApplStart(SqlSession session);
	List<Member> selectBusApplPass(SqlSession session);
	List<Member> selectBusApplFail(SqlSession session);
	List<Member> selectBusApplEnd(SqlSession session);
	
	//지원자 리스트 카운트
	int selecBusApplNewCount(SqlSession session);
	int selecBusAppStartCount(SqlSession session);
	int selecBusApplPassCount(SqlSession session);
	int selecBusApplFailCount(SqlSession session);
	int selecBusApplEndCount(SqlSession session);
	
}
