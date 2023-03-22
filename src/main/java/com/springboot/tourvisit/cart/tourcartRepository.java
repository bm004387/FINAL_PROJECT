package com.springboot.tourvisit.cart;

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
public class tourcartRepository {

	private final ModelMapper mapper;
	
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
	
	public List<cartDTO> getResultList(String memberid) {
		
		System.out.println("카트 리스트 작성");
	
		System.out.println(memberid);
		
		cartDTO cartRVO = new cartDTO();
		
		 cartRVO = null;
		
		// Query cartRVO1 =  (Query) em.createQuery("select a.id, a.contentid,b.title,b.firstimage,a.price from cartVO a,ApiVO b where a.contentid=b.contentid and a.memberid=:memberid").setParameter("memberid",memberid).getResultList();
		 TypedQuery<cartDTO> cartRVO1 =  em.createQuery("select new com.springboot.tourvisit.cart.cartDTO(a.id, a.contentid,b.title,b.firstimage,a.price) from cartVO a,ApiVO b where a.contentid=b.contentid and a.memberid=:memberid",cartDTO.class).setParameter("memberid", memberid);
		 
		 List <cartDTO> list = cartRVO1.getResultList();
		 
		 
	        System.out.println("카트레포지토리:"+list.toString());
	        
		return list;
		
	}

	
	public void insert(@Param("memberid") String memberid) {
		
		
		TypedQuery<payDTO> cartRVO1 =  em.createQuery("select new com.springboot.tourvisit.cart.payDTO(a.contentid,a.memberid,a.price) from cartVO a where a.memberid=:memberid",payDTO.class).setParameter("memberid",memberid);
		 //Query query =  em.createQuery("select a.contentid,a.memberid,a.price from cartVO a where a.memberid=:memberid").setParameter("memberid", memberid);
		List<payDTO> list =  cartRVO1.getResultList();
		 System.out.println(list.toString());
		 
		 
		 for (int i = 0; i < list.size(); i++) {
			
			 tourpayendVO payvo = mapper.map(list.get(i), tourpayendVO.class);
			 em.persist(payvo);
		}
	
		deletecart(memberid);
			 
		
		
		 //System.out.println(payvo.toString());
		 
		 //payvo.forEach(em::persist);
		 
		 // em.persist(payvo);
		
		//list.forEach(em::persist);
		 
		 //List<tourpayendVO> list = cartRVO1.getResultList();
		
	}
	
	 
	 public void deletecart(@Param("memberid") String memberid) {
		
		 String jpql="delete from cartVO m where m.memberid=:memberid";
			Query query = em.createQuery(jpql).setParameter("memberid", memberid);
			int rows = query.executeUpdate();
			System.out.println(rows);
		 
		 //em.deleteAllBymemberid(memberid).setParameter("memberid",memberid);
		 
	 }

}
