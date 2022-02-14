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
	
	
	private int restaurantNo;
	
	private int userNo;
	private String userName;			// 유저 네임
	private String reservedName;		// 예약자 이름
	private String tel;					// 예약자 전화번호
	
	
	private int deposit;				// 예치금
	private String reservedDate;		// 예약 날짜
	private String startTime;			// 예약한 시작 날짜.
	private int timetableNo;			// 예약한 시작 날짜 번호
	
	private int child;					// 아이 수
	private int adult;					// 어른 수
	private int people;					// 총인원수
	private int quantity;				// 예약 수량 =1
	
	
	
	
	

}
