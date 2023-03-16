package com.springboot.tourvisit.react.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.springboot.tourvisit.react.model.Article;


@Repository
public interface ArticleRepository extends CrudRepository<Article, Integer>{
	
	Article findTopByOrderByArticleIdDesc();
	
	Article save(Article article);
	
	void delete(Article article);
	
}