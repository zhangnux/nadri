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
public class Reservation {
	
	private int no;			// 예약번호
	private String name;		// 예약자이름
	private int deposit;		// 예약금
	private String process;		// 예약 진행사항 default 완료
	private Date reservedDate;	// 예약일
	private int adult;	// 성인예약명수
	private int child;	// 아이 예약 명수
	private int usedPoint;	// 사용포인트
	private int reservedPoint;	//적립포인트
	private Restaurant restaurant;	// no
//	private User user;
	private Timetable timetable;	//no
	


}
