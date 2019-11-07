package com.kh.developers.search.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.developers.search.model.dao.SearchDao;
import com.kh.developers.search.model.vo.BookMark;
import com.kh.developers.search.model.vo.Company;
import com.kh.developers.search.model.vo.Filter;
import com.kh.developers.search.model.vo.FilterCareer;
import com.kh.developers.search.model.vo.FilterCountry;
import com.kh.developers.search.model.vo.FilterLocation;
import com.kh.developers.search.model.vo.FilterOrderType;
import com.kh.developers.search.model.vo.JobField;
import com.kh.developers.search.model.vo.LikeMember;
import com.kh.developers.search.model.vo.Position;
import com.kh.developers.search.model.vo.Tag;

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

	@Override
	public List<Position> positionLoginFilterList(Map map) {
		List<Position> psList = dao.positionLoginFilterList(session, map);
		return psList;
	}

	@Override
	public int updateMemFilter(Map map) {
		int result = dao.updateMemFilter(session, map);
		return result;
	}
	
	@Override
	public List<Position> positionLoginFilterJobNameList(Map map) {
		List<Position> psList = dao.positionLoginFilterJobNameList(session, map);
		return psList;
	}
	
	@Override
	public List<Position> recommandPositionList(Position p) {
		List<Position> rcList = dao.recommandPositionList(session, p);
		return rcList;
	}

	@Override
	public List<Position> companyPositionList(int busNo) {
		List<Position> psList = dao.companyPositionList(session, busNo);
		return psList;
	}

	@Override
	public List<Tag> companyTagList(int busNo) {
		List<Tag> tagList = dao.companyTagList(session, busNo);
		return tagList;
	}

	@Override
	public Company companyInfo(int busNo) {
		Company company = dao.companyInfo(session, busNo);
		return company;
	}
	
	@Override
	public BookMark selectBookMark(int memNo, int positionNo) {
		BookMark bmList = dao.selectBookMark(session, memNo, positionNo);
		return bmList;
	}

	@Override
	public int insertBookMark(int memNo, int positionNo) {
		int result = dao.insertBookMark(session, memNo, positionNo);
		return result;
	}

	@Override
	public int deleteBookMark(int memNo, int positionNo) {
		int result = dao.deleteBookMark(session, memNo, positionNo);
		return result;
	}
	
	@Override
	public int insertTagOpinion(int busNo, String tag) {
		int result = dao.insertTagOpinion(session, busNo, tag);
		return result;
	}
	
	
}
