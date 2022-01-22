package com.nadri.coupon.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nadri.coupon.dto.ResponseDto;
import com.nadri.coupon.service.CouponService;

@RestController
@RequestMapping("/rest/coupon")
public class CouponRestController {

	@Autowired
	CouponService couponService;
	
	@GetMapping("/delete")
	public ResponseDto<?> delete(int no) {

		couponService.removeCoupon(no);
		ResponseDto<Integer> response = new ResponseDto<>();
		response.setStatus("OK");
		return response;
	}	
	
}
