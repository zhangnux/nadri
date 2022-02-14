package com.nadri.restaurant.vo;

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
public class ReservationCurrentState {
	
	private int no;
	private int restaurantNo;	// no
	private int timetableNo;
	private String startTime;	// startTime;
	private String reservedDate;
	private int reservedPeople;	// 해당 날짜에 예약한 총 인원수

}
