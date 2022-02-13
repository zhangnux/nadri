package com.nadri.attr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nadri.attr.dao.AttrOrderDao;
import com.nadri.attr.vo.AttrOrder;

@Service
@Transactional
public class AttrOrderService {

	@Autowired
	private AttrOrderDao orderDao;
	
	public AttrOrder getOrderInfo(AttrOrder orderForm){ 
		return orderDao.orderInfo(orderForm);
	}
	
	public AttrOrder getProductInfo(AttrOrder orderForm){
		return orderDao.productInfo(orderForm); 
	}
	
	/* 오더정보 추가 */
	public void addDepositOrder(AttrOrder attrOrder) {
		orderDao.depositOrderInfo(attrOrder);
	}
	public void addDepositOption(AttrOrder attrOrder) {
		orderDao.depositOptionInfo(attrOrder);
	}
	/* 쿠폰 사용여부 변경 */
	public void couponUsedStat(int userNo, int couponNo) {
		orderDao.couponUsed(userNo, couponNo);
	}
	
}
