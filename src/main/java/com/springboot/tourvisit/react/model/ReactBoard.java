package com.springboot.tourvisit.react.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import lombok.Getter;
import lombok.Setter;

//@SequenceGenetator : 시퀀스를 자동으로 생성해주는 JPA 애노테이션
@SequenceGenerator(
     name="RT_BOARD_SEQ_GEN",		// 시퀀스 생성기의 이름을 지정
     sequenceName="RT_BOARD_SEQ",	// 시퀀스의 이름을 지정 (IDX_SEQ)
     initialValue=1,			// 시퀀스의 초기값을 설정
     allocationSize=1		// 시퀀스의 증가량을 설정
     )
//JPA의 엔티티 설정
@Entity					
@Table(name = "RT_BOARD")
@Getter
@Setter
public class ReactBoard {

	@Id // PK 설정
	@GeneratedValue(strategy = GenerationType.SEQUENCE, // 시퀀스 생성기를 통해 시퀀스 만들고 ID에 자동으로 주입
					generator = "RT_BOARD_SEQ_GEN")
	
	@Column(name = "RT_BNO")
	private Long bno;
	
	@Column(name = "RT_TITLE")
	private String title;
	
	@Column(name = "RT_CONTENT")
	private String content;
	
	@Column(name = "RT_WRITER")
	private String writer;
	
	@Column(name = "RT_REGDATE")
	@CreatedDate
	private LocalDate regDate;
	
	@Column(name = "RT_UPDATEDATE")
	@LastModifiedDate
	private LocalDate updateDate;

}
