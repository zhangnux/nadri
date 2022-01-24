package com.nadri.train.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TrainSchedule {
	private int no;
	private Date departureTime;
	private Date arrivalTime;
	private int trainNo;
	private int routeNo;
}
