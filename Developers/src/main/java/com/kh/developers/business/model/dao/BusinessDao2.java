package com.kh.developers.business.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.developers.business.model.vo.Business;
import com.kh.developers.member.model.vo.Member;

public interface BusinessDao2 {
	int busLogoChange(SqlSession session, Business busInfo);
	
	//지원자 리스트
	List<Member> selectBusApplNew(SqlSession session, int cPage, int numPerPage);
	List<Member> selectBusApplStart(SqlSession session, int cPage, int numPerPage);
	List<Member> selectBusApplPass(SqlSession session, int cPage, int numPerPage);
	List<Member> selectBusApplFail(SqlSession session, int cPage, int numPerPage);
	List<Member> selectBusApplEnd(SqlSession session, int cPage, int numPerPage);
	
	//지원자 리스트 카운트
	int selecBusApplNewCount(SqlSession session);
	int selecBusAppStartCount(SqlSession session);
	int selecBusApplPassCount(SqlSession session);
	int selecBusApplFailCount(SqlSession session);
	int selecBusApplEndCount(SqlSession session);
	
}
