package com.kh.developers.search.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.developers.search.model.vo.Filter;
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
	
	@Override
	public List<Position> firstPsList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("search.firstPsList");
	}
	
	@Override
	public LikeMember selectLikeMemberOne(SqlSessionTemplate session, int memNo, int likeId) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("memNo", memNo);
		map.put("likeId", likeId);
		return session.selectOne("search.selectLikeMemberOne", map);
	}
	
	@Override
	public int insertLikeButton(SqlSessionTemplate session, int memNo, int likeId) {
		Map map = new HashMap();
		map.put("memNo", memNo);
		map.put("likeId", likeId);
		return session.insert("search.insertLikeButton", map);
	}
	
	@Override
	public int selectLikeCount(SqlSessionTemplate session, int likeId) {
		// TODO Auto-generated method stub
		return session.selectOne("search.selectLikeCount", likeId);
	}
	
	@Override
	public int deleteLikeButton(SqlSessionTemplate session, int memNo, int likeId) {
		Map map = new HashMap();
		map.put("memNo", memNo);
		map.put("likeId", likeId);
		return session.delete("search.deleteLikeButton", map);
	}
	
	@Override
	public List<Position> positionAjaxList(SqlSessionTemplate session, String jobName) {
		// TODO Auto-generated method stub
		return session.selectList("search.positionAjaxList", jobName);
	}
	
	@Override
	public Filter SelectMemberFilter(SqlSessionTemplate session, int memNo) {
		// TODO Auto-generated method stub
		return session.selectOne("search.SelectMemberFilter", memNo);
	}
	
	@Override
	public List<Position> positionLoginList(SqlSessionTemplate session, Filter filter) {
		// TODO Auto-generated method stub
		return session.selectList("search.positionLoginList", filter);
	}
	
	@Override
	public List<Position> positionAjaxLoginList(SqlSessionTemplate session, String jobName, Filter filter) {
		Map map = new HashMap();
		map.put("jobName", jobName);
		map.put("filter", filter);
		return session.selectList("search.positionAjaxLoginList", map);
	}
	
}
