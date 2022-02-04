package com.nadri.restaurant.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Setter
@Getter
@ToString
public class RestaurantReview {
	
	private int no;
	private int restaurantNo;
	private int userNo;
	private String userName;
	private String title;
	private String picture;
	private String content;
	private int rating;
	private Date createdDate;
	
	

}
