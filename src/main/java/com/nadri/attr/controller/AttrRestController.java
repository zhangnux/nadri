package com.nadri.attr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.nadri.attr.service.AttrService;
import com.nadri.attr.vo.Attraction;
import com.nadri.attr.vo.Coordinate;
import com.nadri.coupon.service.UserCouponService;
import com.nadri.user.annotation.LoginedUser;
import com.nadri.user.vo.User;

@RestController
@RequestMapping("/attr")
public class AttrRestController {

	@Autowired AttrService attrService;
	@Autowired UserCouponService userCouponService;
	
	@GetMapping("/addCoupon")
	public void getCoupon( @LoginedUser User user,
							@RequestParam(name="couponno") int couponNo) {
		int userNo = user.getNo();
		userCouponService.insertCouponByUserNo(couponNo, userNo);
		userCouponService.reduceCouponQuantity(couponNo);
	}
	
	@GetMapping("/attlist")
	public List<Attraction> list() {
		List<Attraction> attractions = attrService.getAllAttrList();		
		return attractions;
	}
	
	@GetMapping("/maplist")
	public List<Attraction> list(Coordinate coordinate) {
		List<Attraction> lists = attrService.getListInMap(coordinate);	
		return lists;
	}
	
}
