package com.nadri.coupon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nadri.coupon.service.UserCouponService;
import com.nadri.coupon.vo.UserCoupon;
import com.nadri.user.annotation.LoginedUser;
import com.nadri.user.vo.User;

@Controller
@RequestMapping("/user")
public class UserCouponController {
	
	@Autowired
	UserCouponService userCouponService;
	
	/**
	 * 유저별 보유 쿠폰 조회
	 * @param user
	 * @param model
	 * @return
	 */
	@GetMapping("/coupon.nadri")
	public String userCoupon(@LoginedUser User user, Model model) {

		List<UserCoupon> couponList = userCouponService.getCouponList(user.getNo());
		model.addAttribute("couponList", couponList);
		
		return "user/userCoupon";
	}

}
