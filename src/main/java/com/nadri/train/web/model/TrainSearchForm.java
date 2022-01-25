package com.nadri.train.web.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.nadri.train.exception.TrainException;

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
	private String dpDate2;
	private String dpTime2;
	private int count1;
	private int count2;
	private int adNo1;
	private int adNo2;
	private int cdNo1;
	private int cdNo2;
	
	private static SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd HH");

	public Date getDpFullDate1() {
		if (dpDate1 == null | dpTime1 == null) {
			return null;
		}
		String fullDate = dpDate1 + " " + dpTime1;
		Date result;
		try {
			result = sf.parse(fullDate);
			return result;
		} catch (ParseException e) {
			return null;
		}
	}
	
	public Date getDpFullDate2() {
		if (dpDate2 == null | dpTime2 == null) {
			return null;
		}
		
		String fullDate = dpDate2 + " " + dpTime2;
		Date result;
		try {
			result = sf.parse(fullDate);
			return result;
		} catch (ParseException e) {
			return null;
		}
	}
	
}
