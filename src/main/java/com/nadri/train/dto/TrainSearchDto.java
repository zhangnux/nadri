package com.nadri.train.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainSearchDto {
	private int scheduleNo;
	private Date departureTime;
	private Date arrivalTime;
	private int trainNo;
	private int routeNo;
	private int typeNo;
	private String trainName;
	private int specialBooking;
	private int specialSeat;
	private int normalBooking;
	private int normalSeat;
	private long price;
}
