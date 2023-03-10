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
					// em.createQuery : JPA를 통해 쿼리문을 직접 입력할 때
					// getSingleResult() : 값이 단 하나일 경우를 처리하는 메소드 (0개나 2개 이상일 경우를 예외처리 해줘야함) 
			//  * JPQL : SQL과 매우 유사한 문법 : 별칭은 필수로 작성 (as키워드는 생략 가능)
			//    [예시]
			//    select m from Member as m where m.age > 21
			// 	  또는 JPQL 키워드는 대문자도 사용 가능함
			//	 (대소문자 구분 안함. 하지만, Entity와 속성은 대소문자 구분함)
			//    SELECT m FROM Member AS m WHERE m.age > 21
			//	   또는 as 생략도 가능함.
			//    select m from Member m where m.age > 21
			//    "중요참고) JPQL 문법 이해_무단전재및배포금지.txt" 도 참고 바랍니다. 
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
	
}