package com.kh.developers.business.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.developers.business.model.vo.Applicant;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.member.model.vo.Member;

@Repository
public class BusinessDaoImpl2 implements BusinessDao2 {

	@Override
	public int busLogoChange(SqlSession session, Business busInfo) {
		return session.update("business2.busLogoChange", busInfo);
	}

	@Override
	public List<Applicant> selectBusAppl(SqlSession session, Map map,  int cPage, int numPerPage) {
		RowBounds row=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("business2.selectBusAppl", map, row);
	}


	@Override
	public int selecBusApplCount(SqlSession session, Map map) {
		return session.selectOne("business2.selectBusApplCount", map);
	}
	
	@Override
	public int insertApplicant(SqlSession session, Map map) {
		return session.insert("business2.insertApplicant", map);
	}

	@Override
	public int deleteApplicant(SqlSession session, Map map) {
		return session.update("business2.deleteApplicant", map);
	}

	
	
	
	@Override
	public int insertApplLike(SqlSession session, Map map) {
		return session.insert("business2.insertApplLike", map);
	}
	

	@Override
	public int deleteApplLike(SqlSession session, Map map) {
		return session.insert("business2.deleteApplLike", map);
	}
	

	@Override
	public int selectCheckLike(SqlSession session, Map map) {
		return session.selectOne("business2.selectCheckLike", map);
	}

	@Override
	public Member selectApplicant(SqlSession session, int memNo) {
		return session.selectOne("business2.selectApplicant", memNo);
	}

	
	
}
