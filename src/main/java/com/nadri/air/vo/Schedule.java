package com.nadri.air.vo;

import java.util.Date;

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
public class Schedule {
	private int no;
	private Date dpetTime;
	private Date arriveTime;
	private Date deptDate;
	private Date arriveDate;
	private Route route;
	private Airplane airplane;
}
