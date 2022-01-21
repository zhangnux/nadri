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
public class Schedule {
	private int ticketNo;
	private int price;
	private Date refundDate;
	private int refundFee;
	private int userNo;
	
}
