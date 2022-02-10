package com.nadri.coupon.vo;

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
	
	/* 유저 테이블 */
	private User user;
	
	/* 쿠폰테이블 */
	private Coupon coupon;
	
}
