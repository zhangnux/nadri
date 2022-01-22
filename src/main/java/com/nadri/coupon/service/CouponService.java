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
	
	public List<Coupon> getAllCouponList(){ return couponDao.getAllCoupons(); }
	
	public List<Coupon> getInvalidCouponList(){ return couponDao.getInvalidCoupons(); }
	
	public int getTotalRows(Criteria criteria) {
		return couponDao.getCouponTotalRows(criteria);
	}
	
	public void addNewCoupon(Coupon coupon) {	
		couponDao.insertCoupon(coupon);	
	}
	
	public List<Coupon> searchCoupons(Criteria criteria){
		return couponDao.searchCoupons(criteria);
	}
	
	public void removeCoupon(int no) {}
	
}
