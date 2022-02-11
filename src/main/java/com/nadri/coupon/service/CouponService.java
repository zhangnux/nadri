package com.nadri.coupon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nadri.coupon.dao.CouponDao;
import com.nadri.coupon.util.Criteria;
import com.nadri.coupon.vo.Coupon;

@Service
@Transactional
public class CouponService {

	@Autowired
	private CouponDao couponDao;
	
	public List<Coupon> getAllCouponList(int begin, int end){ return couponDao.getAllCoupons(begin, end); }
	
	public List<Coupon> getInvalidCouponList(int begin, int end){ return couponDao.getInvalidCoupons(begin, end); }
	
	public int getValidTotalRows() { return couponDao.validCouponCount();}
	public int getInValidTotalRows() { return couponDao.invalidCouponCount();}
	
	public void addNewCoupon(Coupon coupon) {	
		couponDao.insertCoupon(coupon);	
	}
	
	public void modifyCoupon(Coupon coupon) {
		couponDao.updateCoupon(coupon);
	}
	
	public Coupon couponDetail(int no) {
		Coupon coupon = couponDao.getCouponDetail(no);
		return coupon;	
	}
	
	public List<Coupon> searchCoupons(int begin, int end, String category){
		return couponDao.searchValidCoupons(begin, end, category);
	}
	
	public void removeCoupon(int no) { couponDao.deleteCoupon(no); }
	
}
