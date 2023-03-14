package com.springboot.tourvisit.cart;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;

import lombok.Getter;
import lombok.Setter;


//JPA의 엔티티 설정
@Entity
@SequenceGenerator(  //시퀀스 생성기 등록
	    name = "CART_SEQ_GENERATOR",
	    sequenceName = "CART_SEQ",  //매핑할 실제 데이터베이스 시퀀스 이름
	    initialValue = 1, allocationSize = 1
	)
@Table(name = "TOURCART") // 테이블의 이름을 설정 (SPRINGBOOT_CRUD)
@Getter // @Getter, @Setter : getter과 setter을 자동으로 만들어주는 Lombok 애노테이션 설정
@Setter		
public class cartVO {

	
	 @Id
	 @GeneratedValue(strategy = GenerationType.SEQUENCE,
	                    generator = "CART_SEQ_GENERATOR"  //시퀀스 생성기 선택
	    )			
	
	//@Id
	//@GeneratedValue 데이터를 입력할때는 지워줘야 detached entity passed to persist 에러가 나지 않는다 맨처음 칼럼 자동 생성때만 사용
	@Column(name = "contentid")
	private String contentid;
	
	@Column(name = "memberid")
	private String memberid;
	
	@Column(name = "price")
	private String price;
	
	
	
	@Override
	public String toString() {
		return "cartVO [contentid=" + contentid + ", memberid=" + memberid
				+ ", price=" + price + "]";
	}
	
}
