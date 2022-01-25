package com.nadri.restaurant.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nadri.restaurant.mapper.RestaurantMapper;
import com.nadri.restaurant.vo.Restaurant;
import com.nadri.restaurant.vo.RestaurantReview;

@Service
public class RestaurantService {
	
	@Autowired
	private RestaurantMapper rtMapper;
	
	
	public List<Restaurant> getAllRestaurants(){
		return rtMapper.getAllRestaurants();
	}
	
	public List<Restaurant> getRestaurantsByCategory(String category){
		
		return rtMapper.getRestaurantsByCategory();
		
	}
	
	public Restaurant getRestaurantDetail(int no) {
		
		return rtMapper.getRestaurantDetail(no);
	}
	
	
	public void addNewRestaurant (Restaurant restaurant) {	
		rtMapper.insertRestaurant(restaurant);
		
	}
	
	public List<Restaurant> getBestRestaurants(){
		return rtMapper.getBestRestaurants();
	}
	
	
	// 리뷰 서비스
	
	
	
	
	public void addNewReview(RestaurantReview restaurnatReview) {
		rtMapper.insertReview(restaurnatReview);
	}
	
	public void updateReview(RestaurantReview restaurantReview) {
		rtMapper.updateReview(restaurantReview);
	}
	
	public void deleteReview(int reviewNo) {
		rtMapper.deleteReview(reviewNo);
	}
	
	
	
	
	

}
