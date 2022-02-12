package com.nadri.train.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainTicketCriteria {
	private int reservationNo;
	private int userNo;
	private int begin;
	private int end;
}
