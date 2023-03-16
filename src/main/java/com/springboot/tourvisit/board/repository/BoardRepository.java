package com.springboot.tourvisit.board.repository;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.springboot.tourvisit.board.model.BoardVO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BoardRepository {
	
	// @PersistenceContext : JPA의 ORM을 처리해주는 EntityManager을 불러올 때 쓰는 애노테이션 입니다.
	@PersistenceContext	
	private final EntityManager em;
	

	public void insert(BoardVO vo) {
		vo.setRegDate(LocalDate.now());
		vo.setUpdateDate(LocalDate.now());
		em.persist(vo);								
	}
	
	// 게시글 목록 조회
	public List<BoardVO> selectBoardList(BoardVO vo) throws Exception {
		String jpql = "select a from BoardVO a order by bno desc";
		TypedQuery<BoardVO> query = em.createQuery(jpql, BoardVO.class);
		
		List<BoardVO> boardList = query.getResultList();

		return boardList;
	}
	
	public BoardVO selectById(BoardVO vo) {
		
		BoardVO result = null;
		try {
			result = em.createQuery("select a from BoardVO a where a.id = (select max(a.id) from BoardVO a)",BoardVO.class).getSingleResult();
		}
		catch (NoResultException e) {				// 1. 값이 0개일 경우 예외처리
			System.out.println("No Result");
		}
		catch (NonUniqueResultException e) {		// 2. 값이 2개 이상일 경우 예외처리
			System.out.println("No Unique Result");
		}
		
		return result;
	}
	
	public void delete(BoardVO vo) {
		em.remove(vo);								// em.remove : JPA를 통해 값을 제거할 때
	}

	// 게시글 상세조회
	public BoardVO detailView(Long bno) {
		
		String jpql = "select a from BoardVO a where a.bno = :bno";
		TypedQuery<BoardVO> query = em.createQuery(jpql, BoardVO.class);
		query.setParameter("bno", bno);
		
		BoardVO detail = query.getSingleResult();
		
		return detail;
	}
}