package com.springboot.tourvisit.api;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.springboot.tourvisit.api.ApiVO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ApiRepository {
	
	// @PersistenceContext : JPA의 ORM을 처리해주는 EntityManager을 불러올 때 쓰는 애노테이션 입니다.
	@PersistenceContext	
	private final EntityManager em;
	

	public void insert(ApiVO vo) {
		// em.persist : JPA를 통해 값을 입력할 때 활용합니다.
		em.persist(vo);								
	}
	
	public ApiVO selectById(ApiVO vo) {
		
		ApiVO result = null;
		try {
			result = em.createQuery("select a from ApiVO a where a.contentid = (select max(a.contentid) from ApiVO a)",ApiVO.class).getSingleResult();
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
	
	public void delete(ApiVO vo) {
		em.remove(vo);								// em.remove : JPA를 통해 값을 제거할 때
	}
	
}