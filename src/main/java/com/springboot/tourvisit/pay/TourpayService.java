package com.springboot.tourvisit.pay;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springboot.tourvisit.api.ApiRepository;

import lombok.RequiredArgsConstructor;

@Service("TourpayService")
@RequiredArgsConstructor
public class TourpayService {

	@Autowired
	 final tourpayRepository tourpayDAO = null;


	
	public List<paylistDTO> tourplayselect(String memberid) {
		return tourpayDAO.getResultList(memberid);
		 
	}
	
	public List<payimportVO> tourpayimselect() {
		return tourpayDAO.getResultList();
		 
	}

	

	

}
