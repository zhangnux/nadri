package com.nadri.coupon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.nadri.coupon.dto.ResponseDto;
import com.nadri.coupon.service.CouponService;
import com.nadri.coupon.service.UserCouponService;
import com.nadri.coupon.util.Pagination;
import com.nadri.coupon.vo.Coupon;
import com.nadri.coupon.vo.UserCoupon;
import com.nadri.user.annotation.LoginedUser;
import com.nadri.user.vo.User;

@RestController
@RequestMapping("/coupon")
public class CouponRestController {

	@Autowired
	CouponService couponService;
	@Autowired
	UserCouponService userCouponService;
	
	@GetMapping("/delete")
	public ResponseDto<?> delete(int no) {

		couponService.removeCoupon(no);
		ResponseDto<Integer> response = new ResponseDto<>();
		response.setStatus("OK");
		return response;
	}

	@PostMapping("/search")
	public Map<String,Object> getSerachResult(
			@RequestParam(name="page",defaultValue = "1" )String page, 
			@RequestParam(name="category")String category){
		
		Map<String,Object> searchResult = new HashMap<String,Object>();
		
		int count = couponService.getValidTotalRows(category);
		Pagination pagination = new Pagination(page, count);
		int beginIndex = pagination.getBegin();
		int endIndex = pagination.getEnd();
		
		searchResult.put("pagination", pagination);
		searchResult.put("searchResult", couponService.searchCoupons(beginIndex,endIndex,category));
		
		return searchResult;
		
	}
	
	@PostMapping("/invalid")
	public Map<String, Object> getInvalidList(@RequestParam(name="page")String page, 
											@RequestParam(name="category",defaultValue="모두")String category){
		
		Map<String, Object> invalidList = new HashMap<String, Object>();
		
		int count = couponService.getInValidTotalRows();
		Pagination pagination = new Pagination(page, count);
		int beginIndex = pagination.getBegin();
		int endIndex = pagination.getEnd();
		
		invalidList.put("pagination", pagination);
		invalidList.put("invalidList", couponService.getInvalidCouponList(beginIndex, endIndex));
		
		return invalidList;
	}
	
	@GetMapping("/attrcou")
	public List<UserCoupon> getAttrCou(@LoginedUser User user){
		int userNo = user.getNo();
		List<UserCoupon> attrCoupon = userCouponService.getAttrCouponList(userNo);
		
		return attrCoupon;
	}
	
	@GetMapping("/coucount")
	public int getCouponCount(@LoginedUser User user) {
		
		int userNo = user.getNo();
		int couponCount = userCouponService.getCouponCount(userNo);
		
		return couponCount;
	}
	
	@GetMapping("/restaurantcou")
	public List<UserCoupon> getRestaurantCouponList(@LoginedUser User user){
		List<UserCoupon> restaurantCouponList = userCouponService.getRestaurantCouponList(user.getNo());
		return restaurantCouponList;
	}
	
	// 중복체크
	@GetMapping("/check")
	public String couponCheck(int couponNo, @LoginedUser User user) {
		int userNo = user.getNo();
		try {
			userCouponService.couponCheckByUserNo(couponNo, userNo);
		} catch(RuntimeException e) {
			return "fail";
		}
		userCouponService.insertCouponByUserNo(couponNo, userNo);
		return "success";
	}
	
}
