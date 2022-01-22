package com.nadri.lodging.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
@ToString
public class LodInformation {

	private int no;						// 숙소번호
	private String name;				// 숙소이름
	private String address;;			// 숙소주소
	private Date checkIn;				// 오픈시간
	private Date checkOut;				// 클로즈 시간
	private String intro;				// 숙소소개
	private LodCatagory category;		// 카테고리 번호
	private LodGrade Grade;				// 등급번호
	private String lodRefund;			// 환불안내
	private int lodSales;				// 판매 수
}
