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
	private AttrOrderMapper orderDao;
	
	public AttrOrder getOrderInfo(AttrOrder orderForm){ 
		return orderDao.orderInfo(orderForm);
	}
	
	public AttrOrder getProductInfo(AttrOrder orderForm){
		return orderDao.productInfo(orderForm); 
	}
	
	/* 무통장 오더정보 추가 */
	public void addDepositOrder(AttrOrder attrOrder) {
		orderDao.depositOrderInfo(attrOrder);
	}
	public void addDepositOption(AttrOrder attrOrder) {
		orderDao.depositOptionInfo(attrOrder);
	}
	public void addSalesCount(int attNo) {
		orderDao.salesQuantity(attNo);
	}
	/* 쿠폰 사용여부 변경 */
	public void couponUsedStat(int userNo, int couponNo) {
		orderDao.couponUsed(userNo, couponNo);
	}
	
	/* 카카오페이*/
	// 오더정보 추가
	public int  addKakaoOrder(AttrOrder attrOrder) {
		orderDao.kakaoOrderInfo(attrOrder);
		return attrOrder.getOrderNo();
	}
	public void addKakaoOption(AttrOrder attrOrder) {
		orderDao.kakaoOptionInfo(attrOrder);
	}
	// 오더정보 삭제
	public void deleteKakaoOption(int orderNo) {
		orderDao.kakaoOptionDelete(orderNo);
	}
	public void deleteKakaoOrder(int orderNo) {
		orderDao.kakaoOrderDelete(orderNo);
	}
	// 결제상태 변경
	public void kakaoPayCompleted(int orderNo) {
		orderDao.kakaoCompleted(orderNo);
	}
	
	/* 예약내역 확인 */
	public List<AttrOrder> getReservList(int userNo){
		return orderDao.reservList(userNo);
	}
}
