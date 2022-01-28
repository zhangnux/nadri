package com.nadri.train.dto;

import java.util.Date;

import org.springframework.format.annotation.NumberFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainSearchDto {
	private int scheduleNo;
	@JsonFormat(pattern = "HH:mm", timezone = "Asia/Seoul")
	private Date departureTime;
	@JsonFormat(pattern = "HH:mm", timezone = "Asia/Seoul")
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
	
	public String getDiffTime() {
		long diff = arrivalTime.getTime() - departureTime.getTime();
		long hours = (diff / 1000) / 60 / 60 % 24;
		long minutes = (diff / 1000) / 60 % 60;
		long seconds = (diff / 1000) % 60;
		
		return String.format("%02d:%02d:%02d", hours, minutes, seconds);
	}
	
}
