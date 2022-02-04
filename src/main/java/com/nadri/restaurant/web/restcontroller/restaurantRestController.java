package com.nadri.restaurant.web.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nadri.restaurant.service.RestaurantService;
import com.nadri.restaurant.vo.Restaurant;

@RestController
@RequestMapping("/rest/restaurant")
public class restaurantRestController {

	@Autowired
	private RestaurantService rtService;
	
	
	
	@GetMapping("/detail.nadri")
	public Restaurant detail(int no) {
		Restaurant restaurant = rtService.getRestaurantDetail(no);
		return restaurant;
		
	}
	
	
}
