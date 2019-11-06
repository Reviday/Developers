package com.kh.developers.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.developers.admin.model.service.AdminService;
import com.kh.developers.common.util.PaginationTemplate;
import com.kh.developers.member.model.vo.Member;

@SessionAttributes(value= {"loginMember"})
@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	private PaginationTemplate pt;
	
	@RequestMapping("/admin/deleteMember.lac")
	@ResponseBody
	public String deleteMember(Member m, HttpServletResponse res) {
		ObjectMapper mapper=new ObjectMapper();
		int result=service.deleteMember(m);
		String jsonStr="";
		try {
			jsonStr=mapper.writeValueAsString(result);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		 res.setContentType("application/json;charset=utf-8");
		return jsonStr;
	}
	
	@RequestMapping("/admin/updateMember.lac")
	@ResponseBody
	public String updateMember(Member m, HttpServletResponse res) {
		/*@ReponseBody이용*/
		ObjectMapper mapper=new ObjectMapper();
		//잭슨이 제공하는 객체 자바클래스하고 json자바스크립트 객체 매핑 시켜줌 
		
		int result=service.updateMember(m);
		String jsonStr="";
		try {
			jsonStr=mapper.writeValueAsString(result);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		 res.setContentType("application/json;charset=utf-8");
		return jsonStr;
	}
	
	@RequestMapping("/admin/memberList.lac")
	public ModelAndView memberList(HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();
		int totalData=service.selectMemberCount();
		pt=new PaginationTemplate(req, totalData, "/admin/memberList.lac");
		List<Member> list=service.selectMemberList(pt.getcPage(),pt.getNumPerPage());
		
		mv.addObject("memList",list);
		mv.addObject("pageBar",pt.getPageBar());
		return mv;
	}
	
	@RequestMapping("admin/adminPage.lac")
	public String adminPage() {
		return "admin/mainPage";
	}
}
