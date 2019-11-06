package com.kh.developers.common.page;

public class PageFactory2 {
	public static String getApplPageBar(int totalData, int cPage, int numPerPage) {
		String pageBar="";
		int pageBarSize=5;
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		int pageNo=cPage>pageBarSize/2?cPage-pageBarSize/2:((cPage-1)/pageBarSize)*pageBarSize+1;
		pageNo=totalPage-cPage<cPage-pageBarSize?totalPage-pageBarSize+1:pageNo;
		int pageEnd=cPage>pageBarSize/2?cPage+pageBarSize/2:pageNo+pageBarSize-1;

		pageBar="<ul class='pagination justify-content-center pagingation-sm appl-page'>";
		if(cPage==1) {			
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_appl_nav(appl_index,"+(cPage-1)+")'>이전</a>";
			pageBar+="</li>";
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_appl_nav(appl_index,"+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		if(cPage==totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_appl_nav(appl_index,"+(cPage+1)+")'>다음</a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		return pageBar;
	}
}
