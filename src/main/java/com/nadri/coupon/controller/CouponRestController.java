package com.nadri.coupon.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.nadri.coupon.dto.ResponseDto;
import com.nadri.coupon.service.CouponService;
import com.nadri.coupon.util.Pagination;

@RestController
@RequestMapping("/coupon")
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
	
	@PostMapping("/valid")
	public Map<String, Object> getValidList(@RequestParam(name="page",defaultValue = "1")String page){
		
		Map<String,Object> validList = new HashMap<String,Object>();
		
		int count = couponService.getValidTotalRows();
		Pagination pagination = new Pagination(page, count);
		int beginIndex = pagination.getBegin();
		int endIndex = pagination.getEnd();
		
		validList.put("pagination", pagination);
		validList.put("validList", couponService.getAllCouponList(beginIndex, endIndex));
		
		return validList;
		
	}
	
	@PostMapping("/invalid")
	public Map<String, Object> getInvalidList(@RequestParam(name="page")String page){
		
		Map<String, Object> invalidList = new HashMap<String, Object>();
		
		int count = couponService.getInValidTotalRows();
		Pagination pagination = new Pagination(page, count);
		int beginIndex = pagination.getBegin();
		int endIndex = pagination.getEnd();
		
		invalidList.put("pagination", pagination);
		invalidList.put("invalidList", couponService.getInvalidCouponList(beginIndex, endIndex));
		
		return invalidList;
	}
	
	@PostMapping("/search")
	public Map<String,Object> getSerachResult(
							@RequestParam(name="page",defaultValue = "1" )String page, 
							@RequestParam(name="category")String category){
		
		Map<String,Object> searchResult = new HashMap<String,Object>();
		
		int count = couponService.getValidTotalRows();
		Pagination pagination = new Pagination(page, count);
		int beginIndex = pagination.getBegin();
		int endIndex = pagination.getEnd();
		
		searchResult.put("pagination", pagination);
		searchResult.put("searchResult", couponService.searchCoupons(beginIndex,endIndex,category));
		
		return searchResult;
		
	}

	
}
