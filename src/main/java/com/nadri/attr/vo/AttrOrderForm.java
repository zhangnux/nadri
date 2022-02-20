package com.nadri.attr.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

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

	private int attNo;
	@JsonFormat(pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date attDate;
	private int userNo;
	private List<Integer> optionNo;
	private List<Integer> productQuantity;
	private int totalQuantity;
	private int couponNo;
	private int price;
	private int lastPrice;
	private String buyerName;
	private String buyerEmail;
	private String buyerTel;
	private String attName;
	private String tid;
	
}
