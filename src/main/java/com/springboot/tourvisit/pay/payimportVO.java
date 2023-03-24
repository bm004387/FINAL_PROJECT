package com.springboot.tourvisit.pay;

import java.util.Date;

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
	    name = "pay_SEQ_GENERATOR",
	    sequenceName = "pay_SEQ",  //매핑할 실제 데이터베이스 시퀀스 이름
	    initialValue = 1, allocationSize = 1
	)
@Table(name = "pay_import") // 테이블의 이름을 설정 (SPRINGBOOT_CRUD)
@Getter // @Getter, @Setter : getter과 setter을 자동으로 만들어주는 Lombok 애노테이션 설정
@Setter		
public class payimportVO {

	
	 @Id
	 @GeneratedValue(strategy = GenerationType.SEQUENCE,
	                    generator = "pay_SEQ_GENERATOR"  //시퀀스 생성기 선택
	    )//카트에는 유일하게 구별할 숫자가 없어 시퀸스로 자동 생성 되지만 중복되지 않는 숫자를 따로 생성하면서 넣어준다
	 private Long id;
	
	//@Id
	//@GeneratedValue 데이터를 입력할때는 지워줘야 detached entity passed to persist 에러가 나지 않는다 맨처음 칼럼 자동 생성때만 사용
	@Column(name = "pay_id")
	private String pay_id;
	
	@Column(name = "import_id")
	private String import_id;
	
	@Column(name = "pay_amount")
	private String pay_amount;
	
	@Column(name = "per_num")
	private String per_num;
	
	@Column(name = "per_time")
	private String per_time;
	
	
	
	@Override
	public String toString() {
		return "payimportVO [pay_id=" + pay_id + ", import_id=" + import_id
				+ ", pay_amount=" + pay_amount + ", per_num=" + per_num + ", per_time=" + per_time + "]";
	}
	
}
