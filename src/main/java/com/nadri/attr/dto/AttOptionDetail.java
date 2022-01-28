package com.nadri.attr.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AttOptionDetail {
	
	private int no;
	private String name;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	private String place;
	private int sales;
	private int star;
	private int price;
	private int discountPrice;
	private String category;
	private String thumbnail;
	private String photo;
	private String address;
	private String detail;	
	private String option;

}
