package com.kh.developers.search.model.service;

import java.util.List;
import java.util.Map;

import com.kh.developers.business.model.vo.Applicant;
import com.kh.developers.member.model.vo.Member;
import com.kh.developers.recommend.model.vo.Recommend;
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
import com.kh.developers.search.model.vo.ResumeSearch;
import com.kh.developers.search.model.vo.Tag;

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
	// 회사 포지션 리스트
	List<Position> companyPositionList(int busNo);
	// 회사 태그 리스트
	List<Tag> companyTagList(int busNo);
	// 회사소개 정보 
	Company companyInfo(int busNo);
	// 북마크 정보
	BookMark selectBookMark(int memNo, int positionNo);
	//북마크 추가
	int insertBookMark(int memNo, int positionNo);
	//북마크 제거
	int deleteBookMark(int memNo, int positionNo);
	//태그의견 저장
	int insertTagOpinion(int busNo, String tag);
	//멤버 조회
	Member SelectMember(int memNo);
	//이력서 조회
	List<ResumeSearch> selectResume(String memEmail);
	//나를 추천한 리스트 조회
	List<Recommend> selectRecommendList(int memNo);
	//포지션지원여부확인
	Applicant selectApplicant(int memNo, int positionNo);
	//포지션지원(추천인있음)
	int insertPositionRecommend(Map map);
	//포지션지원(추천인없음)
	int insertPosition(Map map);
	//헤더->검색모달(첫검색)
	List<Tag> selectTagList();
	//헤더 -> 태그검색(태그가 있는 회사 검색)
	List<Integer> selectCompanyTagList(String text);
	//헤더 -> 태그검색(태그로 회사리스트 조회)
	Company selectCompanyList(int busNo);
	//헤더 -> 태그검색(태그리스트)
	List<Tag> selectTagCompanyList(List<Integer> list);
}
