package com.nadri.train.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainTicket {
	private int no;
	private String customerName;
	private String type;
	private String isCanceled;
	private int reservationNo;
	private int scheduleNo;
	private int roomNo;
	private int trainNo;
	private int priceId;
	private int seatNo;
}
