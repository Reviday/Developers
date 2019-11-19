package com.kh.developers.salary.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.developers.member.model.vo.Member;
import com.kh.developers.recommend.model.vo.Recommend;
import com.kh.developers.salary.model.service.SalaryService;
import com.kh.developers.salary.model.vo.Salary;
import com.kh.developers.search.model.vo.BookMark;
import com.kh.developers.search.model.vo.LikeMember;
import com.kh.developers.search.model.vo.Position;
import com.kh.developers.search.model.vo.ResumeSearch;
import com.kh.developers.search.model.vo.Tag;

@SessionAttributes(value = { "jobField", "salaryList", "jobYearsResultList", "jobYears", "rcList", "jobYearsResult",
		"salarySearchResultList", "salarySearchResult"
})

@Controller
public class SalaryController {

	private static Logger logger = LoggerFactory.getLogger(SalaryController.class);

	@Autowired
	private SalaryService service;

	@RequestMapping("/salary/salaryView.do")
	public String salaryView() {

		System.out.println("연봉 뷰 실행");

		return "salary/salaryView";
	}

	@RequestMapping("/salary/salarySelectList.do")
	public String salarySelectList(Salary s, String job_type, Model model) {

		String jobField = s.getJobField();
		String type = job_type;

		List<Salary> list = service.salarySelectList(jobField);

		System.out.println("jobField:" + jobField);
		System.out.println("추천기업 포지션:" + type);

		System.out.println(list);

		List<Integer> salaryList = new ArrayList<Integer>();

		for (int i = 0; i < list.size(); i++) {

			salaryList.add(i, list.get(i).getJobAvgSalary());

		}

		List<Integer> jobYearsResultList = new ArrayList<Integer>();

		for (int i = 0; i < 11; i++) {

			jobYearsResultList.add(i, 0);

		}

		// 포지션 추천 기업 가지고 오기

		// 해당하는 직무의 추천기업 불러오기
		List<Position> rcList = service.salaryRecommandPositionList(type);

		System.out.println("rcList:" + rcList);

		model.addAttribute("rcList", rcList);
		model.addAttribute("jobYearsResultList", jobYearsResultList);
		model.addAttribute("salaryList", salaryList);
		model.addAttribute("jobField", jobField);

		return "salary/salaryView";
	}

	@RequestMapping("/salary/salaryYears.do")
	public String salaryYears(Salary s, String job_type,int salarySearch, Model model) {

		String jobField = s.getJobField();
		int jobYears = s.getJobYears();
		String type = job_type;
		int salarySearchResult=salarySearch;

		List<Salary> list = service.salarySelectList(jobField);

		System.out.println("jobField:" + jobField);
		System.out.println("추천기업 포지션:" + type);

		System.out.println(list);

		// 전체 연차의 연봉정보 가지고 오기
		List<Integer> salaryList = new ArrayList<Integer>();

		System.out.println("===========");
		System.out.println("무엇이 넘어오는겨:" + s);

		int jobYearsResult = service.selectedJobYears(s);

		// 선택된 연차의 연봉정보 가지고 오기
		List<Integer> jobYearsResultList = new ArrayList<Integer>();

		for (int i = 0; i < 11; i++) {

			if (i == s.getJobYears()) {
				jobYearsResultList.add(i, jobYearsResult);
			} else {
				jobYearsResultList.add(i, 0);
			}
		}
		// 선택된 연차의 연봉정보 가지고 오기 완료

		// 선택된 연차의 연봉 제외하고 LIST에 추가하기
		for (int i = 0; i < list.size(); i++) {

			if (i == s.getJobYears()) {
				salaryList.add(i, 0);
			} else {
				salaryList.add(i, list.get(i).getJobAvgSalary());
			}
		}
		System.out.println("jobYearsResult:" + jobYearsResult);
		System.out.println("jobYearsResultList:" + jobYearsResultList);
		
		

		// 포지션 추천 기업 가지고 오기
		List<Position> rcList = service.salaryRecommandPositionList(type);
		System.out.println("rcList:" + rcList);
		
		//평균연봉 대비 내 연봉 검색하기
		
		List<Integer> salarySearchResultList = new ArrayList<Integer>();

		for (int i = 0; i < 11; i++) {

			if (i == s.getJobYears()) {
				salarySearchResultList.add(i, salarySearchResult);
			} else {
				salarySearchResultList.add(i, 0);
			}
		}
		
		
		
		model.addAttribute("rcList", rcList);
		model.addAttribute("salaryList", salaryList);
		model.addAttribute("jobField", jobField);
		model.addAttribute("jobYearsResultList", jobYearsResultList);
		model.addAttribute("jobYears", jobYears);
		model.addAttribute("jobYearsResult", jobYearsResult);
		model.addAttribute("salarySearchResultList", salarySearchResultList);
		model.addAttribute("salarySearchResult", salarySearchResult);

		return "salary/salaryView";
	}

}
