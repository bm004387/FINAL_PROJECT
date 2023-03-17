package com.springboot.tourvisit.react.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.springboot.tourvisit.react.model.ReactBoard;
import com.springboot.tourvisit.react.service.ReactBoardService;


@CrossOrigin(origins = "http://localhost3000")
@RestController
@RequestMapping("/api")
public class ReactBoardController {
	
	@Autowired
	private ReactBoardService reactBoardService;
	
	@GetMapping("/board")
	public List<ReactBoard> getAllBoards(){
		return reactBoardService.getAllBoard();
	}
}
