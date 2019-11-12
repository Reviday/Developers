package com.kh.developers.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.developers.admin.model.dao.AdminDao;
import com.kh.developers.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int restoreMember(Member m) {
		return dao.restoreMember(session, m);
	}
	
	@Override
	public List<Member> selectWithdrawMemberListBySearch(String value, int cPage, int numPerPage) {
		Map<String, Object> searchValue=new HashMap<String, Object>();
		String[] searchStr=value.split("\\s");
		List<Integer> intList=new ArrayList<Integer>();
		for(String str:searchStr) {
			try {
				intList.add(Integer.parseInt(str));
			} catch(Exception e) {
				/*변환 불가*/
			}
		}
		searchValue.put("searchStr",searchStr);
		if(intList.size()>0) {
			searchValue.put("searchInt",intList);
		}
 		return dao.selectWithdrawMemberListBySearch(session, searchValue, cPage, numPerPage);
	}
	
	@Override
	public int selectWithdrawMemberCountBySearch(String value) {
		Map<String, Object> searchValue=new HashMap<String, Object>();
		String[] searchStr=value.split("\\s");
		List<Integer> intList=new ArrayList<Integer>();
		for(String str:searchStr) {
			try {
				intList.add(Integer.parseInt(str));
			} catch(Exception e) {
				/*변환 불가*/
			}
		}
		searchValue.put("searchStr",searchStr);
		if(intList.size()>0) {
			searchValue.put("searchInt",intList);
		}
 		return dao.selectWithdrawMemberCountBySearch(session, searchValue);
	}
	
	@Override
	public List<Member> selectWithdrawMemberList(int cPage, int numPerPage) {
		return dao.selectWithdrawMemberList(session, cPage, numPerPage);
	}
	
	@Override
	public int selectWithdrawMemberCount() {
		return dao.selectWithdrawMemberCount(session);
	}
	
	@Override
	public List<Member> selectMemberListBySearchLevel(String value, int searchLevel, int cPage, int numPerPage) {
		Map<String, Object> searchValue=new HashMap<String, Object>();
		if(value != null || !value.equals("")) {
			String[] searchStr=value.split("\\s");
			List<Integer> intList=new ArrayList<Integer>();
			for(String str:searchStr) {
				try {
					intList.add(Integer.parseInt(str));
				} catch(Exception e) {
					/*변환 불가*/
				}
			}
			searchValue.put("searchStr",searchStr);
			if(intList.size()>0) {
				searchValue.put("searchInt",intList);
			}
		}
		searchValue.put("searchLevel",searchLevel);
 		return dao.selectMemberListBySearchLevel(session, searchValue, cPage, numPerPage);
	}
	
	@Override
	public int selectMemberCountBySearchLevel(String value, int searchLevel) {
		//검색조건을 위함
		Map<String, Object> searchValue=new HashMap<String, Object>();
		if(value != null || !value.equals("")) {
			String[] searchStr=value.split("\\s");
			List<Integer> intList=new ArrayList<Integer>();
			for(String str:searchStr) {
				try {
					intList.add(Integer.parseInt(str));
				} catch(Exception e) {
					/*변환 불가*/
				}
			}
			searchValue.put("searchStr",searchStr);
			if(intList.size()>0) {
				searchValue.put("searchInt",intList);
			}
		}
		searchValue.put("searchLevel",searchLevel);
 		return dao.selectMemberCountBySearchLevel(session, searchValue);
	}
	
	@Override
	public List<Member> selectMemberListBySearch(String value, int cPage, int numPerPage) {
		Map<String, Object> searchValue=new HashMap<String, Object>();
		String[] searchStr=value.split("\\s");
		List<Integer> intList=new ArrayList<Integer>();
		for(String str:searchStr) {
			try {
				intList.add(Integer.parseInt(str));
			} catch(Exception e) {
				/*변환 불가*/
			}
		}
		searchValue.put("searchStr",searchStr);
		if(intList.size()>0) {
			searchValue.put("searchInt",intList);
		}
 		return dao.selectMemberListBySearch(session, searchValue, cPage, numPerPage);
	}
	
	@Override
	public int selectMemberCountBySearch(String value) {
		// value 값을 공백을 기준으로 검색 조건을 담는다.
		/* <검색 조건>
		 * 공백을 기준으로 단어를 분류 .
		 * 단어가 포함된 내용의 정보 리스트를 검색하여 가져온다.
		 * "토끼는 풀을 먹는다."
		 * 1. 토끼는  2. 풀을 3. 먹는다. 
		 * 기준으로 3가지 검색을 모두 수행한다.
		 * 하여, 비교적 가장 정확한 검색 루틴을 돌린다.
		 */
		Map<String, Object> searchValue=new HashMap<String, Object>();
		String[] searchStr=value.split("\\s");
		List<Integer> intList=new ArrayList<Integer>();
		for(String str:searchStr) {
			try {
				intList.add(Integer.parseInt(str));
			} catch(Exception e) {
				/*변환 불가*/
			}
		}
		searchValue.put("searchStr",searchStr);
		if(intList.size()>0) {
			searchValue.put("searchInt",intList);
		}
 		return dao.selectMemberCountBySearch(session, searchValue);
	}
	
	@Override
	public int deleteMember(Member m) {
		return dao.deleteMember(session, m);
	}
	
	@Override
	public int updateMember(Member m) {
		return dao.updateMember(session, m);
	}
	
	@Override
	public List<Member> selectMemberList(int cPage, int numPerPage) {
		return dao.selectMemberList(session, cPage, numPerPage);
	}
	
	@Override
	public int selectMemberCount() {
		return dao.selectMemberCount(session);
	}
}