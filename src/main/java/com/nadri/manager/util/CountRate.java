package com.nadri.manager.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.nadri.manager.web.restController.ManagerRestController;

import lombok.Data;

@Data
public class CountRate {
	static final Logger log = LogManager.getLogger(ManagerRestController.class);
	public static List<Integer> rate(int total, List<Integer> datas) {
		
		List<Integer> rates = new ArrayList<Integer>();
		for (Integer data : datas) {
			rates.add((data*100)/total);
		}
		return rates;
	}
	
	public static int rate(int total, int data) {
		return (data*100)/total;
	}
}
