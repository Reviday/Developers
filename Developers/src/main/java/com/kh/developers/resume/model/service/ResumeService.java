package com.kh.developers.resume.model.service;

import java.util.List;

import com.kh.developers.member.model.vo.Interests;
import com.kh.developers.member.model.vo.Member;
import com.kh.developers.resume.model.vo.Activitie;
import com.kh.developers.resume.model.vo.Career;
import com.kh.developers.resume.model.vo.Education;
import com.kh.developers.resume.model.vo.Lang;
import com.kh.developers.resume.model.vo.Links;
import com.kh.developers.resume.model.vo.Resume;

public interface ResumeService {
	int insertResume(Member m);
	List<Resume> selectResume(Member m2);
	Resume selectResumeOne(Resume r);
	Resume selectResumeViewOne(Resume r);
	List<Career> selectCareer(Resume r);
	List<Education> selectEd(Resume r);
	List<Activitie> selectAc(Resume r);
	List<Lang> selectLang(Resume r);
	List<Links> selectLinks(Resume r);
	int insertCareer(Resume r2);
	int insertEd(Resume r2);
	int insertAct(Resume r2);
	int insertLang(Resume r2);
	int insertLink(Resume r2);
	int deleteCareer(int deleteNo);
	int deleteEd(int deleteNo);
	int deleteAc(int deleteNo);	
	int deleteLa(int deleteNo);	
	int deleteLi(int deleteNo);		
	int updateCareer(Career c);
	int updateEd(Education e);
	int updateAct(Activitie a);
	int updateLang(Lang l);
	int updateLinks(Links l);
	Resume selectMathUpResume(Member m);
	Interests selectInter(Member m);
	int insertMathupResume(Member m);
	int insertMathupCareer(Resume r);
	int insertMathupEd(Resume r);
	int updateInterestsRno(Resume r);
	int deleteResume(Resume r);
	int updateResume(Resume r);
	
}
