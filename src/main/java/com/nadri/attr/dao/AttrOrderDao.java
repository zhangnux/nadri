package com.nadri.attr.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.nadri.attr.vo.AttrOrder;

@Mapper
public interface AttrOrderDao {
	
	AttrOrder orderInfo(AttrOrder attrOrder);
	AttrOrder productInfo(AttrOrder attrOrder);
	
	void depositOrderInfo(AttrOrder attrOrder);
	void depositOptionInfo(AttrOrder attrOrder);
	
	void couponUsed(@Param("userNo")int userNo, @Param("couponNo")int couponNo);
	
	/* 카카오페이용으로 쓸 예정
	void depositOrderInfo(@Param("userNo") int userNo,
						@Param("attNo") int attNo,
						@Param("attDate") Date attDate,
						@Param("lastPrice") int lastPrice,
						@Param("tel") String tel,
						@Param("email") String email,
						@Param("name") String name);
	
	void depositOptionInfo(@Param("totalQuantity")int totalQuantity,
							@Param("couponNo")int couponNo,
							@Param("optionNo")int optionNo);
	*/
}
