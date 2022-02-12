package com.nadri.coupon.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.nadri.coupon.vo.UserCoupon;

@Mapper
public interface UserCouponDao {
	
	// 쿠폰발급
	void getCoupon(@Param("couponNo") int couponNo, @Param("userNo") int userNo);
	void reduceQuantity(int couponNo);
	// 보유쿠폰 조회 
	List<UserCoupon> couponList(int userNo);
	// 보유쿠폰 조회-즐길거리
	List<UserCoupon> attrCouponList(int userNo);
	// 보유쿠폰 갯수 
	int couponCount(int userNo);
	
}
