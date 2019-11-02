package com.kh.developers.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.developers.admin.model.service.AdminService;

@SessionAttributes(value= {"loginMember"})
@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	
	@RequestMapping("admin/adminPage")
	public String adminPage() {
		return "admin/mainPage";
	}
}
