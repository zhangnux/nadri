package com.nadri.attr.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.nadri.attr.dto.AttOptionDetail;
import com.nadri.attr.vo.AttrReview;
import com.nadri.attr.vo.Attraction;
import com.nadri.attr.vo.Search;
import com.nadri.coupon.vo.Coupon;
import com.nadri.coupon.vo.UserCoupon;
import com.nadri.restaurant.vo.Restaurant;

@Mapper
public interface AttrDao{

	// 전체리스트
	List<Attraction> allAttrList();
	
	// 리스트 갯수
	int attrcount();
	
	// 카테고리별 검색
	List<Attraction> searchAttraction(Search search);
	
	// 검색을 완료한 전체 갯수
	int getSearchedRow(Search search);
	
	// 번호로 디테일 불러오기
	Attraction getDetailByNo(int no);
	List<Attraction> getOptionByNo(int no);
	
	// 후기 갯수+별점 평균
	int reviewCount(int attNo);
	double star(int attNo);
	
	// 같은 place 상품 랜덤 4개 출력
	List<Attraction> random(@Param("no")int attNo, @Param("place")String place);

	// 즐길거리 쿠폰리스트
	List<UserCoupon> coupon(int userNo);
	
	// 메인용
	// 즐길거리
	List<Attraction> mainRandomAttr();
	// 레스토랑
	List<Restaurant> mainRandomRes();
}
