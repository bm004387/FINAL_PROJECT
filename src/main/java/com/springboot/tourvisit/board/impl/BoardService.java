package com.springboot.tourvisit.board.impl;

import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springboot.tourvisit.board.model.BoardVO;
import com.springboot.tourvisit.board.repository.BoardRepository;

import lombok.RequiredArgsConstructor;

@Service("BoardService")
@RequiredArgsConstructor
public class BoardService {
	
	// @RequiredArgsConstructor : private final이 붙은 필드의 생성자를 자동으로 추가해주고, @Autowired를 통해 주입도 자동으로 해주는 롬복 애노테이션
	private final BoardRepository BoardDAO;

	
	public List<BoardVO> selectById(BoardVO vo) {
		return BoardDAO.selectById(vo);
	}
	
	public List<BoardVO> selectBoardList(BoardVO vo) throws Exception {
		List<BoardVO> boardList = BoardDAO.selectBoardList(vo);
		
		
		return boardList;
	}

	// select 쿼리처럼 조회하는 것이 아닌 insert, update, delete의 경우 @Transactional 애노테이션을 붙여 트랜잭션 처리를 해줘야함
	// (commit, rollback 등이 필요한 쿼리문...)
	@Transactional
	public void insert(BoardVO vo) {
		BoardDAO.insert(vo);
	}
	
	@Transactional
	public void update(BoardVO vo, String title, String content) {
		List<BoardVO> selected = BoardDAO.selectById(vo);
		((BoardVO) selected).setTitle(title);
		((BoardVO) selected).setContent(content);
		((BoardVO) selected).setUpdateDate(LocalDate.now());
	}
	
	@Transactional
	public void delete(BoardVO vo) {
		List<BoardVO> selected = BoardDAO.selectById(vo);
		BoardDAO.delete((BoardVO) selected);
	}

	@Transactional
	public BoardVO detailView(Long bno) {
		return BoardDAO.detailView(bno);
	}

}