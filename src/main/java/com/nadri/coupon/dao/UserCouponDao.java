package com.nadri.coupon.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.nadri.coupon.vo.UserCoupon;

@Mapper
public interface UserCouponDao {
	
	void getCoupon(@Param("couponNo") int couponNo, @Param("userNo") int userNo);
	List<UserCoupon> couponList(int userNo);
	List<UserCoupon> cou();
	int couponCount(int userNo);
	
}
