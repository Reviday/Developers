package com.kh.developers.business.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.developers.business.model.vo.Business;
import com.kh.developers.member.model.vo.Member;

@Repository
public class BusinessDaoImpl2 implements BusinessDao2 {

	@Override
	public int busLogoChange(SqlSession session, Business busInfo) {
		return session.update("business.busLogoChange", busInfo);
	}

	@Override
	public List<Member> selectBusApplNew(SqlSession session, int cPage, int numPerPage) {
		RowBounds row=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("business.selectBusApplNew", null, row);
	}

	@Override
	public List<Member> selectBusApplStart(SqlSession session, int cPage, int numPerPage) {
		return session.selectList("business.selectBusApplStart");
	}

	@Override
	public List<Member> selectBusApplPass(SqlSession session, int cPage, int numPerPage) {
		return session.selectList("business.selectBusApplPass");
	}

	@Override
	public List<Member> selectBusApplFail(SqlSession session, int cPage, int numPerPage) {
		return session.selectList("business.selectBusApplFail");
	}

	@Override
	public List<Member> selectBusApplEnd(SqlSession session, int cPage, int numPerPage) {
		return session.selectList("business.selectBusApplEnd");
	}

	@Override
	public int selecBusApplNewCount(SqlSession session) {
		return session.selectOne("business.selectBusApplNewCount");
	}

	@Override
	public int selecBusAppStartCount(SqlSession session) {
		return session.selectOne("business.selectBusApplStartCount");
	}

	@Override
	public int selecBusApplPassCount(SqlSession session) {
		return session.selectOne("business.selectBusApplPassCount");
	}

	@Override
	public int selecBusApplFailCount(SqlSession session) {
		return session.selectOne("business.selectBusApplFailCount");
	}

	@Override
	public int selecBusApplEndCount(SqlSession session) {
		return session.selectOne("business.selectBusApplEndCount");
	}
	
	
}
