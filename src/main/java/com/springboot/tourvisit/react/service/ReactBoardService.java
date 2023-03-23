package com.springboot.tourvisit.react.service;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.springboot.tourvisit.react.exception.ResourceNotFoundException;
import com.springboot.tourvisit.react.model.ReactBoard;
import com.springboot.tourvisit.react.repository.ReactBoardRepository;



@Service
public class ReactBoardService {
	
	@Autowired
	private ReactBoardRepository reactBoardRepository;
	
//	public int findAllCount() {
//		return (int) reactBoardRepository.count();
//	}
	
//	public ResponseEntity<Map> getPagingBoard(Integer p_num) {
//		Map result = null;
//		
//		PagingUtil pu = new PagingUtil(p_num, 10, 5); // ($1:표시할 현재 페이지, $2:한페이지에 표시할 글 수, $3:한 페이지에 표시할 페이지 버튼의 수 )
//		List<ReactBoard> list = reactBoardRepository.findFromTo(pu.getObjectStartNum(), pu.getObjectCountPerPage());
//		pu.setObjectCountTotal(findAllCount());
//		pu.setCalcForPaging();
//		
//		System.out.println("p_num : "+p_num);
//		System.out.println(pu.toString());
//		
//		if (list == null || list.size() == 0) {
//			return null;
//		}
//		
//		result = new HashMap<>();
//		result.put("pagingData", pu);
//		result.put("list", list);
//		
//		return ResponseEntity.ok(result);
//	}	
	
	public List<ReactBoard> getAllBoard(){
		return reactBoardRepository.findAll(Sort.by(Sort.Direction.DESC, "bno"));
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

	public ResponseEntity<ReactBoard> updateBoard(Integer bno, ReactBoard updateBoard) {
		ReactBoard reactBoard = reactBoardRepository.findById(bno).orElseThrow(() -> new ResourceNotFoundException("Not exist Board Data by no : ["+bno+"]"));
		reactBoard.setTitle(updateBoard.getTitle());
		reactBoard.setContent(updateBoard.getContent());
		reactBoard.setWriter(updateBoard.getWriter());
		reactBoard.setUpdateDate(LocalDate.now());
		
		ReactBoard endUpdateBoard = reactBoardRepository.save(reactBoard);
		return ResponseEntity.ok(endUpdateBoard);
	}

	public ResponseEntity<Map<String, Boolean>> deleteBoard(Integer bno) {
		ReactBoard reactBoard = reactBoardRepository.findById(bno)
				.orElseThrow(() -> new ResourceNotFoundException("Not exist Board Data by no : ["+bno+"]"));
		
		reactBoardRepository.delete(reactBoard);
		Map<String, Boolean> response = new HashMap<String, Boolean>();
		response.put("Deleted Board Data by id : ["+bno+"]", Boolean.TRUE);
		return ResponseEntity.ok(response);
	}
}
