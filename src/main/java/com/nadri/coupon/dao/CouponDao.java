package com.nadri.coupon.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nadri.coupon.util.Criteria;
import com.nadri.coupon.vo.Coupon;

@Mapper
public interface CouponDao {

	// 쿠폰 생성
	void insertCoupon(Coupon coupon);
	// 쿠폰 내용 변경
	void updateCoupon(Coupon coupon);
	// 쿠폰현황 조회
	List<Coupon> getAllCoupons();
	//만료 쿠폰 조회
	List<Coupon> getInvalidCoupons();
	// 총 데이터 개수 반환
	int getCouponTotalRows(Criteria criteria);
	// 메뉴 별 발급 쿠폰 검색
	List<Coupon> searchCoupons(Criteria criteria);
	// 쿠폰 삭제
	void deleteCoupon(int no);
}
