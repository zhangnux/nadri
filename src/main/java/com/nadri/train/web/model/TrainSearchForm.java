package com.nadri.train.web.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainSearchForm {
	private String departureStation;
	private String arrivalStation;
	private String way;
	private String dpDate1;
	private String dpTime1;
	private int rowNo1;
	private String dpDate2;
	private String dpTime2;
	private int rowNo2;
	
}
