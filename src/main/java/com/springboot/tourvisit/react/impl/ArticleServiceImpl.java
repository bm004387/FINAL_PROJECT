package com.springboot.tourvisit.react.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.tourvisit.react.model.Article;
import com.springboot.tourvisit.react.repository.ArticleRepository;


@Service("articleService")
public class ArticleServiceImpl implements ArticleService{
	@Autowired
	private ArticleRepository dao;
	
	public void insert(Article article) {
		dao.save(article);
	}
	
	public void update(Article article) {
		Article currArticle = dao.findTopByOrderByArticleIdDesc();
		currArticle.setArticleTitle(article.getArticleTitle());
		currArticle.setArticleContent(article.getArticleContent());
		dao.save(currArticle);
	}
	
	public void delete(Article article) {
		dao.delete(article);
	}
	
	public Article select() {
		return dao.findTopByOrderByArticleIdDesc();
	}
}