package com.nadri.coupon.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.nadri.coupon.util.Criteria;
import com.nadri.coupon.vo.Coupon;

@Mapper
public interface CouponDao {

	// 쿠폰 생성
	void insertCoupon(Coupon coupon);
	// 쿠폰 내용 변경
	void updateCoupon(Coupon coupon);
	// 쿠폰번호로 내용 조회
	Coupon getCouponDetail(int no);
	// 쿠폰리스트 조회
	List<Coupon> getAllCoupons(@Param("beginIndex") int beginIndex, @Param("endIndex") int endIndex);
	//만료 쿠폰 조회
	List<Coupon> getInvalidCoupons(@Param("beginIndex") int beginIndex, @Param("endIndex") int endIndex);
	// 유효쿠폰 데이터 개수 반환
	int validCouponCount();
	// 만료쿠폰 데이터 개수 반환
	int invalidCouponCount();
	// 메뉴 별 발급 쿠폰 검색 - valid
	List<Coupon> searchValidCoupons(@Param("beginIndex") int beginIndex, @Param("endIndex") int endIndex,
									@Param("category") String category );
	// 쿠폰 삭제
	void deleteCoupon(int no);
	
}
