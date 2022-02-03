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
	private String address;		// 상세 주소
	private String cityName;		// 도시코드(지역정보로 서울) 나중에 city vo 생성하고 city city 혹은 String city로바꾸기
	private String parking;		// 주차 가능여부 Y OR N
	private String restDate;	// 휴무일
	private String tel;			// 전화번호
	private String openTime;	// 영업시간
	private int sales;			// 매출양
	private int starPoint;		// 별점
	private double lat;			// 위도 mapx
	private double lon;			// 경도 mapy
	private String categoryName;
	private int reviewCount; //리뷰개수

}
