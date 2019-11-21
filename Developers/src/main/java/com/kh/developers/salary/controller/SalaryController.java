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
		"salarySearchResultList", "salarySearchResult", "salaryRateResult"
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
	//직무별 연봉정보 가지고 오기
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
	//연차별 연봉정보 가지고 오기
	@RequestMapping("/salary/salaryYears.do")
	public String salaryYears(Salary s, String jobName,int salarySearch, Model model) {
		
		String jobName1 = "";
		switch(jobName) {
		
			case "전체" : jobName1 = ""; break;
			case "서버 개발자" : jobName1 = "D1"; break;
			case "프론트엔드 개발자" : jobName1 = "D2"; break;
			case "자바 개발자" : jobName1 = "D3"; break;
			case "안드로이드 개발자" : jobName1 = "D4"; break;
			case "iOS 개발자" : jobName1 = "D5"; break;
			case "파이썬 개발자" : jobName1 = "D6"; break;
			case "데이터 엔지니어" : jobName1 = "D7"; break;
			case "시스템,네트워크 관리자" : jobName1 = "D8"; break;
			case "DevOps/시스템 관리자" : jobName1 = "D9"; break;
			case "Node.js 개발자" : jobName1 = "D10"; break;
			case "C,C++ 개발자" : jobName1 = "D11"; break;
			case "데이터 사이언티스트" : jobName1 = "D12"; break;
			case "개발 매니저" : jobName1 = "D13"; break;
			case "PHP 개발자" : jobName1 = "D14"; break;
			case "기술지원" : jobName1 = "D15"; break;
			case "머신러닝 엔지니어" : jobName1 = "D16"; break;
			case "보안 엔지니어" : jobName1 = "D17"; break;
			case "QA,테스트 엔지니어" : jobName1 = "D18"; break;
			case "프로덕트 매니저" : jobName1 = "D19"; break;
			case "빅데이터 엔지니어" : jobName1 = "D20"; break;
			case "루비온레일즈 개발자" : jobName1 = "D21"; break;
			case ".NET 개발자" : jobName1 = "D22"; break;
			case "웹 퍼블리셔" : jobName1 = "D23"; break;
			case "임베디드 개발자" : jobName1 = "D24"; break;
			case "블록체인 플랫폼 엔지니어" : jobName1 = "D25"; break;
			case "하드웨어 엔지니어" : jobName1 = "D26"; break;
			case "CTO,Chief Technology Officer" : jobName1 = "D27"; break;
			case "영상,음성 엔지니어" : jobName1 = "D28"; break;
			case "BI 엔지니어" : jobName1 = "D29"; break;
			case "그래픽스 엔지니어" : jobName1 = "D30"; break;
			case "CIO, Chief Information Officer" : jobName1 = "D31"; break;
		}

		String jobField = s.getJobField();
		int jobYears = s.getJobYears();
		int salarySearchResult=salarySearch;

		List<Salary> list = service.salarySelectList(jobField);

		System.out.println("jobField:" + jobField);
		System.out.println("추천기업 포지션(jobName):" + jobName);
		System.out.println("추천기업 포지션(jobName1):" + jobName1);

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
		List<Position> rcList = service.salaryRecommandPositionList(jobName1);
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
		int temp=0;
		String salaryRateResult="";
		if(salarySearch>0) {
			System.out.println("계산값 실행 :"+salarySearch+","+jobYearsResult);
			if((salarySearch>jobYearsResult)) {
			temp=(int) ((((double)(salarySearch)-jobYearsResult)/jobYearsResult)*100);
				if (salarySearch == 0) {
					salaryRateResult = "";
				} else if (s.getJobYears() != 0) {
					salaryRateResult = "* "+s.getJobYears() + "년 경력 예상 연봉 대비 " + temp + "%" + " 높음";
				} else {
					salaryRateResult = "* 신입 예상 연봉 대비 " + temp + "%" + " 높음";
				}
			}else {
				temp=(int) (((jobYearsResult-(double)(salarySearch))/jobYearsResult)*100);
				if (salarySearch == 0) {
					salaryRateResult = "";
				} else if (s.getJobYears() != 0) {
					salaryRateResult = "* "+s.getJobYears() + "년 경력 예상 연봉 대비 " + temp + "%" + " 낮음";
				} else {
					salaryRateResult = "* 신입 예상 연봉 대비 " + temp + "%" + " 낮음";
				}
			}
			

			
			
		}
		
		
			
		System.out.println("salaryRateResult:"+salaryRateResult);
		
		
		
		model.addAttribute("salaryRateResult", salaryRateResult);
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
