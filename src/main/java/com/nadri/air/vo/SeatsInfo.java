package com.nadri.air.vo;

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
public class SeatsInfo {
	private int no;
	private String type;
	private int count;
	private int price;
	private int AirplaneNo;
	
}
