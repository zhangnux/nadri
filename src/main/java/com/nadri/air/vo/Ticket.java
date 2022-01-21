package com.nadri.air.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class Ticket {
	private int no;
	private String isCancled;
	private int passengerNo;
	private int typeNo;
	private int scheduleNo;
	private int airplaneNo;
	private int reserveNo;
	
}
