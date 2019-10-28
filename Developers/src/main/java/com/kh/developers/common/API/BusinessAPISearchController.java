package com.kh.developers.common.API;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BusinessAPISearchController {
	
	private static Logger logger = LoggerFactory.getLogger(BusinessAPISearchController.class);
	
	@RequestMapping("/business/APISearch.do")
	public void apiSearch(String input, HttpServletResponse res) throws IOException {
		System.out.println(input);
		ModelAndView mv=new ModelAndView();
		BusinessAPISearch bas=new BusinessAPISearch();
		String result=bas.businessSearch(input);
		res.setContentType("application/json;charset=UTF-8");
		res.getWriter().print(result);
		
	}

}
