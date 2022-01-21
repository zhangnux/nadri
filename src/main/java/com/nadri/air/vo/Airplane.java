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
public class Airplane {

	private int no;
	private String airline;
	private int seatCount;
	private String name;
	private String logo;
	
}
