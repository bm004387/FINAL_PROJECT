package com.springboot.tourvisit.react.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.tourvisit.react.model.ReactBoard;
import com.springboot.tourvisit.react.repository.ReactBoardRepository;



@Service
public class ReactBoardService {
	
	@Autowired
	private ReactBoardRepository boardRepository;
	
	public List<ReactBoard> getAllBoard(){
		return boardRepository.findAll();
	}

}
