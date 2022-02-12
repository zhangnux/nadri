package com.nadri.coupon.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.nadri.user.vo.User;

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
public class UserCoupon {
	
	/* 테이블 기본 컬럼 */
	private String used;
	private int couponNo;
	private int userNo;
	
	private String couponName;
	private int discountRate;
	@JsonFormat(pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	
	/* 유저 테이블 */
	private User user;
	
	/* 쿠폰테이블 */
	private Coupon coupon;
	
}
