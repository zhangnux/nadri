package com.nadri.restaurant.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	private String tel;			// 예약자 전화번호
	private int deposit;		// 예약금
	
	private String process;		// 예약 진행사항 default 완료
	@JsonFormat(pattern = "yyyy-MM-dd")
	private String reservedDate;	// 예약일
	private int adult;	// 성인예약명수
	private int child;	// 아이 예약 명수
	private int people; // 성인 + 아이

	private int restaurantNo;
	private int userNo;
	private int timetableNo;	//no
	
	


}
