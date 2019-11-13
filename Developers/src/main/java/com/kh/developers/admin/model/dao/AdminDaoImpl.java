package com.kh.developers.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.developers.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao{
	
	@Override
	public int selectloginLogCount(SqlSessionTemplate session) {
		return session.selectOne("");
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
	public List<Member> selectWithdrawMemberList(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds r=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("member.selectWithdrawMemberList", null, r);
	}
	
	@Override
	public int selectWithdrawMemberCount(SqlSessionTemplate session) {
		return session.selectOne("member.selectWithdrawMemberCount");
	}
	
	@Override
	public List<Member> selectMemberListBySearchLevel(SqlSessionTemplate session, Map<String, Object> searchValue,
			int cPage, int numPerPage) {
		RowBounds r=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("member.selectMemberListBySearchLevel", searchValue, r);
	}
	
	@Override
	public int selectMemberCountBySearchLevel(SqlSessionTemplate session, Map<String, Object> searchValue) {
		return session.selectOne("member.selectMemberCountBySearchLevel",searchValue);
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
	
	@Override
	public int selectMemberCount(SqlSessionTemplate session) {
		return session.selectOne("member.selectMemberCount");
	}
	
	@Override
	public List<Member> selectMemberList(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds r=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("member.selectMemberList", null, r);
	}
	
	
}
