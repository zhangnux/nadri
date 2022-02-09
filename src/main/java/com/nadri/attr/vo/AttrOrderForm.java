package com.nadri.attr.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.nadri.user.vo.User;

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
public class AttrOrderForm {

	private int orderNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date date;
	private int price;
	private int lastPrice;
	private int deposit;
	private int process;
	private int userNo;
	private String phoneNo;
	
	private int attNo;
	private String couponNo;
	private int productQuantity;
	private int optionNo;
	
	private User userInfo;
	private Attraction attraction;
	private AttOption attOption;
	
}
