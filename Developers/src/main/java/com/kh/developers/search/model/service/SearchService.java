package com.kh.developers.search.model.service;

import java.util.List;

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
}
