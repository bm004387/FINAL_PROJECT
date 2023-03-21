package com.springboot.tourvisit.react.repository;

import java.time.LocalDate;

import org.springframework.data.jpa.repository.JpaRepository;

import com.springboot.tourvisit.react.model.ReactBoard;

public interface ReactBoardRepository extends JpaRepository<ReactBoard, Integer>{
	
}
