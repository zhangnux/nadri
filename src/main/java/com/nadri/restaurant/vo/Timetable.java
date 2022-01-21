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
public class Timetable {
	
	private int no;
	private Restaurant restaurant;
	private int startTime;
	private int finalTime;
	private int capacity;	// 시간대별 수용량. 2시간단위로 예약받고, 그 수용량.
	
	

}
