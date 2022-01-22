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
public class Refund {
	private int refundPrice;
	private Date refundDate;
	private int refundFee;
	private User user;
	private Ticket ticket;
}
