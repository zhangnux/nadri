package com.nadri.restaurant.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nadri.restaurant.vo.Restaurant;

@Mapper
public interface RestaurantMapper {
	
	List<Restaurant> getAllRestaurants();
	List<Restaurant> getRestaurantsByCategory();
	Restaurant getRestaurantDetail(int no);

}
