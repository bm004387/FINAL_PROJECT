package com.springboot.tourvisit.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springboot.tourvisit.model.ArticleVO;
import com.springboot.tourvisit.repository.ArticleRepository;

import lombok.RequiredArgsConstructor;

@Service("articleService")
@RequiredArgsConstructor
public class ArticleService {
	
	// @RequiredArgsConstructor : private final이 붙은 필드의 생성자를 자동으로 추가해주고, @Autowired를 통해 주입도 자동으로 해주는 롬복 애노테이션
	private final ArticleRepository articleDAO;

	
	public ArticleVO selectById(ArticleVO vo) {
		return articleDAO.selectById(vo);
	}

	// select 쿼리처럼 조회하는 것이 아닌 insert, update, delete의 경우 @Transactional 애노테이션을 붙여 트랜잭션 처리를 해줘야함
	// (commit, rollback 등이 필요한 쿼리문...)
	@Transactional
	public void insert(ArticleVO vo) {
		articleDAO.insert(vo);
	}
	
	@Transactional
	public void update(ArticleVO vo, String title, String content) {
		ArticleVO selected = articleDAO.selectById(vo);
		selected.setTitle(title);
		selected.setContent(content);
	}
	
	@Transactional
	public void delete(ArticleVO vo) {
		ArticleVO selected = articleDAO.selectById(vo);
		articleDAO.delete(selected);
	}

}