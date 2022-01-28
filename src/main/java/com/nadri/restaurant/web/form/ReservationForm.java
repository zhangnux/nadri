package com.nadri.restaurant.web.form;

import java.util.Date;

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
public class ReservationForm {
	
	
	
	private String reservedName;		// 예약자 이름
	private String tel;					// 예약자 전화번호
	
	private int deposit;				// 예치금
	private Date reservedDate;			// 예약 날짜
	
	private int child;					// 아이 수
	private int adult;					// 어른 수
	private int allPeople;				// 총인원수
	
	
	private int usedPoint;				// 사용된 포인트
	private int reservedPoint;			// 적립 포인트
	
	
	

}
