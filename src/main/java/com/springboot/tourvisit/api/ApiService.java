package com.springboot.tourvisit.api;

import java.util.List;

import org.hibernate.annotations.DynamicInsert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springboot.tourvisit.api.ApiVO;
import com.springboot.tourvisit.api.ApiRepository;

import lombok.RequiredArgsConstructor;

@Service("apiService")
@RequiredArgsConstructor
public class ApiService {
	
	@Autowired
	 final ApiRepository apiDAO = null;

	
	public ApiVO selectById(ApiVO vo) {
		return apiDAO.selectById(vo);
	}

	// select 쿼리처럼 조회하는 것이 아닌 insert, update, delete의 경우 @Transactional 애노테이션을 붙여 트랜잭션 처리를 해줘야함
	// (commit, rollback 등이 필요한 쿼리문...)
	@Transactional
	public void insert(ApiVO vo) {
		apiDAO.insert(vo);
	}
	

	public List<ApiVO> selectApiList() {
		
		System.out.println("ApiService");
		return apiDAO.getResultList();
	}

	public List<ApiVO> selectApisearchList(String keyword) {
		
		return apiDAO.searchtour(keyword);
	}
	
	
	

}