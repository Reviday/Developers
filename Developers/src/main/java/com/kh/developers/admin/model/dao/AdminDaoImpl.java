package com.kh.developers.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.developers.admin.model.vo.BusinessRequest;
import com.kh.developers.admin.model.vo.EnrollPosition;
import com.kh.developers.admin.model.vo.MemberLoginLog;
import com.kh.developers.admin.model.vo.RequestMappingLog;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao{
	
	@Override
	public int selectVisitorChartData(SqlSessionTemplate session, Map<String, Object> map) {
		return session.selectOne("log.selectVisitorChartData", map);
	}
	
	@Override
	public Map<String, Object> selectHighestVisitor(SqlSessionTemplate session) {
		return session.selectOne("log.selectHighestVisitor");
	}
	
	@Override
	public List<Integer> selectVisitorStats(SqlSessionTemplate session) {
		return session.selectList("log.selectVisitorStats");
	}
	
	@Override
	public List<Map<String, String>> selectJabField(SqlSessionTemplate session) {
		return session.selectList("admin.selectJabField");
	}
	
	@Override
	public int positionRejection(SqlSessionTemplate session, int positionNo) {
		return session.update("admin.positionRejection", positionNo);
	}
	
	@Override
	public int positionApproval(SqlSessionTemplate session, int positionNo) {
		return session.update("admin.positionApproval", positionNo);
	}
	
	@Override
	public EnrollPosition selectPositionOne(SqlSessionTemplate session, int positionNo) {
		return session.selectOne("admin.selectPositionOne", positionNo);
	}
	
	@Override
	public List<EnrollPosition> selectEnrollPositionList(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds r=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("admin.selectEnrollPositionList", null, r);
	}
	
	@Override
	public int selectEnrollPositionCount(SqlSessionTemplate session) {
		return session.selectOne("admin.selectEnrollPositionCount");
	}
	
	@Override
	public int deletMemBusConnection(SqlSessionTemplate session, int busNo) {
		return session.delete("admin.deletMemBusConnection", busNo);
	}
	
	@Override
	public int deleteBusinessInfo(SqlSessionTemplate session, int busNo) {
		return session.delete("admin.deleteBusinessInfo", busNo);
	}
	
	@Override
	public int updateBusinessInfoStatus(SqlSessionTemplate session, int busNo) {
		return session.update("admin.updateBusinessInfoStatus", busNo);
	}
	
	@Override
	public int deleteBusinessRequest(SqlSessionTemplate session, int requestNo) {
		return session.delete("admin.deleteBusinessRequest", requestNo);
	}
	
	@Override
	public int updateMemberLevel(SqlSessionTemplate session, int memNo, int level) {
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("memNo", memNo);
		map.put("level", level);
		return session.update("admin.updateMemberLevel", map);
	}
	
	@Override
	public Member selectMemberOne(SqlSessionTemplate session, int memNo) {
		return session.selectOne("admin.selectMemberOne", memNo);
	}
	
	@Override
	public Business selectBusinessOne(SqlSessionTemplate session, int busNo) {
		return session.selectOne("admin.selectBusinessOne", busNo);
	}
	
	@Override
	public int selectbusinessRequestCount(SqlSessionTemplate session) {
		return session.selectOne("admin.selectbusinessRequestCount");
	}
	
	@Override
	public List<BusinessRequest> selectbusinessRequestList(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds r=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("admin.selectbusinessRequestList", null, r);
	}
	
	@Override
	public List<Map<String, Integer>> selectMemberStats(SqlSessionTemplate session) {
		return session.selectList("member.selectMemberStats");
	}
	
	@Override
	public List<Map<String, Integer>> selectLoginLogChartData(SqlSessionTemplate session, String data) {
		Map<String, String> map=new HashMap<String, String>();
		map.put("data", data);
		return session.selectList("log.selectLoginLogChartData", map);
	}
	
	@Override
	public List<Integer> selectLoginLogStats(SqlSessionTemplate session) {
		return session.selectList("log.selectLoginLogStats");
	}
	
	@Override
	public int insertTag(SqlSessionTemplate session, String tag, int busNo) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("tag", tag);
		map.put("busNo", busNo);
		return session.insert("admin.insertTag", map);
	}
	
	@Override
	public int deleteTagOpinion(SqlSessionTemplate session, int tagNo) {
		return session.delete("admin.deleteTagOpinion", tagNo);
	}
	
	@Override
	public List<Map<String, Object>> selectTagOpinionList(SqlSessionTemplate session, int cPage, int numPerPage) {
		return session.selectList("admin.selectTagOpinionList");
	}
	
	@Override
	public int selectTagOpinionCount(SqlSessionTemplate session) {
		return session.selectOne("admin.selectTagOpinionCount");
	}
	
	@Override
	public void insertRequestMappingLog(SqlSessionTemplate session, RequestMappingLog rml) {
		session.insert("log.insertRequestMappingLog", rml);
	}
	
	@Override
	public List<MemberLoginLog> selectLoginLogListBySearch(SqlSessionTemplate session, Map<String, Object> searchValue,
			int cPage, int numPerPage) {
		RowBounds r=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("log.selectLoginLogListBySearch", searchValue, r);
	}
	
	@Override
	public int selectLoginLogCountBySearch(SqlSessionTemplate session, Map<String, Object> searchValue) {
		return session.selectOne("log.selectLoginLogCountBySearch",searchValue);
	}
	
	@Override
	public int restoreMember(SqlSessionTemplate session, Member m) {
		return session.update("member.restoreMember", m);
	}
	
	@Override
	public List<Member> selectWithdrawMemberListBySearch(SqlSessionTemplate session, Map<String, Object> searchValue,
			int cPage, int numPerPage) {
		RowBounds r=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("member.selectWithdrawMemberListBySearch", searchValue, r);
	}
	
	@Override
	public int selectWithdrawMemberCountBySearch(SqlSessionTemplate session, Map<String, Object> searchValue) {
		return session.selectOne("member.selectWithdrawMemberCountBySearch", searchValue);
	}
	
	@Override
	public List<Member> selectMemberListBySearch(SqlSessionTemplate session, Map<String, Object> searchValue, int cPage,
			int numPerPage) {
		RowBounds r=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("member.selectMemberListBySearch", searchValue, r);
	}
	
	@Override
	public int selectMemberCountBySearch(SqlSessionTemplate session, Map<String, Object> searchValue) {
		return session.selectOne("member.selectMemberCountBySearch",searchValue);
	}
	
	@Override
	public int deleteMember(SqlSessionTemplate session, Member m) {
		return session.update("member.deleteMemberByAdmin", m);
	}
	
	@Override
	public int updateMember(SqlSessionTemplate session, Member m) {
		return session.update("member.updateMemberByAdmin", m);
	}
	
}
