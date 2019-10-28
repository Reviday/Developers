package com.kh.developers.common.API;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BusinessAPISearchController {
	
	private static Logger logger = LoggerFactory.getLogger(BusinessAPISearchController.class);
	
	@RequestMapping("/business/APISearch.do")
	public ModelAndView apiSearch(String input) {
		System.out.println(input);
		ModelAndView mv=new ModelAndView();
		BusinessAPISearch bas=new BusinessAPISearch();
		String result=bas.businessSearch(input);
		logger.debug("데이터가 잘 넘어옴? :"+result);
		mv.addObject("result", result);
		mv.setViewName("jsonView");
		return mv;
		
	}

}
