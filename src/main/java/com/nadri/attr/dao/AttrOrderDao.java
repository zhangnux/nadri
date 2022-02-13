package com.nadri.attr.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.nadri.attr.vo.AttrOrder;

@Mapper
public interface AttrOrderDao {
	
	AttrOrder orderInfo(AttrOrder attrOrderForm);
	AttrOrder productInfo(AttrOrder attrOrderForm);
	
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
}
