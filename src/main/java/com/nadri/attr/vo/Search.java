package com.nadri.attr.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class Search {

	private String category;
	private String place;
	private String keyword;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startdate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date enddate;
	/*
	 * private int price; 
	 * private int star;
	 */
	
}
