package com.nadri.attr.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.nadri.restaurant.vo.Restaurant;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Attraction {

	private int no;
	private String name;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	private String place;
	private int sales;
	private int price;
	private int discountPrice;
	private String category;
	private String thumbnail;
	private String photo;
	private String address;
	private String detail;
	private int count;
	private double star;
	private int purchasedQuantity;
	
	private AttOption attOption;

	
}
