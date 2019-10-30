package com.kh.developers.resume.controller;


import java.util.List;
import java.util.Map;

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
import com.kh.developers.resume.model.vo.Activitie;
import com.kh.developers.resume.model.vo.Career;
import com.kh.developers.resume.model.vo.Education;
import com.kh.developers.resume.model.vo.Lang;
import com.kh.developers.resume.model.vo.Links;
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
		List<Education> ed=service.selectEd(resume);
		List<Activitie> ac=service.selectAc(resume);
		List<Lang> Lang=service.selectLang(resume);
		List<Links> links=service.selectLinks(resume);
		mv.addObject("ed",ed);
		mv.addObject("ac",ac);
		mv.addObject("Lang",Lang);
		mv.addObject("links",links);
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
	
	@RequestMapping("/resume/insertCareer.lmc")
	@ResponseBody
	public String insertCareer(Resume r,HttpServletResponse res) {
		/*@ReponseBody이용*/
		ObjectMapper mapper=new ObjectMapper();
		//잭슨이 제공하는 객체 자바클래스하고 json자바스크립트 객체 매핑 시켜줌 
		Resume r2=service.selectResumeViewOne(r);
		int result=service.insertCareer(r2);
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
	@RequestMapping("/resume/insertEd.lmc")
	@ResponseBody
	public String insertEd(Resume r,HttpServletResponse res) {
		System.out.println(r);
		ObjectMapper mapper=new ObjectMapper();
		//잭슨이 제공하는 객체 자바클래스하고 json자바스크립트 객체 매핑 시켜줌 
		Resume r2=service.selectResumeViewOne(r);
		int result=service.insertEd(r2);
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
	@RequestMapping("/resume/insertAct.lmc")
	@ResponseBody
	public String insertAct(Resume r,HttpServletResponse res) {
		/*@ReponseBody이용*/
		ObjectMapper mapper=new ObjectMapper();
		//잭슨이 제공하는 객체 자바클래스하고 json자바스크립트 객체 매핑 시켜줌 
		Resume r2=service.selectResumeViewOne(r);
		int result=service.insertAct(r2);
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
	@RequestMapping("/resume/insertLang.lmc")
	@ResponseBody
	public String insertLang(Resume r,HttpServletResponse res) {
		/*@ReponseBody이용*/
		ObjectMapper mapper=new ObjectMapper();
		//잭슨이 제공하는 객체 자바클래스하고 json자바스크립트 객체 매핑 시켜줌 
		Resume r2=service.selectResumeViewOne(r);
		int result=service.insertLang(r2);
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
	@RequestMapping("/resume/insertLink.lmc")
	@ResponseBody
	public String insertLink(Resume r,HttpServletResponse res) {
		/*@ReponseBody이용*/
		ObjectMapper mapper=new ObjectMapper();
		//잭슨이 제공하는 객체 자바클래스하고 json자바스크립트 객체 매핑 시켜줌 
		Resume r2=service.selectResumeViewOne(r);
		int result=service.insertLink(r2);
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
	@RequestMapping("/resume/deleteIndex.lmc")
	@ResponseBody
	public String deleteIndex(int deleteNo,String deleteIndex,HttpServletResponse res) {
		ObjectMapper mapper=new ObjectMapper();
		int result=0;
		if(deleteIndex.equals("c")) {
		result=service.deleteCareer(deleteNo);
		}
		
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
