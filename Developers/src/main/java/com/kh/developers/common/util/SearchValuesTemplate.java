package com.kh.developers.common.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SearchValuesTemplate {

	//검색내용에서 핵심 value만 저장하는 Map
	private Map<String, Object> searchValue=new HashMap<String, Object>();
	
	// 기본생성자
	public SearchValuesTemplate() {}
	
	// 매개변수 생성자
	// 매개변수로 value를 받아 로직에따라 검색어 분류 로직을 처리한다.
	public SearchValuesTemplate(String value) {
		// 입력받은 검색어에서 특수문자를 찾는다. 
		String tempValue=value.trim();//공백제거

		//특수문자 필터링 
		if(!tempValue.matches("[0-9|a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힝]*")){
		    //특수문자가 있을 경우
			tempValue=StringReplace(tempValue);
		}

		//변환으로인한 연속 스페이브바 제거
		tempValue=continueSpaceRemove(tempValue);

		// 입력받은 검색어를 \s를 기준으로 분리하여 배열에 저장
		String[] tempSearchStr=tempValue.split("\\s");

		// 조사 처리
		// 로직 : 조사 포함/비포함 두 종류를 같이 검색 단어로 설정한다.
		List<String> searchStr=new ArrayList<String>();
		for(String str:tempSearchStr) {
			searchStr.add(str);
			String temp=postpositionReplace(str);
			if(!str.equals(temp)) searchStr.add(temp);
		}

		// 숫자형 검색어 찾기 
		List<Integer> intList=new ArrayList<Integer>();
		for(String str:searchStr) {
			try {
				intList.add(Integer.parseInt(str));
			} catch(Exception e) {
				/*변환 불가*/
			}
		}

		//문자형 value에서 
		searchValue.put("searchStr",searchStr);
		if(intList.size()>0) {
			searchValue.put("searchInt",intList);
		}
	}
	
	//조사 제거 하기
	public String postpositionReplace(String str) {
		//사용하면서 추가하도록 하겠음. 
		//조사가 너무 많아서 일단 많이 쓸 것 같은 것만 추가.
		String match="(이$)|(가$)|(께서$)|(에서$)|(에게$)|(이다$)|(이랑$)|(랑$)|(한다$)|(하다$)|(한데$)|(한$)|(하지$)|(다$)|(을$)|(를$)|(이$)|(가$)|(의$)|(에$)|($에게)|(에서$)|(에게서$)|(한테$)|(로$)|(으로$)|(와$)|(과$)|(아$)|(야$)|(은$)|(는$)|(라$)|(니라$)";
		str=str.replaceAll(match, "");
		return str;
	}
	
	//특수문자 제거 하기
	public String StringReplace(String str){       
		String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
		str=str.replaceAll(match, " ");
		return str;
	}
 
    //연속 스페이스 제거
	public String continueSpaceRemove(String str){
		String match2 = "\\s{2,}";
		str = str.replaceAll(match2, " ");
		return str;
	}
	
	public Map<String, Object> getSearchValue() {
		return searchValue;
	}
}
