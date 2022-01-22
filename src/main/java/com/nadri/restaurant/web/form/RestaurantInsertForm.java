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
public class RestaurantInsertForm {
	
	private String name;
	private String content;
	private String category;
	private String address;
	private String city;
	private String parking;
	private String restDate;
	private String tel;
	private String openTime;
	
	private MultipartFile upfiles;

}
