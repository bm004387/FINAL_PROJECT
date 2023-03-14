package com.springboot.tourvisit.cart;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class tourcartRepository {

	// @PersistenceContext : JPA의 ORM을 처리해주는 EntityManager을 불러올 때 쓰는 애노테이션 입니다.
		@PersistenceContext	
		private final EntityManager em;
	
	public void insert(String contentid, String memberid,String price) {
	
		System.out.println("카트 인서트");
		System.out.println(contentid);
		System.out.println(memberid);
		System.out.println(price);
		
		
		cartVO vo = null;
		vo = new cartVO();
		vo.setContentid(contentid);
		vo.setMemberid(memberid);
		vo.setPrice(price);
		System.out.println(vo.toString());
		
		
		// em.persist : JPA를 통해 값을 입력할 때 활용합니다.
				em.persist(vo);	
		
	}

}
