package com.nadri.coupon.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nadri.coupon.form.CouponInsertForm;
import com.nadri.coupon.service.CouponService;
import com.nadri.coupon.util.Criteria;
import com.nadri.coupon.util.Pagination;
import com.nadri.coupon.vo.Coupon;

@Controller
@RequestMapping("/coupon")
public class CouponController {

	@Autowired
	CouponService couponService;
	
	@PostMapping("/addcou.nadri")
	public String save(CouponInsertForm form) throws IOException{
		
		Coupon coupon = new Coupon();
		
		BeanUtils.copyProperties(form, coupon);
		couponService.addNewCoupon(coupon);
		
		return "redirct:coupon/coulist";
	}
	
	@GetMapping("/coulist.nadri")
	public String list(Model model) {
		
		List<Coupon> coupons = couponService.getAllCouponList();
		List<Coupon> invalidCoupons = couponService.getInvalidCouponList();
		
		model.addAttribute("coupons", coupons);
		model.addAttribute("invalidCoupons", invalidCoupons);
		
		return "coupon/coulist";
		
	}
	
	@GetMapping("/delete.nadri")
	public String deleteform(@RequestParam()int no, Model model) {
		couponService.removeCoupon(no);
		return "coupon/delete";
	}
	
	@GetMapping("/modiform.nadri")
	public String modifyform(int no, Model model) {
		
		Coupon coupon = couponService.couponDetail(no);
		model.addAttribute("coupon", coupon);
		
		return "coupon/modiform";
		
	}
	
	@GetMapping("/insertform.nadri")
	public String insertform(Model model) {
		
		return "coupon/insertform";
	}
	
	
}
