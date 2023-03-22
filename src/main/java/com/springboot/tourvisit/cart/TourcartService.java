package com.springboot.tourvisit.cart;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springboot.tourvisit.api.ApiRepository;

import lombok.RequiredArgsConstructor;

@Service("TourcartService")
@RequiredArgsConstructor
public class TourcartService {

	@Autowired
	 final tourcartRepository tourcarDAO = null;

	@Transactional
	public List<cartVO> tourcartinsert(String contentid, String memberid,String price) {
		tourcarDAO.insert(contentid,memberid,price);
		return null;
	}
	
	public List<cartDTO> tourcartselect(String memberid) {
		return tourcarDAO.getResultList(memberid);
		 
	}

	@Transactional
	public List<tourpayendVO> tourpayinsert(String memberid) {
		tourcarDAO.insert(memberid);
		return null;
	}

	

}
