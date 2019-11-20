package com.kh.developers.resume.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	public ModelAndView insertResume(Member m,Model model) {	
		ModelAndView mv= new ModelAndView();
		Member m2=mservice.selectMemberOne(m);
		Resume r=new Resume();
		r.setResumeNo(m2.getMemNo());
		if(m2.getMemPhone()==null) {
			m2.setMemPhone("null");
		}
		r.setMemEmail(m2.getMemEmail());
		int result=service.insertResume(m2);
		r.setResumeNo(m2.getMemNo());
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
		mv.addObject("resumeMem", m2);
		mv.setViewName("resume/insertResume");
		return mv;
	}
	
	@RequestMapping("/resume/insertCareer.lmc")
	@ResponseBody
	public String insertCareer(Resume r,HttpServletResponse res) {
		/*@ReponseBody이용*/
		ObjectMapper mapper=new ObjectMapper();
		//잭슨이 제공하는 객체 자바클래스하고 json자바스크립트 객체 매핑 시켜줌 
		Member m= new Member();
		m.setMemEmail(r.getMemEmail());
		m=mservice.selectMemberOne(m);
		r.setMemNo(m.getMemNo());
		Resume r2=service.selectResumeViewOne(r);
		int result=service.insertCareer(r2);
		String jsonStr="";
		try {
			jsonStr=mapper.writeValueAsString(r2.getResumeNo());
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
		ObjectMapper mapper=new ObjectMapper();
		//잭슨이 제공하는 객체 자바클래스하고 json자바스크립트 객체 매핑 시켜줌 
		Resume r2=service.selectResumeViewOne(r);
		int result=service.insertEd(r2);
		String jsonStr="";
		try {
			jsonStr=mapper.writeValueAsString(r2.getResumeNo());
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
			jsonStr=mapper.writeValueAsString(r2.getResumeNo());
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
			jsonStr=mapper.writeValueAsString(r2.getResumeNo());
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
			jsonStr=mapper.writeValueAsString(r2.getResumeNo());
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 res.setContentType("application/json;charset=utf-8");
		return jsonStr;
	}

	/*
	 * @RequestMapping("/resume/deleteIndex.lmc")
	 * 
	 * @ResponseBody public String deleteIndex(int deleteNo,String
	 * deleteIndex,HttpServletResponse res) { ObjectMapper mapper=new
	 * ObjectMapper(); int result=0; if(deleteIndex.equals("c")) {
	 * result=service.deleteCareer(deleteNo); }
	 * 
	 * String jsonStr=""; try { jsonStr=mapper.writeValueAsString(result); } catch
	 * (JsonProcessingException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } res.setContentType("application/json;charset=utf-8");
	 * return jsonStr; }
	 */
	@RequestMapping("/resume/deleteIndex.lmc")
	public ModelAndView checkId(int deleteNo,int deleteIndex,int resumeNo,HttpServletResponse res) {
		ModelAndView mv=new ModelAndView();
		if(deleteIndex==1) {
		int result=service.deleteCareer(deleteNo);
		}else if(deleteIndex==2) {
		int result=service.deleteEd(deleteNo);
		}else if(deleteIndex==3) {
		int result=service.deleteAc(deleteNo);	
		}else if(deleteIndex==4) {
		int result=service.deleteLa(deleteNo);	
		}else if(deleteIndex==5) {
		int result=service.deleteLi(deleteNo);		
		}
		
		//mv.addObject("member", result);//객체 못넣는다
		Resume r= new Resume();
		r.setResumeNo(resumeNo);
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
	@RequestMapping("/resume/updateCareer.lmc")
	public ModelAndView updateCareer(Career c) {
		ModelAndView mv=new ModelAndView();
		int resumeNo=c.getResumeNo();
		String memEmail=c.getMemEmail();
		int result=service.updateCareer(c);
		Resume r= new Resume();
		r.setResumeNo(resumeNo);
		r.setMemEmail(memEmail);
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
	@RequestMapping("/resume/updateEd.lmc")
	public ModelAndView updateEd(Education e) {
		ModelAndView mv=new ModelAndView();
		int resumeNo=e.getResumeNo();
		String memEmail=e.getMemEmail();
		int result=service.updateEd(e);
		Resume r= new Resume();
		r.setResumeNo(resumeNo);
		r.setMemEmail(memEmail);
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
	@RequestMapping("/resume/updateAct.lmc")
	public ModelAndView updateAct(Activitie a) {
		ModelAndView mv=new ModelAndView();
		int resumeNo=a.getResumeNo();
		String memEmail=a.getMemEmail();
		int result=service.updateAct(a);
		Resume r= new Resume();
		r.setResumeNo(resumeNo);
		r.setMemEmail(memEmail);
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
	@RequestMapping("/resume/updateLang.lmc")
	public ModelAndView updateLang(Lang l) {
		ModelAndView mv=new ModelAndView();
		int resumeNo=l.getResumeNo();
		String memEmail=l.getMemEmail();
		int result=service.updateLang(l);
		Resume r= new Resume();
		r.setResumeNo(resumeNo);
		r.setMemEmail(memEmail);
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
	@RequestMapping("/resume/updateLinks.lmc")
	public ModelAndView updateLinks(Links l) {
		ModelAndView mv=new ModelAndView();
		int resumeNo=l.getResumeNo();
		String memEmail=l.getMemEmail();
		int result=service.updateLinks(l);
		Resume r= new Resume();
		r.setResumeNo(resumeNo);
		r.setMemEmail(memEmail);
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
	@RequestMapping("/resume/deleteResume.lmc")
	public ModelAndView deleteResume(Resume r) {
		ModelAndView mv=new ModelAndView();
		int result=service.deleteResume(r);
		Member m=new Member();
		m.setMemEmail(r.getMemEmail());
		Member m2=mservice.selectMemberOne(m);
		List<Resume> list=service.selectResume(m2);
		mv.addObject("list", list);
		mv.setViewName("resume/ajax/resumeListView");
		return mv;
	}
	@RequestMapping("/resume/updateResume.lmc")
	public ModelAndView updateResume(Resume r) {
		ModelAndView mv=new ModelAndView();
		System.out.println(r.getStatus()+"모냐 넌");
		int result=service.updateResume(r);
		Member m=new Member();
		m.setMemEmail(r.getMemEmail());
		Member m2=mservice.selectMemberOne(m);
		List<Resume> list=service.selectResume(m2);
		mv.addObject("list", list);
		mv.setViewName("resume/resumeList");
		return mv;
		
	}

	
}
