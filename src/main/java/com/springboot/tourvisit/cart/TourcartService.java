package com.springboot.tourvisit.cart;

import java.util.List;

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
	public List<cartVO> tourcartinsert(String contentid, String memberid) {
		tourcarDAO.insert(contentid,memberid);
		return null;
	}

}
