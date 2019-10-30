package com.kh.developers.resume.model.service;

import java.util.List;

import com.kh.developers.member.model.vo.Member;
import com.kh.developers.resume.model.vo.Career;
import com.kh.developers.resume.model.vo.Resume;

public interface ResumeService {
	int insertResume(Member m);
	List<Resume> selectResume(Member m2);
	int insertCareer(Member m);
	Resume selectResumeOne(Resume r);
	List<Career> selectCareer(Resume r);
}
