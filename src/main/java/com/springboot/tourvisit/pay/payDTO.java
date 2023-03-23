package com.springboot.tourvisit.pay;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class payDTO {

	//private long id; //DB 에서 number 형식이였는데 한참동안 String으로 받을려고 해서 메모리 객체값만 나오고 제대로 값이 안받아졌었다
	private String contentid;
	private String memberid;
	//private String title;
	//private String firstimage;
	private String price;
	
	@Override
	public String toString() {
		return "payDTO [contentid=" + contentid + ", memberid=" + memberid + ", price=" + price +"]";
	}
	
}
