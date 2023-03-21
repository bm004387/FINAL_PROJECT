package com.springboot.tourvisit.react.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.springboot.tourvisit.react.exception.ResourceNotFoundException;
import com.springboot.tourvisit.react.model.ReactBoard;
import com.springboot.tourvisit.react.repository.ReactBoardRepository;



@Service
public class ReactBoardService {
	
	@Autowired
	private ReactBoardRepository reactBoardRepository;
	
	public List<ReactBoard> getAllBoard(){
		return reactBoardRepository.findAll();
	}

	public ReactBoard createBoard(ReactBoard reactBoard) {
		reactBoard.setRegDate(LocalDate.now());
		reactBoard.setUpdateDate(LocalDate.now());
		return reactBoardRepository.save(reactBoard);
	}

	public ResponseEntity<ReactBoard> getBoard(Integer bno) {
		ReactBoard reactBoard = reactBoardRepository.findById(bno)
				.orElseThrow(() -> new ResourceNotFoundException("Not exist Board Data by no : ["+bno+"]"));
		return ResponseEntity.ok(reactBoard);
	}

}
