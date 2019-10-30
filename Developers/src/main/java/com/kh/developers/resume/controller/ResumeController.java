package com.kh.developers.resume.controller;


import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.developers.member.model.service.MemberService;
import com.kh.developers.member.model.vo.Member;
import com.kh.developers.resume.model.service.ResumeService;
import com.kh.developers.resume.model.vo.Career;
import com.kh.developers.resume.model.vo.Resume;


@Controller
public class ResumeController {
	
	private static Logger logger=LoggerFactory.getLogger(ResumeController.class);
	@Autowired
	private ResumeService service;
	@Autowired
	private MemberService mservice;
	
	@RequestMapping("/resume/resumeList.lmc")
	public ModelAndView resumeList(Member m,Model model) {
		ModelAndView mv = new ModelAndView();
		Member m2=mservice.selectMemberOne(m);
		List<Resume> list=service.selectResume(m2);
		mv.addObject("list", list);
		mv.setViewName("resume/resumeList");
		return mv;
	}
	@RequestMapping("/resume/resumeView.lmc")
	public ModelAndView resumeView(Resume r) {
		ModelAndView mv= new ModelAndView();
		Resume resume=service.selectResumeOne(r);
		List<Career> career=service.selectCareer(resume);
		mv.addObject("resume", resume);
		mv.addObject("career", career);
		mv.setViewName("resume/resumeView");
		return mv;	
	}
	
	
	
	@RequestMapping("/resume/resumeIntro.do")
	public String resumeIntro() {
		return "resume/resumeIntro";
	}
	@RequestMapping("/resume/insertResumepage.lmc")
	public String insertResume(Member m,Model model) {	
		Member m2=mservice.selectMemberOne(m);
		int result=service.insertResume(m2);
		model.addAttribute("resumeMem", m2);
		return "resume/insertResume";
	}
	
	@RequestMapping("resume/insertCareer.lmc")
	@ResponseBody
	public String insertCareer(Member m,HttpServletResponse res) {
		/*@ReponseBody이용*/
		ObjectMapper mapper=new ObjectMapper();
		//잭슨이 제공하는 객체 자바클래스하고 json자바스크립트 객체 매핑 시켜줌 
		int result=service.insertCareer(m);
		String jsonStr="";
		try {
			jsonStr=mapper.writeValueAsString(result);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 res.setContentType("application/json;charset=utf-8");
		return jsonStr;
	}
	
}
