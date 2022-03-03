package com.nadri.attr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nadri.attr.mapper.AttrMapper;
import com.nadri.attr.vo.AttAddForm;
import com.nadri.attr.vo.AttOption;
import com.nadri.attr.vo.Attraction;
import com.nadri.attr.vo.Search;
import com.nadri.coupon.vo.UserCoupon;
import com.nadri.restaurant.vo.Restaurant;

@Service
@Transactional
public class AttrService {

	@Autowired
	private AttrMapper attrMapper;
	
	/* 상품리스트 관련 */
	public List<Attraction> getAllAttrList(){return attrMapper.allAttrList();}
	public int getListCount() {return attrMapper.attrcount();}
	public List<Attraction> getSearchResult(Search search){return attrMapper.searchAttraction(search);}
	public int getSearchedRowCount(Search search){ return attrMapper.getSearchedRow(search); }
	public Attraction getDetailPage(int no) { return attrMapper.getDetailByNo(no); }
	public List<Attraction> getOptionInfo(int no) { return attrMapper.getOptionByNo(no); }
	public int getReviewCount(int attNo) { return attrMapper.reviewCount(attNo); }
	public double getStarCount(int attNo) { return attrMapper.star(attNo); }
	
	/* 상품추가 관련 */
	public void insertAttr(Attraction attraction) { attrMapper.addAtt(attraction); }
	public void insertAttrOption(AttOption attOption) { attrMapper.addAttOption(attOption); }
	
	public int getReviewCountPerUser(int userNo,int attNo) {
		return attrMapper.reviewCountPerUser(userNo,attNo); 
	}
	
	public List<Attraction> getRandom(int attNo, String place) { return attrMapper.random(attNo, place); }
	public List<UserCoupon> getCoupon(int userNo){ return attrMapper.coupon(userNo); }
	
	public List<Attraction> randomAttraction(){ return attrMapper.mainRandomAttr(); }
	public List<Restaurant> randomRestaurant(){ return attrMapper.mainRandomRes(); }

}
