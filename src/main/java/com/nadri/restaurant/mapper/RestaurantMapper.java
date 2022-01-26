package com.nadri.restaurant.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nadri.restaurant.vo.Category;
import com.nadri.restaurant.vo.City;
import com.nadri.restaurant.vo.Restaurant;
import com.nadri.restaurant.vo.RestaurantReview;
import com.nadri.restaurant.web.form.RestaurantCriteria;


@Mapper
public interface RestaurantMapper {
	
	
	
	List<Restaurant> getAllRestaurants();
	List<Restaurant> getBestRestaurants();
	
	
	Restaurant getRestaurantDetail(int no);
	/*
	void insertRestaurant(Restaurant restaurant);
	*/
	// 레스토랑 검색
	int getRestaurantsTotalRows(RestaurantCriteria criteria);
	List<Restaurant> searchRestaurants(RestaurantCriteria criteria);
	
	List<City> getAllCities();
	List<Category> getAllCategories();
	
	
	
	// 리뷰기능
	
	// 레스토랑 번호로 리뷰 불러오기
	List<RestaurantReview> getAllReviewsByRestaurantNo();
	
	// 리뷰 작성
	void insertReview(RestaurantReview restaurantReview);
	// 리뷰 수정
	void updateReview(RestaurantReview restaurantReview);
	// 리뷰 번호
	void deleteReview(int ReviewNo);
	
	
	

}
