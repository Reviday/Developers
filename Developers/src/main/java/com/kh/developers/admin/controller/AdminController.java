package com.kh.developers.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.developers.admin.model.service.AdminService;
import com.kh.developers.admin.model.vo.MemberLoginLog;
import com.kh.developers.common.util.PaginationTemplate;
import com.kh.developers.member.model.vo.Member;

@SessionAttributes(value= {"loginMember"})
@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	private PaginationTemplate pt;
	
	@RequestMapping("/admin/loginLog.lac")
	public ModelAndView loginLog(HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();
		int totalData=service.selectloginLogCount();
		pt=new PaginationTemplate(req, totalData, "/admin/memberList.lac");
		List<MemberLoginLog> list=service.selectLoginLogList(pt.getcPage(),pt.getNumPerPage());
		
		mv.addObject("logList",list);
		mv.addObject("cPage",pt.getcPage());
		mv.addObject("numPerPage",pt.getNumPerPage());
		mv.addObject("pageBar",pt.getPageBar());
		return mv;
	}
	
	@RequestMapping("/admin/restoreMember.lac")
	public String restoreMember(Member m, HttpServletRequest req, Model model,
			@RequestParam (value="value", required=false, defaultValue="") String value) {
		int totalData;
		List<Member> list;
		service.restoreMember(m);
		if((value != null && !value.equals(""))) {
			//검색 조건 있을 경우
			totalData=service.selectWithdrawMemberCountBySearch(value);
			pt=new PaginationTemplate(req, totalData, "/admin/withdrawMemberSearchList.lac");
			list=service.selectWithdrawMemberListBySearch(value, pt.getcPage(), pt.getNumPerPage());
		} else {
			//검색조건이 없을 경우
			totalData=service.selectWithdrawMemberCount();
			pt=new PaginationTemplate(req, totalData, "/admin/withdrawMemberList.lac");
			list=service.selectWithdrawMemberList(pt.getcPage(),pt.getNumPerPage());
		}
		model.addAttribute("memList",list);
		model.addAttribute("searchValue", value);
		model.addAttribute("cPage", pt.getcPage());
		model.addAttribute("numPerPage", pt.getNumPerPage());
		model.addAttribute("pageBar", pt.getPageBar());
		return "admin/memberListAjax";
	}
	
	@RequestMapping("/admin/withdrawMemberSearchList.lac")
	public String withdrawMemberSearchList(HttpServletRequest req, Model model,
		@RequestParam (value="value", required=true) String value) {
		// value 조건을 가진 검색 리스트 갯수
		int totalData=service.selectWithdrawMemberCountBySearch(value);
		pt=new PaginationTemplate(req, totalData, "/admin/withdrawMemberSearchList.lac");
		List<Member> list=service.selectWithdrawMemberListBySearch(value, pt.getcPage(), pt.getNumPerPage());
		model.addAttribute("memList",list);
		model.addAttribute("searchValue", value);
		model.addAttribute("cPage", pt.getcPage());
		model.addAttribute("numPerPage", pt.getNumPerPage());
		model.addAttribute("pageBar", pt.getPageBar());
		return "admin/withdrawMemberListAjax";
	}
	
	@RequestMapping("/admin/withdrawMemberList.lac")
	public ModelAndView withdrawMemberList(HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();
		int totalData=service.selectWithdrawMemberCount();
		pt=new PaginationTemplate(req, totalData, "/admin/withdrawMemberList.lac");
		List<Member> list=service.selectWithdrawMemberList(pt.getcPage(),pt.getNumPerPage());
		
		mv.addObject("memList",list);
		mv.addObject("cPage",pt.getcPage());
		mv.addObject("numPerPage",pt.getNumPerPage());
		mv.addObject("pageBar",pt.getPageBar());
		return mv;
	}
	
	@RequestMapping("/admin/searchByLevel.lac")
	public String memberSearchByLevel(HttpServletRequest req, Model model,
			@RequestParam (value="value", required=false, defaultValue="") String value,
			@RequestParam (value="searchLevel", required=true) int searchLevel) {
		int totalData=service.selectMemberCountBySearchLevel(value, searchLevel);
		pt=new PaginationTemplate(req, totalData, "/admin/searchByLevel.lac");
		List<Member> list=service.selectMemberListBySearchLevel(value, searchLevel, pt.getcPage(), pt.getNumPerPage());
		model.addAttribute("memList",list);
		model.addAttribute("searchValue", value);
		model.addAttribute("searchLevel", searchLevel);
		model.addAttribute("cPage", pt.getcPage());
		model.addAttribute("numPerPage", pt.getNumPerPage());
		model.addAttribute("pageBar", pt.getPageBar());
		return "admin/memberListAjax";
	}
	
	@RequestMapping("/admin/memberSearchList.lac")
	public String memberSearchList(HttpServletRequest req, Model model,
			@RequestParam (value="value", required=true) String value) {
		// value 조건을 가진 검색 리스트 갯수
		int totalData=service.selectMemberCountBySearch(value);
		pt=new PaginationTemplate(req, totalData, "/admin/memberSearchList.lac");
		List<Member> list=service.selectMemberListBySearch(value, pt.getcPage(), pt.getNumPerPage());
		model.addAttribute("memList",list);
		model.addAttribute("searchValue", value);
		model.addAttribute("cPage", pt.getcPage());
		model.addAttribute("numPerPage", pt.getNumPerPage());
		model.addAttribute("pageBar", pt.getPageBar());
		return "admin/memberListAjax";
	}
	
	
	@RequestMapping("/admin/deleteMember.lac")
	public String deleteMember(Member m, HttpServletRequest req, Model model,
			@RequestParam (value="value", required=false, defaultValue="") String value,
			@RequestParam (value="searchLevel", required=false, defaultValue="-1") int searchLevel) {
		//검색조건을 유지시킨 상태에서 리스트 업데이트가 필요하다.
		int totalData;
		List<Member> list;
		int result=service.deleteMember(m);
		if(result>0) {
			if(searchLevel>=0) {
				//등급 조건이 있을 경우(검색 조건 유/무 상관없이)
				totalData=service.selectMemberCountBySearchLevel(value, searchLevel);
				pt=new PaginationTemplate(req, totalData, "/admin/searchByLevel.lac"); 
				list=service.selectMemberListBySearchLevel(value, searchLevel, pt.getcPage(), pt.getNumPerPage());
			} else if((value != null && !value.equals("")) && searchLevel<0) {
				//검색 조건만 있을 경우
				totalData=service.selectMemberCountBySearch(value);
				pt=new PaginationTemplate(req, totalData, "/admin/memberSearchList.lac"); 
				list=service.selectMemberListBySearch(value, pt.getcPage(), pt.getNumPerPage());
			}  else {
				//모든 조건이 없을 경우
				totalData=service.selectMemberCount();
				pt=new PaginationTemplate(req, totalData, "/admin/memberList.lac");
				list=service.selectMemberList(pt.getcPage(),pt.getNumPerPage());
			}
			model.addAttribute("memList",list);
			model.addAttribute("searchValue", value);
			model.addAttribute("searchLevel", searchLevel);
			model.addAttribute("cPage", pt.getcPage());
			model.addAttribute("numPerPage", pt.getNumPerPage());
			model.addAttribute("pageBar", pt.getPageBar());
			return "admin/memberListAjax";
		} else {
			String msg="에러가 발생하였습니다. \n다시 시도해 주기시 바랍니다.";
			String loc="/admin/mainPage.jsp";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
			return "common/msg";
		}
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
		/* 작업하면서 알게된 사실!
		 * viewName을 설정하지 않으면 실행중인 메소드 명(memberList)과 일치하는 view를 찾아간다.
		 */
		ModelAndView mv=new ModelAndView();
		int totalData=service.selectMemberCount();
		pt=new PaginationTemplate(req, totalData, "/admin/memberList.lac");
		List<Member> list=service.selectMemberList(pt.getcPage(),pt.getNumPerPage());
		
		mv.addObject("memList",list);
		mv.addObject("cPage",pt.getcPage());
		mv.addObject("numPerPage",pt.getNumPerPage());
		mv.addObject("pageBar",pt.getPageBar());
		return mv;
	}
	
	@RequestMapping("admin/adminPage.lac")
	public String adminPage() {
		return "admin/mainPage";
	}
}
