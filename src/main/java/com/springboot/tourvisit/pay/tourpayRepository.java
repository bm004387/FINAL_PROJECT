package com.springboot.tourvisit.pay;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.modelmapper.ModelMapper;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.springboot.tourvisit.api.ApiVO;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;


@Repository
@RequiredArgsConstructor
public class tourpayRepository {

	private final ModelMapper mapper;
	
	// @PersistenceContext : JPA의 ORM을 처리해주는 EntityManager을 불러올 때 쓰는 애노테이션 입니다.
		@PersistenceContext	
		private final EntityManager em;
	
	
	public List<paylistDTO> getResultList(String memberid) {
		
		System.out.println("카트 리스트 작성");
	
		System.out.println(memberid);
		
		paylistDTO cartRVO = new paylistDTO();
		
		 cartRVO = null;
		
		// Query cartRVO1 =  (Query) em.createQuery("select a.id, a.contentid,b.title,b.firstimage,a.price from cartVO a,ApiVO b where a.contentid=b.contentid and a.memberid=:memberid").setParameter("memberid",memberid).getResultList();
		 TypedQuery<paylistDTO> cartRVO1 =  em.createQuery("select new com.springboot.tourvisit.pay.paylistDTO(a.id, a.contentid,b.title,b.firstimage,a.price) from tourpayendVO a,ApiVO b where a.contentid=b.contentid and a.memberid=:memberid",paylistDTO.class).setParameter("memberid", memberid);
		 
		 List <paylistDTO> list = cartRVO1.getResultList();
		 
		 
	        System.out.println("PAY레포지토리:"+list.toString());
	        
		return list;
		
	}

	
	

}
