package com.kh.developers.search.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.developers.search.model.dao.SearchDao;
import com.kh.developers.search.model.vo.JobField;
import com.kh.developers.search.model.vo.LikeMember;
import com.kh.developers.search.model.vo.Position;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	//직업분야리스트
	@Override
	public List<JobField> jobfieldList() {
		
		List<JobField> list = dao.jobfieldList(session);	
		return list;
	}
	//직업분야리스트(Ajax)
	
	@Override
	public List<JobField> jobfieldAjaxList(String jobName) {
		
		List<JobField> list = dao.jobfieldAjaxList(session, jobName);
		return list;
	}
	
	@Override
	public List<Position> positionList() {
		List<Position> psList = dao.positionList(session);
		return psList;
	}

	@Override
	public Position companyInfoList(int positionNo) {
		Position p = dao.companyInfoList(session, positionNo);
		return p;
	}

	@Override
	public List<LikeMember> likeMemberList(int likeNo) {
		List<LikeMember> list = dao.likeMemberList(session, likeNo);
		return list;
	}
	
	@Override
	public List<Position> firstPsList() {
		List<Position> firstPsList = dao.firstPsList(session);
		return firstPsList;
	}
	
	@Override
	public LikeMember selectLikeMemberOne(int memNo, int likeId) {
		LikeMember lm = dao.selectLikeMemberOne(session, memNo, likeId);
		return lm;
	}
	
	@Override
	public int insertLikeButton(int memNo, int likeId) {
		int result = dao.insertLikeButton(session, memNo, likeId);
		return result;
	}
	
	@Override
	public int selectLikeCount(int likeId) {
		int likeCount = dao.selectLikeCount(session, likeId);
		return likeCount;
	}
	
	@Override
	public int deleteLikeButton(int memNo, int likeId) {
		int result = dao.deleteLikeButton(session, memNo, likeId);
		return result;
	}
	
}
