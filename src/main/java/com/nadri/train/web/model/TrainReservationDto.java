package com.nadri.train.web.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainReservationDto {
	private String way;
	private int count1;
	private int adNo1;
	private int cdNo1;
	private int schduleNo1;
	private int trainNo1;
	private List<Integer> seatNo1;
	private int roomNo1;
	private int priceIdschedule1;
	private long priceschedule1;
	
	private int count2;
	private int adNo2;
	private int cdNo2;
	private int schduleNo2;
	private int trainNo2;
	private List<Integer> seatNo2;
	private int roomNo2;
	private int priceIdschedule2;
	private long priceschedule2;

	// count1 - 예약 TOTAL_PASSENGERS_COUNT
	// adNo1 - 티켓 PASSENGER_TYPE
	// cdNo1 - 티켓 PASSENGER_TYPE
	// schduleNo1 - 티켓 
	// trainNo1 - 티켓 
	// seatNo1 - 티켓 
	// roomNo1 - 티켓 
	// priceschedule1 - 티켓
	
	// count2 - 예약 TOTAL_PASSENGERS_COUNT
	// adNo2 - 티켓 PASSENGER_TYPE
	// cdNo2 - 티켓 PASSENGER_TYPE
	// schduleNo2 - 티켓 
	// trainNo2 - 티켓 
	// seatNo2 - 티켓 
	// roomNo2 - 티켓 
	// seatNo2 - 티켓 
	// roomNo2 - 티켓 
	// priceschedule2 - 티켓
//	TICKET_NO
//	RESERVATION_NO
	
// TOTAL_PAYMENT_AMOUNT
	
// 예약 넣을거 하나
// 티켓 넣을거 하나 -> list seat1, seat2의 수만큼 티켓 객체를 만들어 List로 db에 넣기 
}
