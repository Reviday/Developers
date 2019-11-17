package com.kh.developers.admin.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.kh.developers.common.util.PaginationTemplateFunction2nd;
import com.kh.developers.member.model.vo.Member;

@SessionAttributes(value= {"loginMember"})
@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	private PaginationTemplate pt;
	private PaginationTemplateFunction2nd ptf;
	
	@RequestMapping("/admin/visitorLog.lac")
	public ModelAndView visitorLog() {
		ModelAndView mv=new ModelAndView();
		
		
		return mv;
	}
	
	@RequestMapping("/admin/mllChangeChart.lac")
	public String mllChangeChart(HttpServletRequest req, Model model,
			@RequestParam (value="data", required=false, defaultValue="all") String data,
			@RequestParam (value="chart", required=false, defaultValue="bar") String chart) {
		//로그인 차트용
		if(!(data.equals("Y")||data.equals("N"))) {
			//전체 통계값
			List<Map<String, Integer>> chartListS=service.selectLoginLogChartData("Y");
			List<Map<String, Integer>> chartListF=service.selectLoginLogChartData("N");
			model.addAttribute("chartListS", chartListS);
			model.addAttribute("chartListF", chartListF);
		} else {
			//단일 값
			List<Map<String, Integer>> chartList=service.selectLoginLogChartData(data);
			model.addAttribute("chartList", chartList);
		}
		
		model.addAttribute("data",data);
		model.addAttribute("chart",chart);
		return "admin/loginLogCharAjax";
	}
	
	@RequestMapping("/admin/tagRejection.lac")
	public String tagRejection(HttpServletRequest req, Model model,
			@RequestParam (value="tagNo", required=true) int tagNo) {
		//태그 거절 로직 수행
		int result=service.tagRejection(tagNo);
		
		if(result>0) {
			int totalData=service.selectTagOpinionCount() ;
			pt=new PaginationTemplate(req, totalData, "/admin/selectTagOpinionList.lac");
			List<Map<String, Object>> list=service.selectTagOpinionList(pt.getcPage(), pt.getNumPerPage());
			model.addAttribute("resultList",list);
			model.addAttribute("cPage", pt.getcPage());
			model.addAttribute("numPerPage", pt.getNumPerPage());
			model.addAttribute("pageBar", pt.getPageBar());
			return "admin/tagOpinionAjax";
		} else {
			String msg="에러가 발생하였습니다. \n다시 시도해 주기시 바랍니다.";
			String loc="/admin/mainPage.jsp";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
			return "common/msg";
		}
	}
	
	@RequestMapping("/admin/tagApproval.lac")
	public String tagApproval(HttpServletRequest req, Model model,
			@RequestParam (value="tagNo", required=true) int tagNo,
			@RequestParam (value="busNo", required=true) int busNo,
			@RequestParam (value="tagOpinion", required=true) String tagOpinion) {
		//태그 승인 로직 수행
		int result=service.tagApproval(tagNo, busNo, tagOpinion);
		
		if(result>0) {
			int totalData=service.selectTagOpinionCount() ;
			pt=new PaginationTemplate(req, totalData, "/admin/selectTagOpinionList.lac");
			List<Map<String, Object>> list=service.selectTagOpinionList(pt.getcPage(), pt.getNumPerPage());
			model.addAttribute("resultList",list);
			model.addAttribute("cPage", pt.getcPage());
			model.addAttribute("numPerPage", pt.getNumPerPage());
			model.addAttribute("pageBar", pt.getPageBar());
			return "admin/tagOpinionAjax";
		} else {
			String msg="에러가 발생하였습니다. \n다시 시도해 주기시 바랍니다.";
			String loc="/admin/mainPage.jsp";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
			return "common/msg";
		}
	}
	
	@RequestMapping("/admin/selectTagOpinionList.lac")
	public ModelAndView tagOpinionList(HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();
		
		int totalData=service.selectTagOpinionCount() ;
		pt=new PaginationTemplate(req, totalData, "/admin/selectTagOpinionList.lac");
		List<Map<String, Object>> list=service.selectTagOpinionList(pt.getcPage(), pt.getNumPerPage());
		
		System.out.println(list);
		
		mv.addObject("resultList",list);
		mv.addObject("cPage", pt.getcPage());
		mv.addObject("numPerPage", pt.getNumPerPage());
		mv.addObject("pageBar", pt.getPageBar());
		mv.setViewName("admin/tagOpinionList");
		return mv;
	}
	
	@RequestMapping("/admin/loginLogSearchList.lac")
	public String loginLogSearchList(HttpServletRequest req, Model model,
			@RequestParam (value="value", required=false, defaultValue="") String value,
			@RequestParam (value="mllSuccess", required=false, defaultValue="R") String mllSuccess) {
		// value 조건을 가진 검색 리스트 갯수
		int totalData=service.selectLoginLogCountBySearch(value, mllSuccess);
		ptf=new PaginationTemplateFunction2nd(req, totalData, "mll_search");
		ptf.setUseParamCPage(); // cPage를 파라미터로 넘긴다.
		List<MemberLoginLog> list=service.selectLoginLogListBySearch(value, mllSuccess, ptf.getcPage(), ptf.getNumPerPage());
		model.addAttribute("logList",list);
		model.addAttribute("searchValue", value);
		model.addAttribute("mllSuccess", mllSuccess);
		model.addAttribute("cPage", ptf.getcPage());
		model.addAttribute("numPerPage", ptf.getNumPerPage());
		model.addAttribute("pageBar", ptf.getPageBar(true));
		return "admin/loginLogAjax";
	}
	
	@RequestMapping("/admin/loginLog.lac")
	public ModelAndView loginLog(HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();
		//로그인 통계용 
		List<Integer> statsList=service.selectLoginLogStats();
		
		//로그인 차트용
		List<Map<String, Integer>> chartListS=service.selectLoginLogChartData("Y");
		List<Map<String, Integer>> chartListF=service.selectLoginLogChartData("N");
		
		//로그인 테이블 자료
		int totalData=service.selectLoginLogCountBySearch("", "R") ;
		ptf=new PaginationTemplateFunction2nd(req, totalData, "mll_search");
		ptf.setUseParamCPage(); // cPage를 파라미터로 넘긴다.
		List<MemberLoginLog> list=service.selectLoginLogListBySearch("", "R", ptf.getcPage(), ptf.getNumPerPage());
		
		mv.addObject("statsList", statsList);
		mv.addObject("chartListS", chartListS);
		mv.addObject("chartListF", chartListF);
		mv.addObject("logList",list);
		mv.addObject("data","all");
		mv.addObject("chart","bar");
		mv.addObject("searchValue", "");
		mv.addObject("mllSuccess", "R");
		mv.addObject("cPage", ptf.getcPage());
		mv.addObject("numPerPage", ptf.getNumPerPage());
		mv.addObject("pageBar", ptf.getPageBar(true));
		return mv;
	}
	
	@RequestMapping("/admin/restoreMember.lac")
	public String restoreMember(Member m, HttpServletRequest req, Model model,
			@RequestParam (value="value", required=false, defaultValue="") String value) {
		int totalData=service.selectWithdrawMemberCountBySearch(value);
		ptf=new PaginationTemplateFunction2nd(req, totalData, "wd_search");
		ptf.setUseParamCPage(); // cPage를 파라미터로 넘긴다.
		List<Member> list=service.selectWithdrawMemberListBySearch(value, ptf.getcPage(), ptf.getNumPerPage());
		
		model.addAttribute("memList",list);
		model.addAttribute("searchValue", value);
		model.addAttribute("cPage", ptf.getcPage());
		model.addAttribute("numPerPage", ptf.getNumPerPage());
		model.addAttribute("pageBar", ptf.getPageBar(true));
		return "admin/memberListAjax";
	}
	
	
	@RequestMapping("/admin/withdrawMemberSearchList.lac")
	public String withdrawMemberSearchList(HttpServletRequest req, Model model,
		@RequestParam (value="value", required=true) String value) {
		// value 조건을 가진 검색 리스트 갯수
		int totalData=service.selectWithdrawMemberCountBySearch(value);
		ptf=new PaginationTemplateFunction2nd(req, totalData, "wd_search");
		ptf.setUseParamCPage(); // cPage를 파라미터로 넘긴다.
		List<Member> list=service.selectWithdrawMemberListBySearch(value, ptf.getcPage(), ptf.getNumPerPage());
		model.addAttribute("memList",list);
		model.addAttribute("searchValue", value);
		model.addAttribute("cPage", ptf.getcPage());
		model.addAttribute("numPerPage", ptf.getNumPerPage());
		model.addAttribute("pageBar", ptf.getPageBar(true));
		return "admin/withdrawMemberListAjax";
	}
	
	@RequestMapping("/admin/withdrawMemberList.lac")
	public ModelAndView withdrawMemberList(HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();
		int totalData=service.selectWithdrawMemberCountBySearch("");
		ptf=new PaginationTemplateFunction2nd(req, totalData, "wd_search");
		ptf.setUseParamCPage(); // cPage를 파라미터로 넘긴다.
		List<Member> list=service.selectWithdrawMemberListBySearch("", ptf.getcPage(), ptf.getNumPerPage());
		
		mv.addObject("memList",list);
		mv.addObject("searchValue", "");
		mv.addObject("cPage", ptf.getcPage());
		mv.addObject("numPerPage", ptf.getNumPerPage());
		mv.addObject("pageBar", ptf.getPageBar(true));
		return mv;
	}
	
	@RequestMapping("/admin/memberSearchList.lac")
	public String memberSearchList(HttpServletRequest req, Model model,
			@RequestParam (value="value", required=false, defaultValue="") String value,
			@RequestParam (value="searchLevel", required=false, defaultValue="-2") int searchLevel) {
		// value 조건을 가진 검색 리스트 갯수
		int totalData=service.selectMemberCountBySearch(value, searchLevel);
		ptf=new PaginationTemplateFunction2nd(req, totalData, "search");
		ptf.setUseParamCPage(); // cPage를 파라미터로 넘긴다.
		List<Member> list=service.selectMemberListBySearch(value, searchLevel, ptf.getcPage(), ptf.getNumPerPage());
		model.addAttribute("memList",list);
		model.addAttribute("searchValue", value);
		model.addAttribute("searchLevel", searchLevel);
		model.addAttribute("cPage", ptf.getcPage());
		model.addAttribute("numPerPage", ptf.getNumPerPage());
		model.addAttribute("pageBar", ptf.getPageBar(true));
		return "admin/memberListAjax";
	}
	
	
	@RequestMapping("/admin/deleteMember.lac")
	public String deleteMember(Member m, HttpServletRequest req, Model model,
			@RequestParam (value="value", required=false, defaultValue="") String value,
			@RequestParam (value="searchLevel", required=false, defaultValue="-2") int searchLevel) {
		//검색조건을 유지시킨 상태에서 리스트 업데이트가 필요하다.
		int totalData;
		List<Member> list;
		int result=service.deleteMember(m);
		if(result>0) {
			totalData=service.selectMemberCountBySearch(value, searchLevel);
			ptf=new PaginationTemplateFunction2nd(req, totalData, "search");
			ptf.setUseParamCPage(); // cPage를 파라미터로 넘긴다.
			list=service.selectMemberListBySearch(value, searchLevel, ptf.getcPage(), ptf.getNumPerPage());
			model.addAttribute("memList",list);
			model.addAttribute("searchValue", value);
			model.addAttribute("searchLevel", searchLevel);
			model.addAttribute("cPage", ptf.getcPage());
			model.addAttribute("numPerPage", ptf.getNumPerPage());
			model.addAttribute("pageBar", ptf.getPageBar(true));
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
		
		//회원 통계
		List<Map<String, Integer>> statsList=service.selectMemberStats();
		Map<String, Integer> statsMap=new HashMap<String, Integer>(); 
		int total=0, unfinished=0, common=0, business=0;
		System.out.println(statsList);
		for(int i=0; i<statsList.size(); i++) {
			int level=Integer.parseInt(String.valueOf(statsList.get(i).get("LEVEL")+""));
			int count=Integer.parseInt(String.valueOf(statsList.get(i).get("COUNT")+""));
			total+=count;
			switch(level) {
			case 0: unfinished+=count; break;
			case 1: common+=count; break;
			case 2: common+=count; break;
			case 3: business+=count; break;
			case 4: business+=count; break;
			case 5: /*관리자 Pass*/ break;
			}
		}
		
		statsMap.put("total", total);
		statsMap.put("business", business);
		statsMap.put("common", common);
		statsMap.put("unfinished", unfinished);
		
		int totalData=service.selectMemberCountBySearch("", -2);
		ptf=new PaginationTemplateFunction2nd(req, totalData, "search");
		ptf.setUseParamCPage(); // cPage를 파라미터로 넘긴다.
		List<Member> list=service.selectMemberListBySearch("", -2, ptf.getcPage(), ptf.getNumPerPage());
		
		mv.addObject("memList",list);
		mv.addObject("statsMap",statsMap);
		mv.addObject("searchValue", "");
		mv.addObject("searchLevel", -2);
		mv.addObject("cPage", ptf.getcPage());
		mv.addObject("numPerPage", ptf.getNumPerPage());
		mv.addObject("pageBar", ptf.getPageBar(true));
		return mv;
	}
	
	@RequestMapping("admin/adminPage.lac")
	public String adminPage() {
		return "admin/mainPage";
	}
}
