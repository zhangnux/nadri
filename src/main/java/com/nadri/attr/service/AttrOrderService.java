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
	
}
