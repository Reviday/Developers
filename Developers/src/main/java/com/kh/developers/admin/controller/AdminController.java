package com.kh.developers.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.developers.admin.model.service.AdminService;
import com.kh.developers.member.model.vo.Member;

@SessionAttributes(value= {"loginMember"})
@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	
	@RequestMapping("/admin/memberList")
	public ModelAndView memberList() {
		ModelAndView mv=new ModelAndView();
		/* List<Member> list=service.selectMemberList(); */
		
		
		return mv;
	}
	
	@RequestMapping("admin/adminPage")
	public String adminPage() {
		return "admin/mainPage";
	}
}
