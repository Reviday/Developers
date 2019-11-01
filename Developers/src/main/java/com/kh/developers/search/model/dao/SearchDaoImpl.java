package com.kh.developers.search.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.developers.search.model.vo.JobField;
import com.kh.developers.search.model.vo.LikeMember;
import com.kh.developers.search.model.vo.Position;

@Repository
public class SearchDaoImpl implements SearchDao {

	@Override
	public List<JobField> jobfieldList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("search.jobfieldList");
	}
	
	@Override
	public List<JobField> jobfieldAjaxList(SqlSessionTemplate session, String jobName) {
		// TODO Auto-generated method stub
		return session.selectList("search.jobfieldAjaxList", jobName);
	}
	
	@Override
	public List<Position> positionList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("search.positionList");
	}

	@Override
	public Position companyInfoList(SqlSessionTemplate session, int positionNo) {
		// TODO Auto-generated method stub
		return session.selectOne("search.companyInfoList", positionNo);
	}

	@Override
	public List<LikeMember> likeMemberList(SqlSessionTemplate session, int likeNo) {
		// TODO Auto-generated method stub
		return session.selectList("search.likeMemberList", likeNo);
	}
	
	
	
}
