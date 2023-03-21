package com.springboot.tourvisit.react.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.springboot.tourvisit.react.model.ReactBoard;

public interface ReactBoardRepository extends JpaRepository<ReactBoard, Integer>{

//	public final static String SELECT_BOARD_LIST_PAGED = ""
//			+ "SELECT "
//			+ "rt_bno,"
//			+ "rt_title,"
//			+ "rt_content,"
//			+ "rt_writer,"
//			+ "rt_regdate,"
//			+ "rt_updatedate,"
//			+ "counts"
//			+ " FROM rt_board WHERE rownum >= ?1 and rownum <= ?2 order by rt_bno desc ";
//	
//	
//	@Query(value = SELECT_BOARD_LIST_PAGED, nativeQuery = true)
//	List<ReactBoard> findFromTo(
//			final Integer objectStartNum,
//			final Integer objectEndNum);
}
