package com.nadri.train.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainCriteria {
	private String departureStation;
	private String arrivalStation;
	private Date timeToGo;
	private Date timeToCome;
}
