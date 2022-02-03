package com.nadri.restaurant.web.form;

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
public class RestaurantCriteria {
	
	private String category;
	private String city;
	private String name;
	private int beginIndex;
	private int endIndex;
	private String sort;
	
}
