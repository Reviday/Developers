package com.kh.developers.search.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.developers.search.model.vo.JobField;
import com.kh.developers.search.model.vo.LikeMember;
import com.kh.developers.search.model.vo.Position;

public interface SearchDao {

	List<JobField> jobfieldList(SqlSessionTemplate session);
	List<JobField> jobfieldAjaxList(SqlSessionTemplate session, String jobName);
	List<Position> positionList(SqlSessionTemplate session);
	Position companyInfoList(SqlSessionTemplate session, int positionNo);
	List<LikeMember> likeMemberList(SqlSessionTemplate session, int likeNo);
	List<Position> firstPsList(SqlSessionTemplate session);
	LikeMember selectLikeMemberOne(SqlSessionTemplate session, int memNo, int likeId);
	int insertLikeButton(SqlSessionTemplate session, int memNo, int likeId);
	int selectLikeCount(SqlSessionTemplate session, int likeId);
	int deleteLikeButton(SqlSessionTemplate session, int memNo, int likeId);
}
