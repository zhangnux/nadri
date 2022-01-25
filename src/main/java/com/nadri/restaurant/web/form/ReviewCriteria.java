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
public class ReviewCriteria {
	
	private int restaurantNo;
	private String word;
	private int beginIndex;
	private int endIndex;

}
