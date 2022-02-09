package com.nadri.restaurant.web.form;

import org.springframework.web.multipart.MultipartFile;

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
public class RestaurantReviewInsertForm {
	
	private int reviewNo;
	private int restaurantNo;
	private int rating;
	private String content;
	private MultipartFile upfile;

}
