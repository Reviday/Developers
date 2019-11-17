package com.kh.developers.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.developers.admin.model.vo.MemberLoginLog;
import com.kh.developers.admin.model.vo.RequestMappingLog;
import com.kh.developers.admin.model.vo.VisitCount;
import com.kh.developers.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao{
	
	@Override
	public List<Map<String, Integer>> selectLoginLogChartData(SqlSessionTemplate session) {
		return session.selectList("log.selectLoginLogChartData");
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
