package com.kh.developers.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.developers.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao{

	
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
