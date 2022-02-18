package com.nadri.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nadri.attr.mapper.AttrMapper;
import com.nadri.attr.vo.Attraction;
import com.nadri.restaurant.vo.Restaurant;

@Service
@Transactional
public class MainService {

	@Autowired
	private AttrMapper attrMapper;
	
	public List<Attraction> randomAttraction(){ return attrMapper.mainRandomAttr(); }
	public List<Restaurant> randomRestaurant(){ return attrMapper.mainRandomRes(); }

}
