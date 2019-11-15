package com.kh.developers.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.developers.admin.model.vo.MemberLoginLog;
import com.kh.developers.business.model.vo.Applicant;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.member.model.vo.Interests;
import com.kh.developers.member.model.vo.Member;
import com.kh.developers.member.model.vo.MyLike;
import com.kh.developers.search.model.vo.Position;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	
	
	
	@Override
	public List<Applicant> selectMemAppl(SqlSessionTemplate session, Member m, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds row=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("member.selectMemAppl",m,row);
	}

	@Override
	public int selectMemApplCount(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMemApplCount",m);
	}

	@Override
	public List<Position> selectBookMark(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectBookMark",m);
	}

	@Override
	public int applAns(SqlSessionTemplate session, int memNo, int number) {
		// TODO Auto-generated method stub
		if(number==1) {
		return session.update("member.applAnsY", memNo);
		}else {
		return session.update("member.applAnsN", memNo);	
		}
	}

	@Override
	public Business selectBusOne(SqlSessionTemplate session, String busNo) {
		// TODO Auto-generated method stub
		return session.selectOne("business2.selectBusOne", busNo);
	}

	@Override
	public List<Applicant> selectApplicant(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectApplicant",m);
	}

	@Override
	public List<Position> selectLike(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectLike",m);
	}

	@Override
	public int busLogoChange(SqlSessionTemplate session, Member memInfo) {
		// TODO Auto-generated method stub
		return session.update("member.busLogoChange",memInfo);
	}

	@Override
	public int memberUpdate(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.update("member.memberUpdate",m);
	}

	@Override
	public int insertInterests(SqlSessionTemplate session, Interests i) {
		// TODO Auto-generated method stub
		return session.insert("member.insertInterests",i);
	}

	@Override
	public int lastStepEnrollEnd(SqlSessionTemplate session, Member m) {
		return session.update("member.lastStepEnrollEnd", m);
	}
	
	@Override
	public int successAuth(SqlSessionTemplate session, Member m) {
		return session.update("member.successAuth", m);
	}
	
	@Override
	public int checkAuth(SqlSessionTemplate session, Member m) {
		return session.update("member.checkAuth", m);
	}

	@Override
	public int insertMember(SqlSessionTemplate session, Member m) {
		return session.insert("member.insertMember", m);
	}
	
	@Override
	public void createAuthKey(SqlSessionTemplate session, Map<String, Object> map) {
		session.insert("member.createAuthKey", map);
	}
	
	@Override
	public Member selectMemberOne(SqlSessionTemplate session, Member m) {
		return session.selectOne("member.selectMemberOne", m);
	}
	
	@Override
	public int insertFilter(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.insert("member.insertFilter");
	}
	
	@Override
	public Interests selectInterests(SqlSessionTemplate session, String memEmail) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectInterests", memEmail);
	}
	
	@Override
	public List<Position> selectPositionList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectPositionList");
	}
	
	@Override
	public List<Position> selectInterPositionList(SqlSessionTemplate session, Interests inter) {

		return session.selectList("member.selectInterPositionList", inter);
	}
	
	@Override
	public List<Position> selectWeekPositionList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectWeekPositionList");
	}
	
	
	
	@Override
	public int updateInterests(SqlSessionTemplate session, Interests i) {
		// TODO Auto-generated method stub
		return session.update("resume.updateInterests",i);
	}

	@Override
	public void insertLoginLog(SqlSessionTemplate session, MemberLoginLog mll) {
		session.insert("member.insertLoginLog", mll);
	}
}
