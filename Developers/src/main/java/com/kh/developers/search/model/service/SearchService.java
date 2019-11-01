package com.kh.developers.search.model.service;

import java.util.List;

import com.kh.developers.search.model.vo.JobField;
import com.kh.developers.search.model.vo.Position;

public interface SearchService {
	//직업분야리스트 
	List<JobField> jobfieldList();
	//직업분야리스트(Ajax)
	List<JobField> jobfieldAjaxList(String jobName);
	//탐색페이지(포지션리스트)
	List<Position> positionList();
	
}
