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
	private Restaurant restaurant;	//fk키 restaurant_no
//	private User user;
	private String title;
	private String pricture;
	private String content;
	private int likeCount;
	private int starPoint;
	private Date createdDate;
	
	

}
