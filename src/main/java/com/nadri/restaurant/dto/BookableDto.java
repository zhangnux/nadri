package com.nadri.restaurant.dto;

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
public class BookableDto {
	
	private int timeTableNo;
	private int startTime;
	private int capacity;
	private int bookablePeople; // 예약가능 인원 최대인원수 - nvl(A.예약인원수, 0) as 예약가능인원

}
