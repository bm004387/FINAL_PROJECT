package com.springboot.tourvisit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springboot.tourvisit.impl.ArticleService;
import com.springboot.tourvisit.model.ArticleVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ArticleController {

	// @RequiredArgsConstructor : private final이 붙은 필드의 생성자를 자동으로 추가해주고, @Autowired를 통해 주입도 자동으로 해주는 롬복 애노테이션
	private final ArticleService articleService;

	// 아래 모든 메소드에 request.setAttribute("article", articleService.selectById(vo))를 해주는것과 같은 역할
	@ModelAttribute("article")
	public ArticleVO getArticle(ArticleVO vo) {
		return articleService.selectById(vo);
	}
	
	// 홈 화면
	@RequestMapping("/")
	public String home() {
		return "main";
	}
	
	@RequestMapping("/about/about.do")
	public String about() {
		return "about/about";
	}
	
	// 게시글 등록 폼
	@GetMapping("/article/write.do")
	public String insertForm() {
		return "views/insertForm";
	}
	
	// 게시글 등록
	@PostMapping("/article/write.do")
	public String insert(ArticleVO vo) {
		articleService.insert(vo);
		return "views/insertSuccess";
	}
	
	// 게시글 조회
	@RequestMapping("/article/read.do")
	public String selectById(ArticleVO vo) {
		return "views/readArticle";
	}
	
	// 게시글 수정 폼
	@GetMapping("/article/modify.do")
	public String updateForm() {
		return "views/updateForm";
	}
	
	// 게시글 수정
	@PostMapping("/article/modify.do")
	public String update(ArticleVO vo, String title, String content) {
		articleService.update(vo, title, content);
		return "views/updateSuccess";
	}
	
	// 게시글 삭제 폼
	@GetMapping("/article/delete.do")
	public String deleteForm() {
		return "views/deleteForm";
	}
	
	// 게시글 삭제
	@PostMapping("/article/delete.do")
	public String delete(ArticleVO vo) {
		articleService.delete(vo);
		return "views/deleteSuccess";
	}

}