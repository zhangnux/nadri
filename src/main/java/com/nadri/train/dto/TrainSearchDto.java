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
	private String diffTime;
	private int trainNo;
	private int routeNo;
	private int typeNo;
	private String trainName;
	private int specialBooking;
	private int specialSeat;
	private int normalBooking;
	private int normalSeat;
	private long price;

	// 질문
//	private void setDiffTime() {
//		long diff = arrivalTime.getTime() - departureTime.getTime();
//		long hours = (diff / 1000) / 60 / 60 % 24;
//		long minutes = (diff / 1000) / 60 % 60;
//		long seconds = (diff / 1000) % 60;
//		
//		diffTime = String.format("%02d:%02d:%02d", hours, minutes, seconds);
//	}
	
}
