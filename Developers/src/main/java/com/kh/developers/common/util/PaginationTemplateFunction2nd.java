package com.kh.developers.common.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class PaginationTemplateFunction2nd {
	
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
	private int totalData;
	private int parameterIndex=0;
	private boolean useParamCPage=false;
	private boolean useParamNumPerPage=false;
	
	// 매핑용 변수
	private String onClickFunction; 
	
	// 파라미터 사용 여부에 따른 함수 파라미터 설정용 변수
	private Map<Integer, Object> param=new HashMap<Integer, Object>();
	
	/*
	 * 페이징 처리를 template을 만들어 사용하기위해
	 * 기본적인 인수로 서블렛으로부터 request를 전달받고
	 * 데이터의 총 갯수인 totalData와
	 * 해당 함수를 적용하기 위한 함수 이름을 받는다.(onClickFunction)
	 */
	public PaginationTemplateFunction2nd (HttpServletRequest request, int totalData, String onClickFunction)  
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
		this.pageBarSize=5;
		pageNo=((this.cPage - 1) / pageBarSize) * pageBarSize + 1;
		pageEnd=pageNo + pageBarSize - 1;
		pageBar="";
		
		//함수명 설정
		this.onClickFunction=onClickFunction;
	}
	
	private String setPageBar(boolean UseParam){
		
		// pageBar 소스코드 작성!
		String parameter="";
		
		// 우선, 함수 파라미터를 사용하는지를 확인한다. 
		// 함수 파라미터를 사용한다면 사용자가 설정한 파라미터를 담아준다.
		if(UseParam) {
			//useParamPage가 true 상태이면
			//모든 파라미터 끝에 자동으로 cPage, numPerPage 파라미터가 따라 붙는다.
			for(int i=1; i<=parameterIndex; i++) {
				//스크립트 내부에서 돌아가는 함수이므로, "의 중요성은 크지 않다고 생각하여 
				//아래와 같이 누적시킨다.
				parameter+=param.get(i);
				if(i!=parameterIndex)parameter+=", ";
			}
			
			if(useParamNumPerPage) {
				if(parameterIndex>0) parameter+=", ";
				parameter+=numPerPage;
			}
		}
		
		pageBar+="<ul class=\"pagination\">";
		// 이전 pagination
		if(pageNo == 1) {
			pageBar += "<li class=\"disabled\"><a href=\"#\">«</a></li>";
		} else {
			if(useParamCPage) {
				if(parameterIndex>0)
					pageBar += "<li><a href='javascript:"+onClickFunction+"("+parameter+", "+(pageNo-1)+");'>«</a></li>";
				else 
					pageBar += "<li><a href='javascript:"+onClickFunction+"("+(pageNo-1)+");'>«</a></li>";
			} else {
				pageBar += "<li><a href='javascript:"+onClickFunction+"("+parameter+");'>«</a></li>";
			}
		}
		
		// 페이지 pagination
		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<li class=\"active\"><a href='javascript:void(0);'>" + pageNo + "<span class=\"sr-only\">(current)</span></a></li>";
			} else {
				if(useParamCPage) {
					if(parameterIndex>0)
						pageBar += "<li><a href='javascript:"+onClickFunction+"("+parameter+", "+pageNo+");'>"+pageNo+"</a></li>";
					else 
						pageBar += "<li><a href='javascript:"+onClickFunction+"("+pageNo+");'>"+pageNo+"</a></li>";
				} else {
					pageBar += "<li><a href='javascript:"+onClickFunction+"("+parameter+");'>"+pageNo+"</a></li>";
				}
			}
			pageNo++;
		}

		// 다음 pagination
		if (pageNo > totalPage) {
			pageBar += "<li class=\"disabled\"><a href=\"#\">»</a></li>";
		} else {
			if(useParamCPage) {
				if(parameterIndex>0)
					pageBar += "<li><a href='javascript:"+onClickFunction+"("+parameter+", "+(pageNo+1)+");'>»</a></li>";
				else 
					pageBar += "<li><a href='javascript:"+onClickFunction+"("+(pageNo+1)+");'>»</a></li>";
			} else {
				pageBar += "<li><a href='javascript:"+onClickFunction+"("+parameter+");'>»</a></li>";
			}
		}
		pageBar+="</ul>";
		return pageBar;
	}
	
	//넘겨줄 파라미터 값을 설정하는 함수
	//넘겨줄 값이 없으면 추가하지 않아도 된다.
	//[기본 자료형에 대해서만 처리한다]
	// 파라미터인덱스는 1부터 시작한다.(PreparedStatement와 비슷한 구조)
	public void setString(int parameterIndex, String value) throws UsedParameterIndexException, IncorrectOrderOfIndexException
	{
		if(checkException(parameterIndex)) {
			this.parameterIndex=parameterIndex;
			param.put(parameterIndex, value);
		}
	}
	public void setLong(int parameterIndex, long value) throws UsedParameterIndexException, IncorrectOrderOfIndexException
	{
		if(checkException(parameterIndex)) {
			this.parameterIndex=parameterIndex;
			param.put(parameterIndex, value);
		}
	}
	public void setInt(int parameterIndex, int value) throws UsedParameterIndexException, IncorrectOrderOfIndexException
	{
		if(checkException(parameterIndex)) {
			this.parameterIndex=parameterIndex;
			param.put(parameterIndex, value);
		}
	}
	public void setDouble(int parameterIndex, double value) throws UsedParameterIndexException, IncorrectOrderOfIndexException
	{
		if(checkException(parameterIndex)) {
			this.parameterIndex=parameterIndex;
			param.put(parameterIndex, value);
		}
	}
	public void setFloat(int parameterIndex, float value) throws UsedParameterIndexException, IncorrectOrderOfIndexException
	{
		if(checkException(parameterIndex)) {
			this.parameterIndex=parameterIndex;
			param.put(parameterIndex, value);
		}
	}
	public void setShort(int parameterIndex, short value) throws UsedParameterIndexException, IncorrectOrderOfIndexException
	{
		if(checkException(parameterIndex)) {
			this.parameterIndex=parameterIndex;
			param.put(parameterIndex, value);
		}
	}
	public void setByte(int parameterIndex, byte value) throws UsedParameterIndexException, IncorrectOrderOfIndexException
	{
		if(checkException(parameterIndex)) {
			this.parameterIndex=parameterIndex;
			param.put(parameterIndex, value);
		}
	}
	public void setChar(int parameterIndex, char value) throws UsedParameterIndexException, IncorrectOrderOfIndexException
	{
		if(checkException(parameterIndex)) {
			this.parameterIndex=parameterIndex;
			param.put(parameterIndex, value);
		}
	}
	public void setBoolean(int parameterIndex, boolean value) throws UsedParameterIndexException, IncorrectOrderOfIndexException
	{
		if(checkException(parameterIndex)) {
			this.parameterIndex=parameterIndex;
			param.put(parameterIndex, value);
		}
	}
	
	private boolean checkException(int parameterIndex) throws UsedParameterIndexException, IncorrectOrderOfIndexException {
		boolean flag= false;
		if(param.get(parameterIndex)!=null) {
			// null이 아니다. 값이 존재한다. 
			// 중복값이 존재하므로 exception을 던져준다.
			throw new UsedParameterIndexException();
		} else if(this.parameterIndex!=parameterIndex-1) {
			// 현재 index값이 추가하려는 값에서 -1값과 같지 않으면 
			// 인덱스 순서를 지키지 않고 있음이므로 exception을 던져준다.
			throw new IncorrectOrderOfIndexException();
		} else {
			//값이 존재하지 않으면 값을 넣어도 되는 부분이라고 판단해도 된다.
			flag=true;
		}
		return flag;
	}
	
	//prameter로 cPage와 numPerPage 파라미터가 필요할때 설정하는 함수.
	//이 함수가 효과를 보기위해서는 UseParam 상태에서 pageBar를 불러와야 한다.
	public void setUseParamCPage() {
		this.useParamCPage=true;
	}
	
	public void setUseParamNumPerPage() {
		this.useParamNumPerPage=true;
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
		totalPage=(int) Math.ceil((double) totalData / this.numPerPage);
		pageNo=((this.cPage - 1) / pageBarSize) * pageBarSize + 1;
		pageEnd=pageNo + pageBarSize - 1;
	}
	
	//NumPerPage를 수정하기 위한 setter
	public void setNumPerPage(int numPerPage) {
		this.numPerPage=numPerPage;
		totalPage=(int) Math.ceil((double) totalData / this.numPerPage);
	}
	
	//pageBarSzie 설정을 위한 setter
	public void setPageBarSize(int pageBarSize) {
		this.pageBarSize=pageBarSize;
		pageNo=((this.cPage - 1) / pageBarSize) * pageBarSize + 1;
		pageEnd=pageNo + pageBarSize - 1;
	}
	
	public String getPageBar() {
		// 페이지 바 만들기(파라미터를 사용하지 않는 기본 함수)
		pageBar=setPageBar(false); 
		return pageBar;
	}
	
	public String getPageBar(boolean UseParam) {
		// 페이지 바 만들기(파라미터 사용 유/무에 따른 함수 생성식)
		pageBar=setPageBar(UseParam);
		return pageBar;
	}
	
	// 값이 있는 인덱스에 값을 넣으려 했을 경우 발생하는 예외
	class UsedParameterIndexException extends Exception{

		UsedParameterIndexException(){// 문자열을 매개변수로 받는 생성자
			super("The index has a value.");// 조상인 Exception 클래스의 생성자를 호출한다.
		}

	}
	
	// 인데스 순서가 기준과 일치하지 않을 경우 발생시키는 예외
	class IncorrectOrderOfIndexException extends Exception{

		IncorrectOrderOfIndexException(){// 문자열을 매개변수로 받는 생성자
			super("Incorrect order of index.");// 조상인 Exception 클래스의 생성자를 호출한다.
		}

	}
}
