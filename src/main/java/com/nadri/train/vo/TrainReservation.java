package com.nadri.train.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainReservation {
	
	private int no;
	private int totalCount;
	private int totalPrice;
	private String tickectStatus;
	private Date canceledDate;
	private Date soldDate;
	private Date reservationDate;
}
