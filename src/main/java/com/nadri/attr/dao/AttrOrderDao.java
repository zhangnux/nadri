package com.nadri.attr.dao;

import org.apache.ibatis.annotations.Mapper;

import com.nadri.attr.vo.AttrOrderForm;

@Mapper
public interface AttrOrderDao {
	
	AttrOrderForm orderInfo(AttrOrderForm attrOrderForm);
	AttrOrderForm productInfo(AttrOrderForm attrOrderForm);
	
}
