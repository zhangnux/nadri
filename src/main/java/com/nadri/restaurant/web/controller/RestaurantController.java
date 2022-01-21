package com.nadri.restaurant.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nadri.restaurant.service.RestaurantService;
import com.nadri.restaurant.vo.Restaurant;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/restaurant")
public class RestaurantController {
	
	@Autowired
	RestaurantService rtService;
	
	
	@GetMapping("/detail")
	public Restaurant restaurant(int no) {
		
		return null;
	}
	

}
