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
	private Passenger passenger;
	private SeatsInfo seatsInfo;
	private Schedule schedule;
	private Airplane airplane;
	private Reservation reservation;
	
}
