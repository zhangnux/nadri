package com.nadri.air.vo;

import java.util.Date;

import com.nadri.user.vo.User;

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
public class Reservation {
	private int no;
	private int passengerCount;
	private int totalPrice;
	private int discountPrice;
	private Date reserveDate;
	private Date paymentDate;
	private Date cancleDate;
	private User user;
	
}
