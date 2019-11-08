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
	public int selectMemberCountBySearch(SqlSessionTemplate session, Map<String, String> searchValue) {
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
