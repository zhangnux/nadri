package com.nadri.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nadri.attr.dao.AttrDao;
import com.nadri.attr.vo.Attraction;
import com.nadri.restaurant.vo.Restaurant;

@Service
@Transactional
public class MainService {

	@Autowired
	private AttrDao attrDao;
	
	public List<Attraction> randomAttraction(){ return attrDao.mainRandomAttr(); }
	public List<Restaurant> randomRestaurant(){ return attrDao.mainRandomRes(); }

}
