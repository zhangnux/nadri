package com.nadri.restaurant.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nadri.restaurant.vo.Restaurant;
import com.nadri.restaurant.web.form.Criteria;


@Mapper
public interface RestaurantMapper {
	
	
	
	List<Restaurant> getAllRestaurants();
	List<Restaurant> getRestaurantsByCategory();
	List<Restaurant> getBestRestaurants();
	
	Restaurant getRestaurantDetail(int no);
	void insertRestaurant(Restaurant restaurant);
	
	int getRestaurantsTotalRows(Criteria criteria);
	List<Restaurant> searchRestaurants(Criteria criteria);
	
	
	void insertReview();
	void deleteReview();
	

}
