package com.nadri.restaurant.service;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nadri.restaurant.dto.BookableDto;
import com.nadri.restaurant.mapper.RestaurantMapper;
import com.nadri.restaurant.vo.Category;
import com.nadri.restaurant.vo.City;
import com.nadri.restaurant.vo.Reservation;
import com.nadri.restaurant.vo.ReservationCurrentState;
import com.nadri.restaurant.vo.Restaurant;
import com.nadri.restaurant.vo.RestaurantReview;
import com.nadri.restaurant.vo.Timetable;
import com.nadri.restaurant.web.form.RestaurantCriteria;

@Service
public class RestaurantService {
	
	@Autowired
	private RestaurantMapper rtMapper;
	
	/*
	public void addNewRestaurant () throws Exception {
		// url 지정
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=U8qsjMdizljQtq1Jnkio%2ByXjj2mcv4U6%2B4lD1%2Ft1SZIM64zzJ8PxHmBz8Loej8Kh%2BpCLxA9u4FzGCcKikMwLQw%3D%3D&contentTypeId=39&areaCode=&sigunguCode=&cat1=A05&cat2=A0502&cat3=A05020500&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=P&numOfRows=20&pageNo=1&_type=json";
		
		// JSON 텍스트를 Map<String, Object>로 반환하는 JSONParser 객체 생성
		JSONParser parser = new JSONParser(new URL(url).openStream());
		// JSON 텍스트를 Map<String, Object>로 변환
		Map<String, Object> object = parser.parseObject();
				
		// 음식점 데이터 찾기
		Map<String, Object> response = (Map<String, Object>) object.get("response");
		Map<String, Object> body = (Map<String, Object>) response.get("body");
		Map<String, Object> items = (Map<String, Object>) body.get("items");
		List<Map<String, Object>> itemList = (List<Map<String, Object>>) items.get("item");
				
		// 각 음식점 정보를 꺼내고, 레스토랑 객체에 저장하고, 매퍼를 이용해서 테이블에 저장
		for (Map<String, Object> item : itemList) {
					
			Restaurant restaurant = new Restaurant();
			restaurant.setName((String) item.get("title"));
			restaurant.setTel((String) item.get("tel"));
			restaurant.setPicture((String) item.get("firstimage"));
			restaurant.setAddress((String) item.get("addr1"));
			restaurant.setCityNo(Integer.parseInt(item.get("areacode").toString()));
			restaurant.setLat(Double.parseDouble(item.get("mapx").toString()));
			restaurant.setLon(Double.parseDouble(item.get("mapy").toString()));
			restaurant.setParking("Y");
			restaurant.setRestDate("연중무휴");
			restaurant.setOpenTime("11:00~23:00");
			
			// 기타
			restaurant.setCategoryNo(5);
			rtMapper.insertRestaurant(restaurant);

		}
		
	}
	*/
	

	
	public Restaurant getRestaurantDetail(int no) {
		
		return rtMapper.getRestaurantDetail(no);
	}
	
	public List<Restaurant> getBestRestaurants(){
		return rtMapper.getBestRestaurants();
	}
	
	
	// search 부분
	
	public List<Restaurant> searchRestaurants(RestaurantCriteria criteria){
		return rtMapper.searchRestaurants(criteria);
	}
	
	public int getRestaurantsTotalRows(RestaurantCriteria criteria) {
		return rtMapper.getRestaurantsTotalRows(criteria);
	}
	
	public List<City> getAllCities(){
		return rtMapper.getAllCities();
	}
	
	public List<Category> getAllCategories(){
		return rtMapper.getAllCategories();
	}
	
	
	
	
	
	// 리뷰 서비스
	
	public double getRestaurantStar(int starPoint) {
		return rtMapper.getRestaurantStar(starPoint);
	}
	
	public int getReviewCount(int no) {
		return rtMapper.getReviewCount(no);
	}
	
	public List<RestaurantReview> getAllReviewsByRestaurantNo(int no, int beginIndex, int endIndex){
		return rtMapper.getAllReviewsByRestaurantNo(no, beginIndex, endIndex);
	}
	
	
	
	public void addNewReview(RestaurantReview restaurnatReview) {
		rtMapper.insertReview(restaurnatReview);
	}
	
	public void updateReview(RestaurantReview restaurantReview) {
		rtMapper.updateReview(restaurantReview);
	}
	
	public void deleteReview(int reviewNo) {
		rtMapper.deleteReview(reviewNo);
	}
	
	// 예약
	
	public Timetable getTime(int no) {
		return rtMapper.getTime(no);
	}
	
	public List<Timetable> getAllTimetable(){
		return rtMapper.getAllTimetable();
	}
	
	
	public List<BookableDto> getBookableTime(int restaurantNo, String selectedDate){
		return rtMapper.getBookableTime(restaurantNo, selectedDate);
	}
	
	
	public void reserveRestaurant(int restaurantNo) {
		
		// 쿠폰 사용은?
		
		Restaurant restaurant = rtMapper.getRestaurantDetail(restaurantNo);
		
		
		// 레스토랑 sales +1
		int sales = restaurant.getSales() + 1;
		restaurant.setSales(sales);
		restaurant.setNo(restaurantNo);
		rtMapper.updateRestaurant(restaurant);
		
		Reservation reservation = new Reservation();
		rtMapper.insertReservation(reservation);
		ReservationCurrentState state = new ReservationCurrentState();
		rtMapper.insertCurrentState(state);
		
	}
	
}
