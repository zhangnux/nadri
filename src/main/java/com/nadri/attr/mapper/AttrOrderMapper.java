package com.nadri.attr.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.nadri.attr.vo.AttrOrder;

@Mapper
public interface AttrOrderMapper {
	
	AttrOrder orderInfo(AttrOrder attrOrder);
	AttrOrder productInfo(AttrOrder attrOrder);
	
	void depositOrderInfo(AttrOrder attrOrder);
	void depositOptionInfo(AttrOrder attrOrder);
	
	void salesQuantity(int attNo);
	void couponUsed(@Param("userNo")int userNo, @Param("couponNo")int couponNo);
	
	/* 카카오페이 관련 */
	// 결제
	void kakaoOrderInfo(AttrOrder attrOrder);
	void kakaoOptionInfo(AttrOrder attrOrder);
	// 취소
	void kakaoOptionDelete(int orderNo);
	void kakaoOrderDelete(int orderNo);
	// 결제 완료
	void kakaoCompleted(int orderNo);
	
	// 주문내역확인
	List<AttrOrder> reservList(int userNo);
}
