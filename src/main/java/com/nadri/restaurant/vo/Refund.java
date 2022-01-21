package com.nadri.restaurant.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Setter
@Getter
@ToString
public class Refund {
	
	private int refundNo;
	private int refundPrice;	//환불금액
	private Date refundedDate;
	private int commission;	//수수료
	private Reservation reservation;	// no
//	private User user;

}
