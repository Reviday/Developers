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
import com.kh.developers.member.model.vo.MyApp;
import com.kh.developers.member.model.vo.Point;
import com.kh.developers.search.model.vo.Position;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	
	
	
	
	@Override
	public int RealdeleteMember(SqlSessionTemplate session, int memNo) {
		// TODO Auto-generated method stub
		return session.update("member.RealdeleteMember", memNo);
	}

	@Override
	public int updateMemberPoint(SqlSessionTemplate session, Point p) {
		// TODO Auto-generated method stub
		return session.update("member.updateMemberPoint",p);
	}

	@Override
	public Point selectaddPoint(SqlSessionTemplate session, int pointNo) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectaddPoint",pointNo);
	}

	@Override
	public int selectApplBusNo(SqlSessionTemplate session, int applNo) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectApplBusNo",applNo);
	}

	@Override
	public int addPoint(SqlSessionTemplate session, Point p) {
		// TODO Auto-generated method stub
		return session.insert("member.addPoint",p);
	}

	@Override
	public List<Point> selectMyPoint(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectMyPoint",m);
	}

	@Override
	public int selectMaCount(SqlSessionTemplate session, MyApp ma) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMaCount",ma);
	}

	@Override
	public List<MyApp> selectMa(SqlSessionTemplate session,MyApp ma, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds row=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("member.selectMa",ma,row);
	}

	@Override
	public Member selectMemNo(SqlSessionTemplate session, int memNo) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMemNo",memNo);
	}

	@Override
	public List<MyApp> selectMemAppl(SqlSessionTemplate session, Member m, int cPage, int numPerPage) {
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
	public int applAns(SqlSessionTemplate session, int applNo, int number) {
		// TODO Auto-generated method stub
		if(number==1) {
		 session.update("member.applAnsY", applNo);
		}else {
	 session.update("member.applAnsN", applNo);	
		}
		return applNo;
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
