package com.springboot.tourvisit.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springboot.tourvisit.board.impl.BoardService;
import com.springboot.tourvisit.board.model.BoardVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BoardController {

	// @RequiredArgsConstructor : private final이 붙은 필드의 생성자를 자동으로 추가해주고, @Autowired를 통해 주입도 자동으로 해주는 롬복 애노테이션
	private final BoardService boardService;

	// 아래 모든 메소드에 request.setAttribute("article", articleService.selectById(vo))를 해주는것과 같은 역할
	@ModelAttribute("board")
	public BoardVO getArticle(BoardVO vo) {
		return boardService.selectById(vo);
	}
	
	// 홈 화면
	
	@RequestMapping("/")
	public String index() {
		return "index/index";
	}
	
	@RequestMapping("/main.do")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/about.do")
	public String about() {
		return "about/about";
	}
	
	@RequestMapping("/faq.do")
	public String faq() {
		return "faq/faq";
	}

	// 게시판 홈 화면
//	@RequestMapping("/board.do")
//	public String board() {
//		return "views/board";
//	}
	
	@RequestMapping(value="/board.do")
	public String selectBoardList(@ModelAttribute("boardVO")BoardVO vo, HttpServletRequest request, HttpSession session, Model model) throws Exception{
		try {
			// 목록 조회
			List<BoardVO> boardList = boardService.selectBoardList(vo);
		      System.out.println(boardList);
			
			model.addAttribute("boardList", boardList);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "views/board";
	}
	
	// 게시글 등록 폼
	@GetMapping("/write.do")
	public String insertForm() {
		return "views/insertForm";
	}
	
	// 게시글 등록
	@PostMapping("/write.do")
	public String insert(BoardVO vo) {
		boardService.insert(vo);
		return "views/insertSuccess";
	}
	
	// 게시글 조회
	@RequestMapping("/read.do")
	public String selectById(BoardVO vo) {
		return "views/readArticle";
	}
	
	// 게시글 수정 폼
	@GetMapping("/modify.do")
	public String updateForm() {
		return "views/updateForm";
	}
	
	// 게시글 수정
	@PostMapping("/modify.do")
	public String update(BoardVO vo, String title, String content) {
		boardService.update(vo, title, content);
		return "views/updateSuccess";
	}
	
	// 게시글 삭제 폼
	@GetMapping("/delete.do")
	public String deleteForm() {
		return "views/deleteForm";
	}
	
	// 게시글 삭제
	@PostMapping("/delete.do")
	public String delete(BoardVO vo) {
		boardService.delete(vo);
		return "views/deleteSuccess";
	}

}