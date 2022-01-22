package com.nadri.restaurant.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Setter
@Getter
@ToString
public class Restaurant {
	
	
	private int no;				// 가게 번호
	private String name;		// 상호
	private String picture;		// 가게 사진
	private String content;		// 가게 설명
	private String category;	// 식당타입(ex 한식)
	private String address;		// 상세 주소
	private String city;		// 도시
	private String parking;		// 주차 가능여부 Y OR N
	private String restDate;		// 휴무일
	private String tel;		// 전화번호
	private String openTime;		// 영업시간
	private int sales;		// 매출양
	private int starPoint;	// 별점

}
