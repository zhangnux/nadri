package com.nadri.attr.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AttAddForm {
	private int no;
	private String name;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	private String place;
	private int sales;
	private int discountPrice;
	private String category;
	private MultipartFile thumbnail;
	private MultipartFile photo;
	private String address;
	private String detail;
	private int count;
	private double star;
	private double lat;
	private double lng;
	private int optionstat;
	
	private List<Integer> price;
	private List<String> option;

}
