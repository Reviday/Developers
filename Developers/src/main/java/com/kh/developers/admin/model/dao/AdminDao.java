package com.kh.developers.admin.model.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import com.kh.developers.member.model.vo.Member;

public interface AdminDao {

	List<Member> selectMemberList(SqlSessionTemplate sessionint, int cPage, int numPerPage);
}
