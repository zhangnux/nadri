package com.nadri.coupon.form;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CouponInsertForm {

	int no;
	String couponName;
	int quantity;
	int discountRate;
	Date startDate;
	Date endDate;
	String category;	
	
}
