package com.kh.developers.search.model.service;

import java.util.List;
import java.util.Map;

import com.kh.developers.search.model.vo.Filter;
import com.kh.developers.search.model.vo.FilterCareer;
import com.kh.developers.search.model.vo.FilterCountry;
import com.kh.developers.search.model.vo.FilterLocation;
import com.kh.developers.search.model.vo.FilterOrderType;
import com.kh.developers.search.model.vo.JobField;
import com.kh.developers.search.model.vo.LikeMember;
import com.kh.developers.search.model.vo.Position;

public interface SearchService {
	//직업분야리스트 
	List<JobField> jobfieldList();
	//직업분야리스트(Ajax)
	List<JobField> jobfieldAjaxList(String jobName);
	//탐색페이지(포지션리스트)
	List<Position> positionList();
	//포지션정보페이지 포지션정보
	Position companyInfoList(int positionNo);
	//포지션정보페이지 좋아요 리스트
	List<LikeMember> likeMemberList(int likeNo);
	//적극채용중인회사 리스트
	List<Position> firstPsList();
	//회원의 포지션 글 좋아요 여부
	LikeMember selectLikeMemberOne(int memNo, int likeId);
	//포지션 좋아요 회원 추가
	int insertLikeButton(int memNo, int likeId);
	//포지션글 좋아요 갯수
	int selectLikeCount(int likeId);
	//포지션 좋아요 회원 삭제
	int deleteLikeButton(int memNo, int likeId);
	//직무분야 검색했을 때의 포지션 리스트(비로그인)
	List<Position> positionAjaxList(String jobName);
	//회원 필터 검색
	Filter SelectMemberFilter(int memNo);
	//필터 적용한 포지션리스트
	List<Position> positionLoginList(Filter filter);
	//직무분야 검색했을 때의 포지션 리스트(로그인)
	List<Position> positionAjaxLoginList(String jobName, Filter filter);
	// 필터 종류 
	List<FilterOrderType> selectFilterOrderType();
	List<FilterCountry> selectFilterCountry();
	List<FilterLocation> selectFilterLocation();
	List<FilterCareer> selectFilterCareer();
	// 회원필터 적용한 포지션리스트
	List<Position> positionLoginFilterList(Map map);
	// 회원필터 변경
	int updateMemFilter(Map map);
	// 회원필터, 직무분야 적용한 포지션 리스트
	List<Position> positionLoginFilterJobNameList(Map map);
	// 포지션정보페이지의 추천채용 포지션리스트
	List<Position> recommandPositionList(Position p);
}
