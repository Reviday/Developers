package com.kh.developers.resume.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.developers.member.model.vo.Interests;
import com.kh.developers.member.model.vo.Member;
import com.kh.developers.resume.model.vo.Activitie;
import com.kh.developers.resume.model.vo.Career;
import com.kh.developers.resume.model.vo.Education;
import com.kh.developers.resume.model.vo.Lang;
import com.kh.developers.resume.model.vo.Links;
import com.kh.developers.resume.model.vo.Resume;

public interface ResumeDao {
	int insertResume(SqlSessionTemplate session,Member m);
	List<Resume> selectResume(SqlSessionTemplate session,Member m2);
	Resume selectResumeOne(SqlSessionTemplate session,Resume r);
	Resume selectResumeViewOne(SqlSessionTemplate session,Resume r);
	List<Career> selectCareer(SqlSessionTemplate session,Resume r);
	List<Education> selectEd(SqlSessionTemplate session,Resume r);
	List<Activitie> selectAc(SqlSessionTemplate session,Resume r);
	List<Lang> selectLang(SqlSessionTemplate session,Resume r);
	List<Links> selectLinks(SqlSessionTemplate session,Resume r);
	int insertCareer(SqlSessionTemplate session,Resume r2);
	int insertEd(SqlSessionTemplate session,Resume r2);
	int insertAct(SqlSessionTemplate session,Resume r2);
	int insertLang(SqlSessionTemplate session,Resume r2);
	int insertLink(SqlSessionTemplate session,Resume r2);
	int deleteCareer(SqlSessionTemplate session,int deleteNo);
	int deleteEd(SqlSessionTemplate session,int deleteNo);
	int deleteAc(SqlSessionTemplate session,int deleteNo);	
	int deleteLa(SqlSessionTemplate session,int deleteNo);	
	int deleteLi(SqlSessionTemplate session,int deleteNo);	
	int updateCareer(SqlSessionTemplate session,Career c);
	int updateEd(SqlSessionTemplate session,Education e);
	int updateAct(SqlSessionTemplate session,Activitie a);
	int updateLang(SqlSessionTemplate session,Lang l);
	int updateLinks(SqlSessionTemplate session,Links l);
	Resume selectMathUpResume(SqlSessionTemplate session,Member m);
	Interests selectInter(SqlSessionTemplate session,Member m);
	int insertMathupResume(SqlSessionTemplate session,Member m);
	int insertMathupCareer(SqlSessionTemplate session,Resume r);
	int insertMathupEd(SqlSessionTemplate session,Resume r);
	int updateInterestsRno(SqlSessionTemplate session,Resume r);
	int deleteResume(SqlSessionTemplate session,Resume r);
}
