package com.springboot.tourvisit.api;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;


//JPA의 엔티티 설정
@Entity					
@Table(name = "tourcommon") // 테이블의 이름을 설정 (SPRINGBOOT_CRUD)
@Getter // @Getter, @Setter : getter과 setter을 자동으로 만들어주는 Lombok 애노테이션 설정
@Setter		
public class ApiVO {

	
	@Id
	@GeneratedValue
	@Column(name = "contentid")
	private String contentid;
	
	@Column(name = "contenttypeid")
	private String contenttypeid;
	
	@Column(name = "booktour")
	private String booktour;
	
	@Column(name = "createdtime")
	private String createdtime;
	
	@Column(name = "homepage")
	private String homepage;
	
	@Column(name = "modifiedtime")
	private String modifiedtime;
	
	@Column(name = "telname")
	private String telname;
	
	@Column(name = "tel")
	private String tel;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "firstimage")
	private String firstimage;
	
	@Column(name = "firstimage2")
	private String firstimage2;
	
	@Column(name = "areacode")
	private String areacode;
	
	@Column(name = "sigungucode")
	private String sigungucode;
	
	@Column(name = "cat1")
	private String cat1;
	
	@Column(name = "cat2")
	private String cat2;
	
	@Column(name = "cat3")
	private String cat3;
	
	@Column(name = "addr1")
	private String addr1;
	
	@Column(name = "addr2")
	private String addr2;
	
	@Column(name = "zipcode")
	private String zipcode;
	
	@Column(name = "mapx")
	private String mapx;
	
	@Column(name = "mapy")
	private String mapy;
	
	@Column(name = "mlevel")
	private String mlevel;
	
	@Column(name = "overview")
	private String overview;
	
	
}
