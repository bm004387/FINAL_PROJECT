package com.springboot.tourvisit.cart;

import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.springboot.tourvisit.api.ApiVO;

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
	
	public Query getResultList(String memberid) {
		
		System.out.println("카트 리스트 작성");
	
		System.out.println(memberid);
		
		cartDTO cartRVO = new cartDTO();
		
		 cartRVO = null;
		
		// Query cartRVO1 =  (Query) em.createQuery("select a.id, a.contentid,b.title,b.firstimage,a.price from cartVO a,ApiVO b where a.contentid=b.contentid and a.memberid=:memberid").setParameter("memberid",memberid).getResultList();
		 Query cartRVO1 =  (Query) em.createQuery("select a.id, a.contentid,b.title,b.firstimage,a.price from cartVO a,ApiVO b where a.contentid=b.contentid and a.memberid=:memberid").setParameter("memberid", memberid);
		 List list = cartRVO1.getResultList();
		 
	        for (Object o : list) {
	            if (o instanceof Object[]) {
	                System.out.println(Arrays.toString((Object[]) o));
	            } else {
	                System.out.println(o);
	            }
	        }
		return cartRVO1;
		
	}

}
