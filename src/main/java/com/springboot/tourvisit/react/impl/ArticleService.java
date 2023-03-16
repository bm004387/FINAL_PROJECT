package com.springboot.tourvisit.react.impl;

import com.springboot.tourvisit.react.model.Article;

public interface ArticleService {

	void insert(Article article);

	void update(Article article);

	void delete(Article article);

	Article select();

}