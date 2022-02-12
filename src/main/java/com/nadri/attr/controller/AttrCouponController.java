package com.nadri.attr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.nadri.coupon.service.UserCouponService;

@RestController
@RequestMapping("/attr")
public class AttrCouponController {

	@Autowired UserCouponService userCouponService;
	
	@GetMapping("/addCoupon")
	public void getCoupon( @RequestParam(name="userno") int userNo,
							@RequestParam(name="couponno") int couponNo) {
		userCouponService.insertCouponByUserNo(couponNo, userNo);
		userCouponService.reduceCouponQuantity(couponNo);
	}
	
}
