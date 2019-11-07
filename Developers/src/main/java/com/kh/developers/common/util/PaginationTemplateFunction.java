package com.kh.developers.common.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class PaginationTemplateFunction {
	
	/***********************************
	 * 페이징 처리에 필요한 변수 
	 * 1. cPage : 현재 페이지 
	 * 2. numPerPage : 테이블(page)에 출력될 데이터의 수 
	 * 3. totalDate : 현재 총 데이터의 수 
	 * 4. totalPage : 전체 페이지 수 (나머지 올림) 
	 * ----- 페이지바를 구성하는 변수
	 * 5. pageNo : 페이지바에서 페이지 값 출력해주는 변수 
	 * 6. pageEnd : 페이지바에서 페이지값의 끝 번호 
	 * 7. pageBarSize : 페이지바에서 페이지값이 출력되는 갯수 
	 * 8. pageBar : 페이지바를 구성하는 코드를 누적시키는 변수
	 * 
	 * 페이징 처리시 계산공식
	 * 1. totalPage : (int)ceil(totalData / numPerPage) // 무조건 올림처리 
	 * 2. 시작번호 : (cPage-1)*numPerPage+1 
	 * 3. 끝번호 : cPage*numPerPage 
	 * 4. 페이지시작번호 : ((cPage-1)/pageBarSize)*pageBarSize+1;
	 ************************************/
	private int cPage;
	private int numPerPage;
	private String pageBar;
	private int totalPage;
	private int pageBarSize;
	private int pageNo;
	private int pageEnd;
	
	// 매핑용 변수
	private String onClickFunction; 
	
	/*
	 * 페이징 처리를 template을 만들어 사용하기위해
	 * 기본적인 인수로 서블렛으로부터 request를 전달받고
	 * 데이터의 총 갯수인 totalData와
	 * 해당 함수를 적용하기 위한 함수 이름을 받는다.(onClickFunction)
	 */
	public PaginationTemplateFunction (HttpServletRequest request, int totalData, String onClickFunction)  
	{
		// 페이지 설정
		try {
			this.cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			this.cPage = 1;
		}
		
		try {
			this.numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
		} catch (NumberFormatException e) {
			this.numPerPage = 15;
		}
		
		// 페이징 처리
		totalPage=(int) Math.ceil((double) totalData / this.numPerPage);
		this.pageBarSize=10;
		pageNo=((this.cPage - 1) / pageBarSize) * pageBarSize + 1;
		pageEnd=pageNo + pageBarSize - 1;
		pageBar="";
		this.onClickFunction=onClickFunction;
	}
	
	private String setPageBar(String onClickFunction) 
	{
		pageBar+="<ul class=\"pagination\">";
		// 이전 pagination
		if(pageNo == 1) {
			pageBar += "<li class=\"disabled\"><a href=\"#\">«</a></li>";
		} else {
			pageBar += "<li><a href='javascript:void(0);' onclick='"+onClickFunction+"("+(cPage-1)+");'>«</a></li>";
		}
		
		// 페이지 pagination
		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<li class=\"active\"><a href=\"javascript:void(0);\">" + pageNo + "<span class=\"sr-only\">(current)</span></a></li>";
			} else {
				pageBar += "<li><a href='javascript:void(0);' onclick='"+onClickFunction+"("+pageNo+");' >"+pageNo+"</a></li>";
			}
			pageNo++;
		}

		// 다음 pagination
		if (pageNo > totalPage) {
			pageBar += "<li class=\"disabled\"><a href=\"javascript:void(0);\">»</a></li>";
		} else {
			pageBar += "<li><a href='javascript:void(0);' onclick='"+onClickFunction+"("+(pageNo+1)+");'>»</a></li>";
		}
		pageBar+="</ul>";
		return pageBar;
	}
	
	//처리된 값을 반환 받을 getter
	public int getcPage() {
		return cPage;
	}

	public int getNumPerPage() {
		return numPerPage;
	}
	
	public void setCPage(int cPage) {
		this.cPage=cPage;
	}
	
	//NumPerPage를 수정하기 위한 setter
	public void setNumPerPage(int numPerPage) {
		this.numPerPage=numPerPage;
	}
	
	public String getPageBar() {
		// 페이지 바 만들기
		pageBar=setPageBar(onClickFunction);
		return pageBar;
	}

}
