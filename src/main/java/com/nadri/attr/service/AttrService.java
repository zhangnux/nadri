package com.nadri.attr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nadri.attr.dto.AttOptionDetail;
import com.nadri.attr.mapper.AttrMapper;
import com.nadri.attr.vo.AttrReview;
import com.nadri.attr.vo.Attraction;
import com.nadri.attr.vo.Search;
import com.nadri.coupon.vo.Coupon;
import com.nadri.coupon.vo.UserCoupon;
import com.nadri.restaurant.vo.Restaurant;

@Service
@Transactional
public class AttrService {

	@Autowired
	private AttrMapper attrMapper;
	
	public List<Attraction> getAllAttrList(){return attrMapper.allAttrList();}
	public int getListCount() {return attrMapper.attrcount();}
	public List<Attraction> getSearchResult(Search search){return attrMapper.searchAttraction(search);}
	public int getSearchedRowCount(Search search){ return attrMapper.getSearchedRow(search); }
	public Attraction getDetailPage(int no) { return attrMapper.getDetailByNo(no); }
	public List<Attraction> getOptionInfo(int no) { return attrMapper.getOptionByNo(no); }
	public int getReviewCount(int attNo) { return attrMapper.reviewCount(attNo); }
	public double getStarCount(int attNo) { return attrMapper.star(attNo); }
	public List<Attraction> getRandom(int attNo, String place) { return attrMapper.random(attNo, place); }
	public List<UserCoupon> getCoupon(int userNo){ return attrMapper.coupon(userNo); }
	
	public List<Attraction> randomAttraction(){ return attrMapper.mainRandomAttr(); }
	public List<Restaurant> randomRestaurant(){ return attrMapper.mainRandomRes(); }

}
