package com.nadri.attr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nadri.attr.mapper.AttrOrderMapper;
import com.nadri.attr.vo.AttrOrder;

@Service
@Transactional
public class AttrOrderService {

	@Autowired
	private AttrOrderMapper orderMapper;
	
	public AttrOrder getOrderInfo(AttrOrder orderForm){ 
		return orderMapper.orderInfo(orderForm);
	}
	
	public AttrOrder getProductInfo(AttrOrder orderForm){
		return orderMapper.productInfo(orderForm); 
	}
	
	/* 무통장 오더정보 추가 */
	public void addDepositOrder(AttrOrder attrOrder) {
		orderMapper.depositOrderInfo(attrOrder);
	}
	public void addDepositOption(AttrOrder attrOrder) {
		orderMapper.depositOptionInfo(attrOrder);
	}
	public void addSalesCount(int attNo) {
		orderMapper.salesQuantity(attNo);
	}
	/* 쿠폰 사용여부 변경 */
	public void couponUsedStat(int userNo, int couponNo) {
		orderMapper.couponUsed(userNo, couponNo);
	}
	
	/* 카카오페이*/
	// 오더정보 추가
	public int  addKakaoOrder(AttrOrder attrOrder) {
		orderMapper.kakaoOrderInfo(attrOrder);
		return attrOrder.getOrderNo();
	}
	public void addKakaoOption(AttrOrder attrOrder) {
		orderMapper.kakaoOptionInfo(attrOrder);
	}
	// 오더정보 삭제
	public void deleteKakaoOption(int orderNo) {
		orderMapper.kakaoOptionDelete(orderNo);
	}
	public void deleteKakaoOrder(int orderNo) {
		orderMapper.kakaoOrderDelete(orderNo);
	}
	// 결제상태 변경
	public void kakaoPayCompleted(int orderNo) {
		orderMapper.kakaoCompleted(orderNo);
	}
	
	/* 예약내역 확인 */
	public List<AttrOrder> getReservList(int userNo){
		return orderMapper.reservList(userNo);
	}
	/* 예약상세내역확인 */
	public List<AttrOrder> getReservDetail(int orderNo, int userNo){
		return orderMapper.detailOrderInfo(orderNo, userNo);
	}
	
}
