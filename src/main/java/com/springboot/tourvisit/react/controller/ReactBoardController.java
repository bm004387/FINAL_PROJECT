package com.springboot.tourvisit.react.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
//	@GetMapping("/board")
//	public ResponseEntity<Map> getAllBoards(@RequestParam(value = "p_num", required=false) Integer p_num) {
//		if (p_num == null || p_num <= 0) p_num = 1;
//		
//		return reactBoardService.getPagingBoard(p_num);
//	}


	@GetMapping("/board")
	public List<ReactBoard> getAllBoards(){
		return reactBoardService.getAllBoard();
	}
	
	@PostMapping("/create-board")
	public ReactBoard createBoard(@RequestBody ReactBoard reactBoard) {
		return reactBoardService.createBoard(reactBoard);
	}

	@GetMapping("/read-board/{bno}")
	public ResponseEntity<ReactBoard> getBoardByNo(@PathVariable Integer bno) {
		return reactBoardService.getBoard(bno);
	}
	
	@PutMapping("/create-board/{bno}")
	public ResponseEntity<ReactBoard> updateBoardByNo(@PathVariable Integer bno, @RequestBody ReactBoard reactBoard){
		return reactBoardService.updateBoard(bno, reactBoard);
	}
	
	@DeleteMapping("/board/{bno}")
	public ResponseEntity<Map<String, Boolean>> deleteBoardByNo(@PathVariable Integer bno) {
		return reactBoardService.deleteBoard(bno);
	}
}
