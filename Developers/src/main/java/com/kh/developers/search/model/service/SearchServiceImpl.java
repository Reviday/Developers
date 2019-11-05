package com.kh.developers.search.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.developers.search.model.dao.SearchDao;
import com.kh.developers.search.model.vo.Filter;
import com.kh.developers.search.model.vo.FilterCareer;
import com.kh.developers.search.model.vo.FilterCountry;
import com.kh.developers.search.model.vo.FilterLocation;
import com.kh.developers.search.model.vo.FilterOrderType;
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
	
	@Override
	public List<Position> positionAjaxList(String jobName) {
		List<Position> psList = dao.positionAjaxList(session, jobName);
		return psList;
	}
	
	@Override
	public Filter SelectMemberFilter(int memNo) {
		Filter filter = dao.SelectMemberFilter(session, memNo);
		return filter;
	}
	
	@Override
	public List<Position> positionLoginList(Filter filter) {
		List<Position> psList = dao.positionLoginList(session, filter);
		return psList;
	}
	
	@Override
	public List<Position> positionAjaxLoginList(String jobName, Filter filter) {
		List<Position> psList = dao.positionAjaxLoginList(session, jobName, filter);
		return psList;
	}

	@Override
	public List<FilterOrderType> selectFilterOrderType() {
		List<FilterOrderType> fot = dao.selectFilterOrderType(session);
		return fot;
	}

	@Override
	public List<FilterCountry> selectFilterCountry() {
		List<FilterCountry> fCountry = dao.selectFilterCountry(session);
		return fCountry;
	}

	@Override
	public List<FilterLocation> selectFilterLocation() {
		List<FilterLocation> fl = dao.selectFilterLocation(session);
		return fl;
	}

	@Override
	public List<FilterCareer> selectFilterCareer() {
		List<FilterCareer> fCareer = dao.selectFilterCareer(session);
		return fCareer;
	}
	
	
	
}
