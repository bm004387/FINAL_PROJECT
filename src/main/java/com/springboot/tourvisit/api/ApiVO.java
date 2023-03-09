package com.springboot.tourvisit.api;

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
@Table(name = "TOURCOMMON") // 테이블의 이름을 설정 (SPRINGBOOT_CRUD)
@Getter // @Getter, @Setter : getter과 setter을 자동으로 만들어주는 Lombok 애노테이션 설정
@Setter		
public class ApiVO {

	
	@Id
	//@GeneratedValue 데이터를 입력할때는 지워줘야 detached entity passed to persist 에러가 나지 않는다 맨처음 칼럼 자동 생성때만 사용
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
	
	@Override
	public String toString() {
		return "ApiVO [contentid=" + contentid + ", contenttypeid=" + contenttypeid
				+ ", booktour=" + booktour + ", createdtime=" + createdtime + ", homepage="
				+ homepage + ", modifiedtime=" + modifiedtime + ", telname=" + telname + ", tel=" + tel + ", title="+ title +
				", firstimage=" + firstimage + ", firstimage2=" + firstimage2 + ", areacode="+ areacode + ", sigungucode=" + sigungucode +
				", cat1=" + cat1 + ", cat2=" + cat2 + ", cat3=" + cat3 + ", addr1=" + addr1 + ", addr2=" + addr2 +
				", zipcode=" + zipcode + ", mapx=" + mapx + ", mapy=" + mapy + ", mlevel=" + mlevel + ", overview=" + overview +"]";
	}
	
}
